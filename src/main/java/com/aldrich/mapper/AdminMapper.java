package com.aldrich.mapper;

import com.aldrich.model.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/12/10 14:47
 */
@Repository
public interface AdminMapper {

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
     * 获取所有的管理员记录
     * @return int
     **/
    int getTotalAdmins();

    /**
     * 验证用户登录
     * @param map
     * @return rs
     * */
    Admin login(Map map);

    /**
     * 依据账号删除管理员
     * @param account
     * @return int
     * */
    int  deleteById(String account);

    /**
     * 保存管理员
     * @param admin
     * @return rs
     * */
    int  saveAdmin(Admin admin);

    /**
     * 更新管理员
     * @param admin
     * @return rs
     * */
    int updateInfo(Admin admin);

    /**
     * 更新权限
     * @param map
     * @return rs
     * */
    int updateAuthor(Map map);


    /**
     * 依据账号查找管理员
     * @param account
     * @return admin
     * */
    Admin searchById(String account);

    /**
     * 依据昵称查找管理员
     * @param name
     * @return admin
     * */
    Admin searchByName(String name);

    /**
     * 依据右键查找管理员
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


}
