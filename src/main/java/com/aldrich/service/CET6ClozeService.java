package com.aldrich.service;

import com.aldrich.model.CET6Cloze;

import java.util.List;
import java.util.Map;

public interface CET6ClozeService {
    List<CET6Cloze> getAllCET6Cloze(Map map);
    int getAllPage();
}
