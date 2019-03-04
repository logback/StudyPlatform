package com.aldrich.service;

import com.aldrich.model.Cloze;

import java.util.List;
import java.util.Map;

public interface ClozeService {
    List<Cloze> getAllCloze(Map map);
    int getAllPage();
}
