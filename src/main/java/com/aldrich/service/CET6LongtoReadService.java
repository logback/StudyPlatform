package com.aldrich.service;

import com.aldrich.model.CET6LongtoRead;

import java.util.List;
import java.util.Map;

public interface CET6LongtoReadService {
    List<CET6LongtoRead> getAllCET6LongtoRead(Map map);
    int getAllPage();
}
