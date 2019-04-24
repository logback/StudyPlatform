package com.aldrich.service;



import com.aldrich.model.Admin;
import com.aldrich.model.ShortReading;

import java.util.List;
import java.util.Map;

public interface ShortReadingService {
    /**
     * 获取所有题目
     */
    List<ShortReading> getAllShortReading(Map map);
    List<ShortReading> getAllShortReading();
    int getAllPage();
    List<ShortReading>  getLimitShortReading(Map map);
    int AddShortReading(ShortReading shortReading);
    List<ShortReading> getByIdShortReading(Integer id);
    int UpdateAddShortReading(ShortReading shortReading);
    int  deleteShortReadingByIds(Integer[] ids);
    int  deleteShortReadingById(Integer ids);
}

