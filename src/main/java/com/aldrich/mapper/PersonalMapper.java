package com.aldrich.mapper;

import com.aldrich.model.User;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface PersonalMapper {
   // int updateName(String name);
    int updateAll(User user);
    int updatePassword(Map map);
    int verifyPassword(User user);
    User selectNameByAccount(String account);
}
