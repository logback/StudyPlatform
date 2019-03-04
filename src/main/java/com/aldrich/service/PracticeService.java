package com.aldrich.service;

import com.aldrich.model.Practice;

import java.util.List;
import java.util.Map;

public interface PracticeService {
    /**
     * 获取所有题目
     */
    List<Practice> getAllPractice(Map map);
    int getAllPage();
}
