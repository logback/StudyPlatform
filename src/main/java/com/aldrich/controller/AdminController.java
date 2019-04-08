package com.aldrich.controller;


import com.aldrich.model.Admin;
import com.aldrich.service.impl.AdminServiceImpl;
import com.aldrich.utils.*;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/12/10 14:42
 */
@Controller
@RequestMapping("admin")
public class AdminController {


    @Resource
    private Admin admin;

    @Resource
    private AdminServiceImpl adminService;
    /**
     * 管理员主页面
     * */
    @GetMapping("/backstage/show")
    public ModelAndView viewShow()
    {
        String mv="aldrich/backstage/admin";
        return ModelView.createView(mv);
    }



    /**
     *后台管理管理员界面
     * */
    @GetMapping("/manager")
    public ModelAndView viewManager(HttpSession session)
    {
        session.setAttribute("sign",1);
        String mv = "aldrich/backstage/mAdmin";
        return ModelView.createView(mv);
    }



    /**
     * 获取所有的管理员
     * */
    @PostMapping(value = "allAdmins",produces = "application/json ;charset=UTF-8")
    public String getAllAdmins(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<Admin> list = adminService.getLimitAdmins(PageUtil.createPageMap(page,limit));
        int total = adminService.getTotalAdmins();
        String admins = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,admins);
        return null;
    }

    /**
     *批量删除
     **/
    @PostMapping(value = "/deleteByIds",produces = "application/json ;charset=UTF-8")
    public String deleteByIds(@RequestParam("accounts") String accounts, HttpServletResponse response){

        String[] ids = accounts.split(",");
        List<Admin> admins = adminService.deleteByIds(ids);
        int total = admins.size();
        String string = ResponseUtil.createJson(0,"成功",total,admins);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    /**
     *单独删除
     **/
    @PostMapping(value = "/deleteById",produces = "application/json ;charset=UTF-8")
    public String deleteById(@RequestParam("account") String account, HttpServletResponse response) {
        String string=adminService.deleteById(account);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    /**
     * 上传照片
     * */
    @PostMapping(value = "/upload/img")
    public String uploadImg(HttpServletRequest req, @RequestParam("file") MultipartFile file, HttpServletResponse response) throws IOException {
        System.out.println(file.getName());
        String string = adminService.imgUpload(file);
        ResponseUtil.writeResp(response,string);
        return null;
    }

    /**
     * 保存管理员
     * */
    @PostMapping(value = "submit/data",produces = "application/json ;charset=UTF-8")
    public String saveAdmin(@RequestParam("account") String account,
                            @RequestParam("name") String name,
                            @RequestParam("pwd") String pwd,
                            @RequestParam("role") String role,
                            @RequestParam("img") String img,
                            @RequestParam("time") String time,
                            @RequestParam("email") String email, HttpServletResponse response) throws ParseException {

        int rs=adminService.saveAdmin(account,name,role,time,pwd,img,email);
        JSONObject decide = new JSONObject();
        decide.put("code",rs);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }





    /**
     * 修改管理员
     * */
    @PostMapping(value = "submit/update")
    @ResponseBody
    public String updateAdmin(@RequestParam("account") String account,
                              @RequestParam("name") String name,
                              @RequestParam("pwd") String pwd,
                              @RequestParam("role") String role,
                              @RequestParam("img") String img,
                              @RequestParam("email") String email, HttpServletResponse response){

        int rs=adminService.updateInfo(account,name,role,pwd,img,email);
        JSONObject decide = new JSONObject();
        decide.put("code",rs);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }

    /**
     * 设置权限
     * */
    @PostMapping(value = "submit/authorize")
    @ResponseBody
    public String authorize(@RequestParam("state") String state,
                            @RequestParam("account") String account,HttpServletResponse response)
    {
        System.out.println(state);
        System.out.println(account);
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("state",state);
        int rs = adminService.updateAuthor(map);
        JSONObject decide = new JSONObject();
        decide.put("code",rs);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }



    /**
     * 返回搜索集合
     * */
    @PostMapping(value = "/search",produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String search(@RequestParam("account") String account,
                         @RequestParam("name") String name,
                         @RequestParam("time") String time, HttpServletResponse response)
    {
        System.out.println(account);
        System.out.println(name);
        System.out.println(time);
        List<Admin> admins=new ArrayList<>();
        admins=adminService.searchAdmin(account,name,time);
        int total=1;
        System.out.println(admins);

        String string = ResponseUtil.createJson(0,"成功",total,admins);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    @GetMapping(value = "/forwardAdmin")
    public ModelAndView  getAdmin(@RequestParam("account") String account,  HttpSession session)
    {
        System.out.println(account);
        String mv = "aldrich/backstage/mAdmin";
        ModelAndView view =new ModelAndView(mv);
        view.addObject("account",account);
        return view;
    }



    /**
     * 创建管理员session
     * */
    @GetMapping(value = "/getAdmin",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String loadResource(HttpSession session, HttpServletResponse response)
    {
        admin= (Admin) session.getAttribute("Admin");
        String string = JSONObject.toJSONString(admin);
        ResponseUtil.writeResp(response,string);
        System.out.println(string);
        return null;
    }


    /**
     * 通过账号获得管理员信息
     *
     * @param account
     * @param response*/
    @GetMapping(value = "/getAdminByAccount",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getAdminByAccount(@RequestParam("account") String account, HttpServletResponse response)
    {
        admin=adminService.searchById(account);
        String string = JSONObject.toJSONString(admin);
        ResponseUtil.writeResp(response,string);
        return null;
    }

}