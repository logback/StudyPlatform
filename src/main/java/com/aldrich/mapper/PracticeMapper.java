package com.aldrich.mapper;

import com.aldrich.model.Practice;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PracticeMapper {
     List<Practice> getAllPractice(Map map);
     int getAllPage();
}
