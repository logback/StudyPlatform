package com.aldrich.controller;

import com.aldrich.model.User;
import com.aldrich.service.impl.PersonalServiceImpl;
import com.aldrich.utils.*;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("personal")
public class PersonalController {
    @Resource
    private User user;

    @Resource
    private PersonalServiceImpl personalService;


    //个人中心主页面
    @GetMapping("/home")
    public ModelAndView personalHome() {
        String mv = "Trahald/personal/personal";
        return ModelView.createView(mv);
    }
    //头像
    @GetMapping("/head")
    public ModelAndView personalHead() {
        String mv = "Trahald/personal/crowdfunding.center/make_head";
        return ModelView.createView(mv);
    }
    //密码
    @GetMapping("/password")
    public ModelAndView personalPassword() {
        String mv = "Trahald/personal/crowdfunding.center/make_password";
        return ModelView.createView(mv);
    }
    //info
    @GetMapping("/info")
    public ModelAndView personalInfo() {
        String mv = "Trahald/personal/crowdfunding.center/my_info";
        String account = (String) SecurityUtils.getSubject().getPrincipal();

        return ModelView.createView(mv);
    }

    @RequestMapping("/updateName")
    @ResponseBody
    public String updateAll(@RequestParam("name") String name,
                             @RequestParam("email") String email,
                             HttpServletResponse response){
        String account = (String) SecurityUtils.getSubject().getPrincipal();
        int updateAll = personalService.updateAll(name,email,account);
        JSONObject json=new JSONObject();
        json.put("code",updateAll);
        ResponseUtil.writeResp(response,json.toJSONString());
        return null;
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public String updatePassword(@RequestParam("password") String password,
                            @RequestParam("newPassword") String newPassword,
                            HttpServletResponse response){
        String account = (String) SecurityUtils.getSubject().getPrincipal();

        //尚未完成
     //   password= GetMD5.getMD5(password);
       // newPassword= GetMD5.getMD5(newPassword);
       password= MD5Util.personalMd5(account,password).toString();
        newPassword=  MD5Util.personalMd5(account,newPassword).toString();

        int verifyPassword=personalService.verifyPassword(account,password);
        int updatePassword=0;
        Map map = new HashMap();
        map.put("newPassword", newPassword);
        map.put("account", account);
        if(verifyPassword==1){
            updatePassword = personalService.updatePassword(map);
        }else{
            updatePassword=2;
        }
        JSONObject json=new JSONObject();
        json.put("code",updatePassword);
        ResponseUtil.writeResp(response,json.toJSONString());
        return null;
    }

    @RequestMapping("/selectName")
    @ResponseBody
    public String selectNameByAccount(HttpServletResponse response){
        String account = (String) SecurityUtils.getSubject().getPrincipal();
         user=personalService.selectNameByAccount(account);
         System.out.println(user+"==========================");
        JSONObject json=new JSONObject();
        json.put("name",user);
        ResponseUtil.writeResp(response,json.toJSONString());
        return null;
    }

}
