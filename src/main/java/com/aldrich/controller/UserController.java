package com.aldrich.controller;

import com.aldrich.model.User;
import com.aldrich.service.impl.UserServiceImpl;
import com.aldrich.utils.*;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
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
import java.util.List;


/**
 * 控制层
 *
 * @author Nocol
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private User user;

    @Resource
    private UserServiceImpl userService;
    /**
     * 用户主页面
     * */
    @GetMapping("/backstage/show")
    public ModelAndView viewShow()
    {
        String mv="aldrich/backstage/user";
        return ModelView.createView(mv);
    }



    /**
     *后台管理用户界面
     * */
    @GetMapping("/manager")
    public ModelAndView viewManager(HttpSession session)
    {
        session.setAttribute("sign",1);
        String mv = "aldrich/backstage/mUser";
        return ModelView.createView(mv);
    }



    /**
     * 获取所有的用户
     * */
    @PostMapping(value = "allUsers",produces = "application/json ;charset=UTF-8")
    public String getAllUsers(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<User> list =userService.getLimitUsers(PageUtil.createPageMap(page,limit));
        int total = userService.getTotalUsers();
        String users = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,users);
        return null;
    }

    /**
     *批量删除
     **/
    @PostMapping(value = "/deleteByIds",produces = "application/json ;charset=UTF-8")
    public String deleteByIds(@RequestParam("accounts") String accounts, HttpServletResponse response){

        String[] ids = accounts.split(",");
        List<User> users = userService.deleteByIds(ids);
        int total = users.size();
        String string = ResponseUtil.createJson(0,"成功",total,users);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    /**
     *单独删除
     **/
    @PostMapping(value = "/deleteById",produces = "application/json ;charset=UTF-8")
    public String deleteById(@RequestParam("account") String account, HttpServletResponse response) {
        String string=userService.deleteById(account);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    /**
     * 上传照片
     * */
    @PostMapping(value = "/upload/img")
    public String uploadImg(HttpServletRequest req, @RequestParam("file") MultipartFile file, HttpServletResponse response) throws IOException {
        String string = userService.imgUpload(file);
        ResponseUtil.writeResp(response,string);
        return null;
    }

    /**
     * 保存用户
     * */
    @PostMapping(value = "submit/data")
    @ResponseBody
    public String saveAdmin(@RequestParam("account") String account,
                            @RequestParam("name") String name,
                            @RequestParam("pwd") String pwd,
                            @RequestParam("role") String role,
                            @RequestParam("img") String img,
                            @RequestParam("time") String time,
                            @RequestParam("email") String email, HttpServletResponse response) throws ParseException {

        int rs=userService.saveUser(account,name,role,time,pwd,img,email);
        JSONObject decide = new JSONObject();
        decide.put("code",rs);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }





    /**
     * 修改用户
     * */
    @PostMapping(value = "submit/update")
    @ResponseBody
    public String updateUser(@RequestParam("account") String account,
                              @RequestParam("name") String name,
                              @RequestParam("pwd") String pwd,
                              @RequestParam("role") String role,
                              @RequestParam("img") String img,
                              @RequestParam("email") String email, HttpServletResponse response){

        int rs=userService.updateInfo(account,name,role,pwd,img,email);
        JSONObject decide = new JSONObject();
        decide.put("code",rs);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }

//    /**
//     * 设置权限
//     * */
//    @PostMapping(value = "submit/authorize")
//    @ResponseBody
//    public String authorize(@RequestParam("state") String state,
//                            @RequestParam("account") String account,HttpServletResponse response)
//    {
//        System.out.println(state);
//        System.out.println(account);
//        Map<String,Object> map = new HashMap<>();
//        map.put("account",account);
//        map.put("state",state);
//        int rs = adminService.updateAuthor(map);
//        JSONObject decide = new JSONObject();
//        decide.put("code",rs);
//        ResponseUtil.writeResp(response,decide.toJSONString());
//        return null;
//    }



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
        List<User> users=new ArrayList<>();
        users=userService.searchUser(account,name,time);
        int total=1;
        System.out.println(users);

        String string = ResponseUtil.createJson(0,"成功",total,users);
        ResponseUtil.writeResp(response,string);
        return null;
    }

    /**
     *转发到用户管理界面
     * */
    @GetMapping(value = "/forwardUser")
    public ModelAndView  getUser(@RequestParam("account") String account,  HttpSession session)
    {
        System.out.println(account);
        session.setAttribute("sign",0);
        user=userService.searchById(account);
        session.setAttribute("manager",user);
        return new ModelAndView("aldrich/backstage/mUser");
    }

    /**
     * 创建用户session
     * */
    @GetMapping(value = "/getUser",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String loadResource(HttpSession session, HttpServletResponse response)
    {
        user = (User) session.getAttribute("manager");
        String string = JSONObject.toJSONString(user);
        ResponseUtil.writeResp(response,string);
        System.out.println(string);
        return null;
    }



//    /**
//     * 用户主页面
//     * */
//    @GetMapping("/backstage/show")
//    public ModelAndView viewShow()
//    {
//        String mv="aldrich/backstage/user";
//        return ModelView.createView(mv);
//    }
//    //注入Service
//    @Autowired
//    private UserService userService;
//    private User user;
//
//    @RequestMapping(value = "/regist", method = RequestMethod.POST)
//    @ResponseBody
//    public String saveUser(@RequestParam("account") String account,
//                           @RequestParam("name") String name,
//                           @RequestParam("password") String password,
//                           @RequestParam("email") String email,
//                           HttpServletResponse response) throws ParseException {
//        int rs = userService.saveUser(account, name, password, email);
//        JSONObject decide = new JSONObject();
//        decide.put("code", rs);
//        ResponseUtil.writeResp(response, decide.toJSONString());
//        return null;
//    }
//


    /**
     * 登录验证
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String loginUser( @RequestParam("account") String account,
                             @RequestParam("pwd") String password, HttpServletResponse response) {
        System.out.println(account);
        System.out.println(password);

        JSONObject resObj = new JSONObject();
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account,password) ;
        try {
            subject.login(token);
            //记录用户
            token.setRememberMe(true);
            resObj.put("code",0);
            resObj.put("message","成功");
        }catch (UnknownAccountException ex){
            resObj.put("code",1);
            resObj.put("message","账号错误");
        } catch (IncorrectCredentialsException ex) {
            resObj.put("code",2);
            resObj.put("message","密码错误");
        } catch (ExcessiveAttemptsException  ex) {
            resObj.put("code",3);
            resObj.put("message","登录失败多次，账号已被锁定，请与管理员联系");
        } catch (LockedAccountException ex)
        {
            resObj.put("code",4);
            resObj.put("message","您已被锁定");
        }
        catch (AuthenticationException ex) {
            resObj.put("code",5);
            resObj.put("message","发生错误");
        }
        ResponseUtil.writeResp(response,resObj.toJSONString());
        return null;
    }


}