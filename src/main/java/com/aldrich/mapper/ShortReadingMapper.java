package com.aldrich.mapper;

import com.aldrich.model.ShortReading;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ShortReadingMapper {
     List<ShortReading> getAllShortReading(Map map);
     List<ShortReading> getAllShortReading();
     int getAllPage();
     List<ShortReading>  getLimitShortReading(Map map);
     int AddShortReading(ShortReading shortReading);
     List<ShortReading> getByIdShortReading(Integer id);
     int UpdateAddShortReading(ShortReading shortReading);
     int  deleteShortReadingById(Integer id);
}
