package com.aldrich.service;

import com.aldrich.model.Admin;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/12/10 15:27
 */
public interface AdminService {



    /**
     * 验证用户登录
     * @param map
     * @return rs
     * */
    Admin decideLogin(Map map);


    /**
     * 获取所有的管理员记录
     * @return int
     **/
    int getTotalAdmins();


    /**
     * 获取所有的管理员信息
     * @return list
     **/
    List<Admin> getAllAdmins();

    /**
     * 获取分页的的管理员信息
     * @param map
     * @return list
     **/
    List<Admin>  getLimitAdmins(Map map);

    /**
     * 依据账号删除管理员
     * @param account
     * @return int
     * */
    String   deleteById(String account);

    /**
     * 依据账号批量删除管理员
     * @param accounts
     * @return int
     * */
    List<Admin>  deleteByIds(String[] accounts);

    /**
     * 保存管理员
     * @param account,name,role,time,pwd,img,email
     * @return rs
     * */
    int  saveAdmin(String account,String name,String role,String time,String pwd,String img,String email) throws ParseException;


    /**
     * 更新管理员
     * @param account,name,role,pwd,img,email,state
     * @return rs
     * */
    int updateInfo(String account,String name,String role,String pwd,String img,String email);

    /**
     * 更新权限
     * @param map
     * @return rs
     * */
    int updateAuthor(Map map);

    /**
     * 上传头像
     * @param file
     * @return string
     * @exception IOException
     * */
    String imgUpload(MultipartFile file) throws IOException;


    /**
     * 依据账号查找管理员
     * @param account
     * @return admin
     * */
    Admin searchById(String account) throws Exception;

    /**
     * 依据昵称查找管理员
     * @param name
     * @return admin
     * */
    Admin searchByName(String name);


    /**
     * 依据昵称查找管理员
     * @param email
     * @return admin
     * */
    Admin searchByEmail(String email);

    /**
     * 依据时间查询一周之内的数据
     * @param time
     * @return admin
     * */
    List<Admin> searchByTime(String time);

    /**
     * 综合查找管理员
     * @param account
     * @param name
     * @param time
     * @return admin
     * */
    List<Admin> searchAdmin(String account,String name,String time);


    /**
     * @Author aldrich
     * @Description oss图片上传
     * @Date 8:46 2019/4/15
     * @Param [file]
     * @return java.lang.String
     */
    String ossImgUpload(MultipartFile file) throws IOException, Exception;


}