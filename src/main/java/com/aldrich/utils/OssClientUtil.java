package com.aldrich.utils;
import com.alibaba.druid.util.StringUtils;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.net.URL;
import java.util.Date;
import java.util.Random;

/**
 * @ClassName OssClientUtil
 * @Description 阿里云图片上传工具包
 * @Author Aldrich
 * @Date 2019/4/15 10:08
 * @Version 1.0
 */
public class OssClientUtil {

    /**
     *注册日志工厂
     */
     private static final Logger LOG = LoggerFactory.getLogger(OssClientUtil.class);

    /**
     *阿里云OSS的外网域名
     */
    private static String ENDPOINT;

    /**
     *阿里云OSS的密钥Access Key ID
     */
    private static String ACCESS_KEY_ID;

    /**
     *阿里云OSS的密钥Access Key Secret
     */
    private static String ACCESS_KEY_SECRET;

    /**
     *阿里云OSS的bucketName值
     */
    private String bucketName = "aldrich";

    /**
     *阿里云OSS的bucketName下的对象等价于文件夹
     */
    private String fileDir = "image/StudyPlatform/avatar/";

    /**
     * 声明ossClient
     */
    private OSSClient ossClient;

    //从配置文件中加载属性值
    static {
        ENDPOINT = PropertiesUtils.getProperty("endpoint");
        ACCESS_KEY_ID = PropertiesUtils.getProperty("accessKeyId");
        ACCESS_KEY_SECRET = PropertiesUtils.getProperty("accessKeySecret");
    }


    public OssClientUtil() {
        //OSSClient是OSS服务的Java客户端，它为调用者提供了一系列的方法，用于和OSS服务进行交互。
        ossClient = new OSSClient(ENDPOINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
    }

    /**
     * 初始化ossClient
     */
    public void init() {
        ossClient = new OSSClient(ENDPOINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
    }

    /**
     * 销毁ossClient
     */
    public void destory() {
        ossClient.shutdown();
    }

    /**
     * @Author aldrich
     * @Description 通过URL上传图片
     * @Date 15:21 2019/4/15
     * @Param [url]
     * @return void
     */
    public void uploadImgOss(String url) throws Exception {
        File fileOnServer = new File(url);
        FileInputStream fin;
        try {
            fin = new FileInputStream(fileOnServer);
            String[] split = url.split("/");
            this.uploadFileOSS(fin, split[split.length - 1]);
        } catch (FileNotFoundException e) {
            throw new Exception("图片上传失败");
        }
    }

    /**
     * @Author aldrich
     * @Description 直接上传本地的文件
     * @Date 15:22 2019/4/15
     * @Param [file]
     * @return java.lang.String
     */
    public String uploadImgOss(MultipartFile file) throws Exception {
        if (file.getSize() > 1024 * 1024) {
            throw new Exception("上传图片大小不能超过1M！");
        }
        String originalFilename = file.getOriginalFilename();
        String substring = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
        Random random = new Random();
        String name = random.nextInt(10000) + System.currentTimeMillis() + substring;
        try {
            InputStream inputStream = file.getInputStream();
            this.uploadFileOSS(inputStream, name);
            return name;
        } catch (Exception e) {
            throw new Exception("图片上传失败");
        }
    }



     /**
      * @Author aldrich
      * @Description 获得图片路径
      * @Date 9:28 2019/4/16
      * @Param [fileUrl]
      * @return java.lang.String
      */
    public String getImgUrl(String fileUrl) {
        System.out.println("fileUrl:"+fileUrl);
        if (!StringUtils.isEmpty(fileUrl)) {
            String[] split = fileUrl.split("/");
            return this.getUrl(this.fileDir + split[split.length - 1]);
        }
        return null;
    }


    /**
     * @Author aldrich
     * @Description 上传到OSS服务器  如果同名文件会覆盖服务器上的
     * @Date 9:42 2019/4/16
     * @Param [instream 文件流, fileName 文件名称 包括后缀名 ]
     * @return 出错返回"" ,唯一MD5数字签名
     */
    public String uploadFileOSS(InputStream instream, String fileName) throws Exception {
        String ret = "";
        try {
            //创建上传Object的Metadata
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(instream.available());
            objectMetadata.setCacheControl("no-cache");
            objectMetadata.setHeader("Pragma", "no-cache");
            objectMetadata.setContentType(getcontentType(fileName.substring(fileName.lastIndexOf("."))));
            objectMetadata.setContentDisposition("inline;filename=" + fileName);
            //上传文件
            PutObjectResult putResult = ossClient.putObject(bucketName, fileDir + fileName, instream, objectMetadata);
            ret = putResult.getETag();
        } catch (IOException e) {
            LOG.error(e.getMessage(), e);
        } finally {
            try {
                if (instream != null) {
                    instream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return ret;
    }


    /**
     * @Author aldrich
     * @Description 判断OSS服务文件上传时文件的contentType
     * @Date 9:41 2019/4/16
     * @Param [FilenameExtension]文件后缀
     * @return java.lang.String
     */
    public static String getcontentType(String FilenameExtension) {
        if (FilenameExtension.equalsIgnoreCase(".bmp")) {
            return "image/bmp";
        }
        if (FilenameExtension.equalsIgnoreCase(".gif")) {
            return "image/gif";
        }
        if (FilenameExtension.equalsIgnoreCase(".jpeg") ||
                FilenameExtension.equalsIgnoreCase(".jpg") ||
                FilenameExtension.equalsIgnoreCase(".png")) {
            return "image/jpeg";
        }
        if (FilenameExtension.equalsIgnoreCase(".html")) {
            return "text/html";
        }
        if (FilenameExtension.equalsIgnoreCase(".txt")) {
            return "text/plain";
        }
        if (FilenameExtension.equalsIgnoreCase(".vsd")) {
            return "application/vnd.visio";
        }
        if (FilenameExtension.equalsIgnoreCase(".pptx") ||
                FilenameExtension.equalsIgnoreCase(".ppt")) {
            return "application/vnd.ms-powerpoint";
        }
        if (FilenameExtension.equalsIgnoreCase(".docx") ||
                FilenameExtension.equalsIgnoreCase(".doc")) {
            return "application/msword";
        }
        if (FilenameExtension.equalsIgnoreCase(".xml")) {
            return "text/xml";
        }
        return "image/jpeg";
    }


     /**
      * @Author aldrich
      * @Description 获得url链接
      * @Date 9:41 2019/4/16
      * @Param [key]
      * @return java.lang.String
      */
    public String getUrl(String key) {
        // 设置URL过期时间为10年  3600l* 1000*24*365*10
        Date expiration = new Date(System.currentTimeMillis() + 3600l * 1000 * 24 * 365 * 10);
        // 生成URL
        URL url = ossClient.generatePresignedUrl(bucketName, key, expiration);
        System.out.println("url"+url);
        if (url != null) {
            return url.toString();
        }
        return null;
    }

}
