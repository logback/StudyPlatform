package com.aldrich.mapper;

import com.aldrich.model.LongtoRead;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface LongtoReadMapper {
    List<LongtoRead> getAllLongtoRead(Map map);
    int getAllPage();
    /*int countAllId();*/
}
