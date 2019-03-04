package com.aldrich.mapper;

import com.aldrich.model.Cloze;

import java.util.List;
import java.util.Map;

public interface ClozeMapper {
    List<Cloze> getAllCloze(Map map);
    int getAllPage();
}
