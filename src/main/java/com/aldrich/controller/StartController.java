package com.aldrich.controller;

import com.aldrich.model.Admin;
import com.aldrich.service.impl.AdminServiceImpl;
import com.aldrich.utils.GetMD5;
import com.aldrich.utils.ModelView;
import com.aldrich.utils.ResponseUtil;
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
import java.util.HashMap;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/11/26 22:09
 */
@Controller
@RequestMapping("/start")
public class StartController {


    @Resource
    private Admin admin;

    @Resource
    private AdminServiceImpl adminService;


    /**
     * @Author aldrich
     * @Description
     * @Date 8:42 2019/4/15
     * @Param []
     * @return void
     */
    @RequestMapping("/error")
    public void testError(){
          int s=10/0;
    }


    @RequestMapping("/upload")
    public ModelAndView testUploadImage(){
        return new ModelAndView("aldrich/backstage/test");
    }




  /*  @RequestMapping("/noPower")
    public  ModelAndView viewPower()
    {
        ModelAndView mv = new ModelAndView("noPower");
        return mv;
    }*/


    /**
     *主页面
     * */
    @RequestMapping("/home")
    public  ModelAndView viewHome()
    {
        ModelAndView mv = new ModelAndView("home");
        mv.addObject("title", "Spring MVC And Freemarker");
        mv.addObject("content", " Hello world ， test my first spring mvc ! ");
        return mv;
    }


    /**
     *500页面
     * */
    @GetMapping("/500")
    public ModelAndView view500()
    {
        return new ModelAndView("error/500");
    }


    /**
     *404页面
     * */
    @GetMapping("/404")
    public ModelAndView view404()
    {
        return new ModelAndView("error/404");
    }


    /**
     * @Author aldrich
     * @Description 返回异常界面
     * @Date 17:04 2019/4/12
     * @Param []
     * @return org.springframework.web.servlet.ModelAndView
     */
    @GetMapping("/thread")
    public ModelAndView viewThread()
    {
        return new ModelAndView("error/thread");
    }


    /**
     *前台主页面
     * */
    @GetMapping("/index")
    public ModelAndView viewIndex()
    {
        ModelAndView view = new ModelAndView("index");
        return view;
    }



    /**
     *后台主页面
     * */
    @GetMapping("/backstage/main")
    public ModelAndView viewMain()
    {
        ModelAndView view = new ModelAndView("aldrich/backstage/home");
        return view;
    }

    /**
     *前台搜索
     * */
    @GetMapping("/reception/search")
    public ModelAndView viewSearch()
    {
        ModelAndView mv = new ModelAndView("aldrich/reception/search");
        return mv;
    }


    /**
     *后台登录
     * */
    @GetMapping("/backstage/login")
    public ModelAndView viewLogin() {
        String mv="aldrich/backstage/login";
        return ModelView.createView(mv);
    }


    /**
     *后台登录
     * */
    @GetMapping("/backstage/register")
    public ModelAndView viewRegister()
    {
        String mv="aldrich/backstage/register";
        return ModelView.createView(mv);
    }


    /**
     *后台首页
     * */
    @GetMapping("/backstage/firstPage")
    public ModelAndView viewFirst()
    {
        String mv="aldrich/backstage/firstPage";
        return ModelView.createView(mv);
    }


    /**
     * 管理员登录验证
     * */
    @PostMapping(value = "/backstage/enter",produces = "application/json ;charset=UTF-8")
    public String login(HttpSession session,
                        @RequestParam("account") String account,
                        @RequestParam("pwd") String pwd, HttpServletResponse response)
    {
        if(account!=null)
        {
            try {
                throw  new Exception("酸护第三方的所发生的");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Map<String,String> map=new HashMap<>();
        map.put("account",account.trim());
        map.put("pwd", GetMD5.getMD5(pwd.trim()));
        admin = adminService.decideLogin(map);

        JSONObject resObj = new JSONObject();
        if(admin!=null)
        {
            session.setAttribute("Admin",admin);
            resObj.put("code",0);
        }else {
            resObj.put("code",1);
        }
        ResponseUtil.writeResp(response,resObj.toJSONString());
        return null;
    }


   /**
   * 创建管理员session
   * */
    @GetMapping(value = "/backstage/getAdmin",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String loadResource(HttpSession session, HttpServletResponse response)
    {

        Admin admin= (Admin) session.getAttribute("Admin");
        String string = JSONObject.toJSONString(admin);
        ResponseUtil.writeResp(response,string);
        return null;
    }


}
