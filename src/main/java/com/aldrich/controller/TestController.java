package com.aldrich.controller;

import com.aldrich.service.AdminService;
import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @ClassName TestController
 * @Description TODO
 * @Author Aldrich
 * @Date 2019/4/8 10:14
 * @Version 1.0
 */

@Controller
@RequestMapping("test")
public class TestController {

    @Resource
    private AdminService adminService;


    /**
     * 上传照片
     * */
    @PostMapping(value = "/upload/img")
    public String uploadImg(HttpServletRequest request,@RequestParam("file") MultipartFile file, HttpServletResponse response) throws IOException {

        String newFileName = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS"); //获取当前时间作为文件名的前半部分
        newFileName = sdf.format(new Date());
        //取三位数的随机数 作为文件名的后半部分
        Random rd = new Random();
        for(int i=0;i<3;i++){
            newFileName = newFileName + rd.nextInt(10);
        }
        System.out.println("随机的文件名为："+newFileName);
        //获取文件全名称
        String originalFilename =file.getOriginalFilename();
        System.out.println("文件全名称:"+originalFilename);
        //获取后缀
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        System.out.println("上传文件的后缀："+suffix);
        /**
         * 开始上传
         */
       /* InputStream is = null ;
        try {
            long size = file.getSize();
            if(!file.isEmpty()){
                is = file.getInputStream();
                //以下为上传到阿里服务器
                String fileDir = OSSUnit.fileDir();
                newFileName=fileDir+OSSUnit.newFileName(file.getOriginalFilename());
                OSSUnit.uploadObject(ossClient, is, newFileName, bucketName,size);
            } else {
                throw new IOException("文件名为空!");
            }
            String endPontUrl =  this.ossClient.getEndpoint().toString();
            endPontUrl = endPontUrl.substring(7);
            String url =  "http://"+this.bucketName+"."+endPontUrl+"/"+newFileName;
            result = new FileUploadResult ("SUCCESS",url,originalFileName,originalFileName); //上传到阿里服务器，返回文件路径
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            result = new FileUploadResult ("文件上传失败","","","");
        }

*/

        //绝对路径
        String fullPath = "http://39.105.101.59:8001/image/StudyPlatform"+newFileName+suffix;
        //相对路径
        String relativePath = "/upload/"+newFileName+suffix;
        //上传

        Map<String,String> map = new HashMap<String, String>();
       // map.put("fullPath", fullPath); //将绝对路径存入map集合
       // map.put("relativePath", relativePath);  //将相对路径存入map集合
        map.put("src", fullPath);
        map.put("title", relativePath);

        System.out.println("全路径"+fullPath);
        System.out.println("相对路径"+relativePath);

        JSONObject resObj = new JSONObject();
        resObj.put("code",0);
        resObj.put("msg","");
        resObj.put("data",map);
        System.out.println(map.toString());
        ResponseUtil.writeResp(response,resObj.toJSONString());
        return null;
    }

}
