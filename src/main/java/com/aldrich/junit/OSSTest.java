package com.aldrich.junit;

import com.aldrich.utils.OSSUnit;
import com.aliyun.oss.OSSClient;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;

/**
 * @ClassName OSSTest
 * @Description TODO
 * @Author Aldrich
 * @Date 2019/4/8 16:06
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-mybatis.xml"})
public class OSSTest {


    private static final Logger LOG = LoggerFactory.getLogger(OSSUnit.class);

    private OSSUnit ossunit = null;
    private OSSClient client = null;
    private String bucketName = "aldrich";

    @org.junit.Before
    public void initUnit(){
        ossunit = new OSSUnit();
        client = OSSUnit.getOSSClient();
    }


    @org.junit.Test
    public void test12()
    {
        String flilePathName = "E:/Photograph/a3.jpg";
        File file = new File(flilePathName);
        String diskName = "image/StudyPlatform/";
        String md5key = OSSUnit.uploadObject2OSS(client, file, bucketName, diskName);
        LOG.info("上传后的文件MD5数字唯一签名:" + md5key);
    }


}
