package com.aldrich.service;

import com.aldrich.model.ListeningPassage;

import java.util.List;
import java.util.Map;

public interface ListeningPassageService {
    List<ListeningPassage> getAllListeningPassage(Map map);
    int getAllPage();
}
