package com.aldrich.service;

import com.aldrich.model.LongtoRead;

import java.util.List;
import java.util.Map;

public interface LongtoReadService {
    List<LongtoRead> getAllLongtoRead(Map map);
    int getAllPage();
    /*int countAllId();*/
}
