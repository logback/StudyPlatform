package com.aldrich.mapper;

import com.aldrich.model.CET6LongtoRead;

import java.util.List;
import java.util.Map;

public interface CET6LongtoReadMapper {
    List<CET6LongtoRead> getAllCET6LongtoRead(Map map);
    int getAllPage();
}
