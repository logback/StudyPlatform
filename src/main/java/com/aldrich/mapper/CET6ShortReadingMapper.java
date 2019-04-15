package com.aldrich.mapper;

import com.aldrich.model.CET6ShortReading;

import java.util.List;
import java.util.Map;

public interface CET6ShortReadingMapper {
    List<CET6ShortReading> getAllCET6ShortReading(Map map);
    int getAllPage();
}
