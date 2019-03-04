package com.aldrich.controller;

import com.aldrich.mapper.PermissionMapper;
import com.aldrich.model.Admin;
import com.aldrich.model.Permission;
import com.aldrich.model.Role;
import com.aldrich.service.impl.PermissionServiceImpl;
import com.aldrich.service.impl.RoleServiceImpl;
import com.aldrich.utils.ModelView;
import com.aldrich.utils.PageUtil;
import com.aldrich.utils.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author aldrich
 * @date 2019/1/2 20:54
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleServiceImpl roleService;

    @Resource
    private PermissionServiceImpl permissionService;

    /**
     * 角色页面
     * */
    @GetMapping("/list")
    public ModelAndView viewRoleList()
    {
        String mv="aldrich/backstage/role";
        return ModelView.createView(mv);
    }


    /**
     * 管理员角色主页面
     * */
    @GetMapping("/assign")
    public ModelAndView viewRoleAssign()
    {
        String mv="aldrich/backstage/assign";
        return ModelView.createView(mv);
    }


    /**
     * 主页面
     * */
    @GetMapping("/permission")
    public ModelAndView viewRolePermission()
    {
        String mv="aldrich/backstage/permission";
        return ModelView.createView(mv);
    }

    /**
     * 管理员角色主页面
     * */
    @GetMapping("/permissionAssign")
    public ModelAndView viewRolePermissionAssign()
    {
        String mv="aldrich/backstage/permissionAssign";
        return ModelView.createView(mv);
    }



    /**
     * 获取所有的角色
     * */
    @PostMapping(value = "/allRole",produces = "application/json ;charset=UTF-8")
    public String getAllAdmins(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<Role> list = roleService.limitRole(PageUtil.createPageMap(page,limit));
        int total = roleService.roleTotal();
        String role = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,role);
        return null;
    }

    /**
     * 获取所有的管理员角色
     * */
    @PostMapping(value = "/allRoles",produces = "application/json ;charset=UTF-8")
    public String getAllRoles(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<Role> list = roleService.limitRoles(PageUtil.createPageMap(page,limit));
        int total = roleService.roleTotals();
        String roles = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,roles);
        return null;
    }

    /**
     * 获取所有的角色
     * */
    @PostMapping(value = "/allPermission",produces = "application/json ;charset=UTF-8")
    public String getAllPermission(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<Permission> list = permissionService.limitPermission(PageUtil.createPageMap(page,limit));
        int total = permissionService.permissionTotal();
        String permission = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,permission);
        return null;
    }

    /**
     * 获取所有的管理员角色
     * */
    @PostMapping(value = "/allPermissions",produces = "application/json ;charset=UTF-8")
    public String getAllPermissions(@RequestParam("page") int page,
                              @RequestParam("limit") int limit,
                              HttpServletResponse response)
    {
        List<Permission> list = permissionService.limitPermissions(PageUtil.createPageMap(page,limit));
        int total = permissionService.permissionTotals();
        String permissions = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,permissions);
        return null;
    }



}
