package com.aldrich.mapper;

import com.aldrich.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author aldrich
 * @date 2018/12/24 8:53
 */
@Repository
public interface UserMapper {
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
     * 获取所有的用户记录
     * @return int
     **/
    int getTotalUsers();

    /**
     * 验证用户登录
     * @param map
     * @return rs
     * */
    User login(Map map);

    /**
     * 依据账号删除用户
     * @param account
     * @return int
     * */
    int  deleteById(String account);

    /**
     * 保存用户
     * @param user
     * @return rs
     * */
    int  saveUser(User user);

    /**
     * 更新用户
     * @param user
     * @return rs
     * */
    int updateInfo(User user);


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
     * 依据姓名查询角色
     * @param account
     * @return role
     * */
    Set<String>     findRole(String account);

    /**
     * 依据姓名查询权限
     * @param name
     * @return Permissions
     * */
    Set<String> findPermissions(String name);

}
