package com.aldrich.service;

import com.aldrich.model.ListeningPractice;

import java.util.List;
import java.util.Map;

public interface ListeningPracticeService {
    List<ListeningPractice> getAllListeningPractice(Map map);
    int getAllPage();
}
