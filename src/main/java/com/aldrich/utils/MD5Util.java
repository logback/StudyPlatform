package com.aldrich.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * @author aldrich
 * @date 2019/1/2 10:27
 */
public class MD5Util {

    public static String md5(String str,String salt){
        return new Md5Hash(str,salt).toString() ;
    }

    public static Object saltMd5(String str,String salts)
    {
        //加密方式
        String hashAlgorithmName = "MD5";
        //加密1024次
        int hashIterations = 1024;
        Object result = new SimpleHash(hashAlgorithmName, str, salts,hashIterations);
        return  result;
    }


    public static Object personalMd5(String account,String password){
        //加密方式
        String hashAlgorithmName = "MD5";
        //密码原值
        String crdentials =password;
        //盐值
        String salt =account;
        //加密1024次
        int hashIterations = 1024;
        String result = new SimpleHash(hashAlgorithmName,crdentials,salt,hashIterations).toString();
        password=result+"";
       // System.out.println(saltMd5("password","12345"));
     //  System.out.println(password);
        return password;
    }

    public static   void  main(String[] args) {
        //加密方式
        String hashAlgorithmName = "MD5";
        //密码原值
        Object crdentials = "123456";
        //盐值
        Object salt = "18756076151";
        //加密1024次
        int hashIterations = 1024;
        String pwd=null;
        Object result = new SimpleHash(hashAlgorithmName,crdentials,salt,hashIterations);
        System.out.println(result);

    }
}
