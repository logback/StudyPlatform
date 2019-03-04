package com.aldrich.mapper;

import com.aldrich.model.ListeningPractice;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ListeningPracticeMapper {
    List<ListeningPractice> getAllListeningPractice(Map map);
    int getAllPage();
}
