package com.aldrich.service;

import com.aldrich.model.User;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.Set;


public interface UserService {
    /**
     * 验证用户登录
     * @param map
     * @return rs
     * */
    User decideLogin(Map map);


    /**
     * 获取所有的用户记录
     * @return int
     **/
    int getTotalUsers();


    /**
     * 获取所有的用户信息
     * @return list
     **/
    List<User> getAllUsers();

    /**
     * 获取分页的的用户信息
     * @param map
     * @return list
     **/
    List<User>  getLimitUsers(Map map);

    /**
     * 依据账号删除用户
     * @param account
     * @return int
     * */
    String   deleteById(String account);

    /**
     * 依据账号批量删除用户
     * @param accounts
     * @return int
     * */
    List<User>  deleteByIds(String[] accounts);

    /**
     * 保存用户
     * @param account,name,role,time,pwd,img,email
     * @return rs
     * */
    int  saveUser(String account,String name,String role,String time,String pwd,String img,String email) throws ParseException;


    /**
     * 更新用户
     * @param account,name,role,pwd,img,email
     * @return rs
     * */
    int updateInfo(String account,String name,String role,String pwd,String img,String email);

//    /**
//     * 更新权限
//     * @param map
//     * @return rs
//     * */
//    int updateAuthor(Map map);

    /**
     * 上传头像
     * @param file
     * @return string
     * @exception IOException
     * */
    String imgUpload(MultipartFile file) throws IOException;


    /**
     * 依据账号查找用户
     * @param account
     * @return user
     * */
    User searchById(String account);

    /**
     * 依据昵称查找用户
     * @param name
     * @return user
     * */
    User searchByName(String name);


    /**
     * 依据邮箱查找用户
     * @param email
     * @return user
     * */
    User searchByEmail(String email);

    /**
     * 依据时间查询一周之内的数据
     * @param time
     * @return user
     * */
    List<User> searchByTime(String time);

    /**
     * 综合查找用户
     * @param account
     * @param name
     * @param time
     * @return user
     * */
    List<User> searchUser(String account,String name,String time);


    /**
     * 依据姓名查询角色
     * @param account
     * @return role
     * */
    Set<String>  findRoles(String account);

    /**
     * 依据姓名查询权限
     * @param name
     * @return Permissions
     * */
    Set<String> findPermissions(String name);

}
