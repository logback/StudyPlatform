package com.aldrich.service.impl;
import com.aldrich.mapper.UserMapper;
import com.aldrich.model.User;
import com.aldrich.service.UserService;
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

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private User user;


    @Resource
    private UserMapper userMapper;

    /**
     * 获用户登录判断
     * @return user
     **/

    @Override
    public User decideLogin(Map map) {
        return this.userMapper.login(map);
    }

    /**
     * 获取所有的用户信息记录条数
     * @return int
     **/
    @Override
    public int getTotalUsers() {
        return this.userMapper.getTotalUsers();
    }


    /**
     * 获取所有的用户信息
     * @return list
     **/
    @Override
    public List<User> getAllUsers() {
        return this.userMapper.getAllUsers();
    }

    /**
     * 获取分页的的用户信息
     * @param map
     * @return list
     **/
    @Override
    public List<User> getLimitUsers(Map map) {

        return this.userMapper.getLimitUsers(map);
    }



    /**
     * 依据账号删除用户
     * @param account
     * @return list
     * */
    @Override
    public  String  deleteById(String account) {
        List<User> users = new ArrayList<>();
        this.userMapper.deleteById(account);
        users=this.userMapper.getAllUsers();
        int total = users.size();
        String string = ResponseUtil.createJson(1,"成功",total,users);
        return string;

    }

    /**
     * 依据账号批量删除用户
     * @param accounts
     * @return list
     * */
    @Override
    public List<User> deleteByIds(String[] accounts) {
        List<User> users = new ArrayList<>();
        for(String account : accounts)
        {
            this.userMapper.deleteById(account);
        }
        users=this.userMapper.getAllUsers();
        return users;
    }



    /**
     * 保存用户
     * @param account
     * @return rs
     * */
    @Override
    public int saveUser(String account,String name,String role,String time,String pwd,String img,String email) throws ParseException {

        /*账号已存在*/
        if(userMapper.searchById(account)!=null)
        {
            return 0;
            /*昵称已存在*/
        }else if(userMapper.searchByName(name)!=null){
            return -1;
        }else if(userMapper.searchByEmail(email)!=null)
        {
            return  2;
        }

        String password= GetMD5.getMD5(pwd);
        Date date = TimeUtil.timeUtil(time);
        user.setAccount(account);
        user.setName(name);
        user.setRole(role);
        user.setEmail(email);
        user.setImage(img);
        user.setTime(date);
        user.setPassword(password);
        return this.userMapper.saveUser(user);
    }

    /**
     * 更新用户
     * @param account,name,role,time,pwd,img,email
     * @return rs
     * */
    @Override
    public int updateInfo(String account, String name, String role, String pwd, String img, String email) {

        String password= GetMD5.getMD5(pwd);
        user.setAccount(account);
        user.setName(name);
        user.setRole(role);
        user.setEmail(email);
        user.setImage(img);
        user.setPassword(password);
        return this.userMapper.updateInfo(user);
    }

//    /**
//     * 更新权限
//     * @param map
//     * @return rs
//     * */
//    @Override
//    public int updateAuthor(Map map) {
//        return this.userMapper.updateAuthor(map);
//    }


    /**
     * 上传头像
     * @param file
     * @return string
     * */
    @Override
    public String imgUpload(MultipartFile file) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());

        String   rootPath = "D:\\IDEA-SSM\\EnglishSystem\\src\\main\\webapp\\assets\\images";
        //原始名称
        String originalFilename = file.getOriginalFilename();
        //新的文件名称
        String newFileName = res + originalFilename.substring(originalFilename.lastIndexOf("."));
        System.out.println(newFileName);
        //创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR)
                + File.separator + (date.get(Calendar.MONTH) + 1));
        //新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        //判断目标文件所在的目录是否存在
        if (!newFile.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }

        //将内存中的数据写入磁盘
        file.transferTo(newFile);
        //完整的url
        String fileUrl = rootPath + date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH) + 1) + "/"+ (date.get(Calendar.DAY_OF_MONTH)) + "/"+ newFileName;
        System.out.println(fileUrl);
        Map<String, Object> map2 = new HashMap<String, Object>();

        JSONObject resObj = new JSONObject();
        resObj.put("code",0);
        resObj.put("msg","");
        resObj.put("data",map2);
        map2.put("src", fileUrl);
        map2.put("title", newFileName);
        return resObj.toJSONString();
    }


    /**
     * 依据账号查找用户
     * @param account
     * @return user
     * */
    @Override
    public User searchById(String account) {
        return this.userMapper.searchById(account);
    }

    /**
     * 依据昵称查找用户
     * @param name
     * @return user
     * */
    @Override
    public User searchByName(String name) {
        return this.userMapper.searchByName(name);
    }

    /**
     * 依据邮件查找用户
     * @param email
     * @return user
     * */
    @Override
    public User searchByEmail(String email) {
        return this.userMapper.searchByEmail(email);
    }

    /**
     * 依据时间查找用户
     * @param time
     * @return user
     * */
    @Override
    public List<User> searchByTime(String time) {
        return this.userMapper.searchByTime(time);
    }

    /**
     * 依据昵称查找用户
     * @param name
     * @return user
     * */
    @Override
    public List<User> searchUser(String account, String name, String time) {
        List<User> users = new ArrayList<>();
        if(StringUtil.isNotEmpty(account))
        {
            user=this.userMapper.searchById(account);
            users.add(user);
            return users;
        }
        if(StringUtil.isNotEmpty(name))
        {
            user=this.userMapper.searchByName(name);
            users.add(user);
            return users;
        }
        if(StringUtil.isNotEmpty(time))
        {
            users=this.userMapper.searchByTime(time);
            return users;
        }
        return users;
    }




    @Override
    public Set<String> findRoles(String account) {

        return this.userMapper.findRole(account);

    }


    /**
     * 依据姓名查询权限
     * @param name
     * @return Permissions
     * */
    @Override
    public Set<String> findPermissions(String name) {
        return this.userMapper.findPermissions(name);
    }


}
