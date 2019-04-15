package com.aldrich.mapper;

import com.aldrich.model.CET6ListeningPassage;

import java.util.List;
import java.util.Map;

public interface CET6ListeningPassageMapper {
    List<CET6ListeningPassage> getAllCET6ListeningPassage(Map map);
    int getAllPage();
}
