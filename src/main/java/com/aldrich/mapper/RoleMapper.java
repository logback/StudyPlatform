package com.aldrich.mapper;

import com.aldrich.model.Role;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2019/1/2 20:18
 */
@Repository("roleMapper")
public interface RoleMapper {

    /**
     * 获取所有的角色信息
     * @return list
     **/
    List<Role> selectRole();

    /**
     * 获取所有的角色记录
     * @return int
     **/
    int  roleTotal();


    /**
     * 获取分页的的角色信息
     * @param map
     * @return list
     **/
    List<Role> limitRole(Map map);


    /**
     * 获取所有的管理员角色详细信息
     * @return list
     **/
    List<Role> selectRoles();


    /**
     * 获取所有的管理员角色记录
     * @return int
     **/
    int  roleTotals();

    /**
     * 获取分页的的管理员角色信息
     * @param map
     * @return list
     **/
    List<Role> limitRoles(Map map);

}
