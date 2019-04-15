package com.aldrich.service;

import com.aldrich.model.CET6ShortReading;

import java.util.List;
import java.util.Map;

public interface CET6ShortReadingService {
    List<CET6ShortReading> getAllCET6ShortReading(Map map);
    int getAllPage();
}
