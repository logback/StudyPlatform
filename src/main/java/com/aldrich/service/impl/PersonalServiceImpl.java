package com.aldrich.service.impl;

import com.aldrich.mapper.PersonalMapper;
import com.aldrich.model.User;
import com.aldrich.service.PersonalService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {
    @Resource
    private PersonalMapper mapper;

    @Resource
    private User user;

    /**
     * public int updateName(String name){
     * return this.mapper.updateName(name);
     * }
     **/
    public int updateAll(String name, String email,String account) {

        user.setName(name);
        user.setEmail(email);
        user.setAccount(account);
        return this.mapper.updateAll(user);
    }

    //修改密码
    public int updatePassword(Map map){
        return this.mapper.updatePassword(map);
    }

    //验证密码是否正确
    public int verifyPassword(String account,String password){
        user.setAccount(account);
        user.setPassword(password);
        return this.mapper.verifyPassword(user);
    }

    public User selectNameByAccount(String account){
        return this.mapper.selectNameByAccount(account);
    }

}
