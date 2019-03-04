package com.aldrich.service;

import com.aldrich.model.User;

import java.util.Map;

public interface PersonalService {
    //int updateName(String name);
    int updateAll(String name,String email,String account);

    int updatePassword(Map map);

    int verifyPassword(String account,String password);

    User selectNameByAccount(String account);
}
