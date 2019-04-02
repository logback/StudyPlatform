package com.aldrich.service.impl;

import com.aldrich.mapper.AdminMapper;
import com.aldrich.model.Admin;
import com.aldrich.service.AdminService;
import com.aldrich.utils.GetMD5;
import com.aldrich.utils.ResponseUtil;
import com.aldrich.utils.StringUtil;
import com.aldrich.utils.TimeUtil;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author aldrich
 * @date 2018/12/10 14:48
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Resource
    private Admin admin;


    @Resource
    private AdminMapper adminMapper;

    /**
     * 获管理员登录判断
     * @return admin
     **/

    @Override
    public Admin decideLogin(Map map) {
        return this.adminMapper.login(map);
    }

    /**
     * 获取所有的管理员信息记录条数
     * @return int
     **/
    @Override
    public int getTotalAdmins() {
        return this.adminMapper.getTotalAdmins();
    }


    /**
     * 获取所有的管理员信息
     * @return list
     **/
    @Override
    public List<Admin> getAllAdmins() {
        return this.adminMapper.getAllAdmins();
    }

    /**
     * 获取分页的的管理员信息
     * @param map
     * @return list
     **/
    @Override
    public List<Admin> getLimitAdmins(Map map) {

        return this.adminMapper.getLimitAdmins(map);
    }



    /**
     * 依据账号删除管理员
     * @param account
     * @return list
     * */
    @Override
    public  String  deleteById(String account) {
        List<Admin> admins = new ArrayList<>();
        this.adminMapper.deleteById(account);
        admins=this.adminMapper.getAllAdmins();
        int total = admins.size();
        String string = ResponseUtil.createJson(1,"成功",total,admins);
        return string;

    }

    /**
     * 依据账号批量删除管理yuan
     * @param accounts
     * @return list
     * */
    @Override
    public List<Admin> deleteByIds(String[] accounts) {
        List<Admin> admins = new ArrayList<>();
        for(String account : accounts)
        {
            this.adminMapper.deleteById(account);
        }
        admins=this.adminMapper.getAllAdmins();
        return admins;
    }

    /**
     * 保存管理员
     * @param account
     * @return rs
     * */
    @Override
    public int saveAdmin(String account,String name,String role,String time,String pwd,String img,String email) throws ParseException {

        /*账号已存在*/
        if(adminMapper.searchById(account)!=null)
        {
            return 0;
            /*昵称已存在*/
        }else if(adminMapper.searchByName(name)!=null){
            return -1;
        }else if(adminMapper.searchByEmail(email)!=null)
        {
            return  2;
        }

        String password= GetMD5.getMD5(pwd);
        Date date = TimeUtil.timeUtil(time);
        admin.setAccount(account);
        admin.setName(name);
        admin.setRole(role);
        admin.setEmail(email);
        admin.setImage(img);
        admin.setState("未授权");
        admin.setTime(date);
        admin.setPassword(password);
        return this.adminMapper.saveAdmin(admin);
    }

    /**
     * 更新管理员
     * @param account,name,role,time,pwd,img,email
     * @return rs
     * */
    @Override
    public int updateInfo(String account, String name, String role, String pwd, String img, String email) {

        String password= GetMD5.getMD5(pwd);
        admin.setAccount(account);
        admin.setName(name);
        admin.setRole(role);
        admin.setEmail(email);
        admin.setImage(img);
        admin.setPassword(password);
        return this.adminMapper.updateInfo(admin);
    }

    /**
     * 更新权限
     * @param map
     * @return rs
     * */
    @Override
    public int updateAuthor(Map map) {
        return this.adminMapper.updateAuthor(map);
    }


    /**
     * 上传头像
     * @param file
     * @return string
     * */
    @Override
    public String imgUpload(MultipartFile file) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());

        String   rootPath = "D:\\JetBrains\\idea-workspace\\StudyPlatform\\src\\main\\webapp\\assets\\images";

        //原始名称
        String originalFilename = file.getOriginalFilename();
        //新的文件名称
        String newFileName = res + originalFilename.substring(originalFilename.lastIndexOf("."));

        System.out.println("新的文件名称"+newFileName);
        //创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File("avatar");

        //新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        System.out.println("路径"+rootPath + File.separator + dateDirs + File.separator + newFileName);
        //判断目标文件所在的目录是否存在
        if (!newFile.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }

        //将内存中的数据写入磁盘
        file.transferTo(newFile);
        //完整的url
        String fileUrl = rootPath +File.separator + "avatar"+File.separator+ newFileName;
        System.out.println("完整的url"+fileUrl);


        Map<String, Object> map2 = new HashMap<String, Object>();

        JSONObject resObj = new JSONObject();
        resObj.put("code",0);
        resObj.put("msg","");
        resObj.put("data",map2);
        map2.put("src", fileUrl);
        map2.put("title", newFileName);
        System.out.println(map2.toString());
        return resObj.toJSONString();
    }


    /**
     * 依据账号查找管理员
     * @param account
     * @return admin
     * */
    @Override
    public Admin searchById(String account) {
        return this.adminMapper.searchById(account);
    }


    /**
     * 依据昵称查找管理员
     * @param name
     * @return admin
     * */
    @Override
    public Admin searchByName(String name) {
        Admin aldrich = new Admin();
        try {
             aldrich=this.adminMapper.searchByName(name) ;
        }catch (NullPointerException e)
        {
            System.out.println("dsfsfsd");
            return null;
        }
        return aldrich;
    }


    /**
     * 依据邮件查找管理员
     * @param email
     * @return admin
     * */
    @Override
    public Admin searchByEmail(String email) {
        return this.adminMapper.searchByEmail(email);
    }


    /**
     * 依据时间查找管理员
     * @param time
     * @return admin
     * */
    @Override
    public List<Admin> searchByTime(String time) {
        return this.adminMapper.searchByTime(time);
    }



    /**
     * 依据昵称查找管理员
     * @param name
     * @return admin
     * */
    @Override
    public List<Admin> searchAdmin(String account, String name, String time) {
        List<Admin> admins = new ArrayList<>();
        if(StringUtil.isNotEmpty(account))
        {
            admin=this.adminMapper.searchById(account);
            admins.add(admin);
            return admins;
        }
        if(StringUtil.isNotEmpty(name))
        {
            admin=this.adminMapper.searchByName(name);
            admins.add(admin);
            return admins;
        }
        if(StringUtil.isNotEmpty(time))
        {
            admins=this.adminMapper.searchByTime(time);
            return admins;
        }
        return admins;
    }

}
