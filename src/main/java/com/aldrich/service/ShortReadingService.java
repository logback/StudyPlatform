package com.aldrich.service;



import com.aldrich.model.ShortReading;

import java.util.List;
import java.util.Map;

public interface ShortReadingService {
    /**
     * 获取所有题目
     */
    List<ShortReading> getAllShortReading(Map map);
    int getAllPage();
}
