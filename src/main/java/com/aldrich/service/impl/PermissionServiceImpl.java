package com.aldrich.service.impl;

import com.aldrich.mapper.PermissionMapper;
import com.aldrich.model.Permission;
import com.aldrich.service.PermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2019/1/2 22:02
 */
@Service("permissionServiceImpl")
public class PermissionServiceImpl implements PermissionService {

   @Resource
   private PermissionMapper permissionMapper;


    @Override
    public List<Permission> selectPermission() {

        return this.permissionMapper.selectPermission();
    }

    @Override
    public int permissionTotal() {

        return this.permissionMapper.permissionTotal();
    }

    @Override
    public List<Permission> limitPermission(Map map) {

        return this.permissionMapper.limitPermission(map);
    }

    @Override
    public List<Permission> selectPermissions() {

        return this.permissionMapper.selectPermissions();
    }


    @Override
    public int permissionTotals() {

        return this.permissionMapper.permissionTotals();
    }

    @Override
    public List<Permission> limitPermissions(Map map) {
        return this.permissionMapper.limitPermissions(map);
    }
}
