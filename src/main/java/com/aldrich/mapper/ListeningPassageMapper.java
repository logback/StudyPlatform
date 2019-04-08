package com.aldrich.mapper;

import com.aldrich.model.ListeningPassage;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ListeningPassageMapper {
    List<ListeningPassage> getAllListeningPassage(Map map);
    int getAllPage();
}
