package com.aldrich.service.impl;

import com.aldrich.mapper.RoleMapper;
import com.aldrich.model.Role;
import com.aldrich.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2019/1/2 20:52
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<Role> selectRole() {
        return this.roleMapper.selectRole();
    }

    @Override
    public int roleTotal() {
        return this.roleMapper.roleTotal();
    }

    @Override
    public List<Role> limitRole(Map map) {
        return this.roleMapper.limitRole(map);
    }

    @Override
    public List<Role> selectRoles() {
        return this.roleMapper.selectRoles();
    }

    @Override
    public int roleTotals() {
        return this.roleMapper.roleTotals();
    }

    @Override
    public List<Role> limitRoles(Map map) {
        return this.roleMapper.limitRoles(map);
    }


}
