package com.aldrich.mapper;

import com.aldrich.model.ShortReading;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ShortReadingMapper {
     List<ShortReading> getAllShortReading(Map map);
     int getAllPage();
}
