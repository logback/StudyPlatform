package com.aldrich.junit;

import com.aldrich.mapper.PermissionMapper;
import com.aldrich.mapper.UserMapper;
import com.aldrich.model.Admin;
import com.aldrich.model.Permission;
import com.aldrich.service.StudentService;
import com.aldrich.service.impl.*;
import com.aldrich.utils.*;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.*;


/**
 * @author aldrich
 * @date 2018/12/6 16:59
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-mybatis.xml"})
public class Test {



    @Resource
    private   Admin admin;

    @Resource
    private StudentService studentService;

    @Resource
    private UserServiceImpl userService;


    @Resource
    private AdminServiceImpl adminService;

    @Resource
    private SentenceServiceImpl sentenceService;

    @Resource
    private WordServiceImpl wordService;

    @Resource
    private WordPojoServiceImpl wordPojoService;

    @Resource
    private RoleServiceImpl roleService;

    @Resource
    private PermissionServiceImpl permissionService;

    @org.junit.Test
    public void test()
    {
        System.out.println(studentService.selectStudents());
    }


    @org.junit.Test
    public void test2()
    {
        int page=1;
        int limit=7;
        List<Admin> list = adminService.getLimitAdmins(PageUtil.createPageMap(page,limit));
        int total = adminService.getTotalAdmins();
        System.out.println(total);
        String admins = ResponseUtil.createJson(0,"成功",total,list);
        System.out.println(admins);
    }

    @org.junit.Test
    public void test3()
    {
        Map<String,Object> map = new HashMap<>();
        map.put("account","18756076151");
        map.put("pwd",123456);
        System.out.println(adminService.decideLogin(map));
    }



    @org.junit.Test
    public void test4()
    {
        System.out.println(adminService.deleteById("2342343"));
    }



    @org.junit.Test
    public void test5() throws ParseException {
        Date date = new Date();
        String pwd=GetMD5.getMD5("234329");
        String time ="2018-12-13 11:10:09";
        String account="18756022153";
        String name ="234sd";
        String role="1003";
        String img="20181214112311247.jpg";
        String email="201076171@qq.com";
        System.out.println(adminService.saveAdmin(account,name,role,time,pwd,img,email));
    }



    @org.junit.Test
    public void test6()
    {
         List<Admin> admins=new ArrayList<>();
         String name="";
         String time="";
         admins=adminService.searchAdmin("18756076151",name,time) ;
         System.out.println(admins);
    }


    @org.junit.Test
    public void test7()
    {

    }

    @org.junit.Test
    public void test8()
    {
        String account="15665454467";
        String state = "已授权";
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("state",state);
        System.out.println(adminService.updateAuthor(map));

    }


    @org.junit.Test
    public void  test9()
    {
        System.out.println(wordService.getWords());
    }

    @Resource
    private UserMapper userMapper;

    @Resource
    private PermissionMapper permissionMapper;

    @org.junit.Test
    public void  test10()
    {

        /*String account;
        List<User> user = userService.getAllUsers();
        System.out.println(user);*/

        List<Permission> list = permissionMapper.selectPermission();
        int total = permissionService.permissionTotal();
        //String permission = ResponseUtil.createJson(0,"成功",total,list);
        System.out.println(list);
    }


    @org.junit.Test
    public void test11() throws ParseException
    {
       /* Admin user = adminService.searchByEmail("32434354@QQ.com") ;
        System.out.println(user);*/
        String pwd="232432434";
        String account="12345252569";
        String name ="测试001";
        String time ="2018-12-13";
        String role="1003";
        String img="20181214112311247.jpg";
        String email="233276171@qq.com";
        System.out.println(adminService.saveAdmin(account,name,role,time,pwd,img,email));
    }


    @org.junit.Test
    public void test13(){
       adminService.test(10,"eewrr",10);

    }

}