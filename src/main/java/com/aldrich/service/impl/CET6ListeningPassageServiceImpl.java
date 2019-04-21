package com.aldrich.service.impl;

import com.aldrich.mapper.CET6ListeningPassageMapper;
import com.aldrich.model.CET6ListeningPassage;
import com.aldrich.service.CET6ListeningPassageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("CET6ListeningPassageService")
public class CET6ListeningPassageServiceImpl implements CET6ListeningPassageService {
    @Resource
    private CET6ListeningPassageMapper cet6ListeningPassageMapper;

    @Override
    public List<CET6ListeningPassage> getAllCET6ListeningPassage(Map map) {
        return this.cet6ListeningPassageMapper.getAllCET6ListeningPassage(map);
    }

    @Override
    public int getAllPage() {
        return this.cet6ListeningPassageMapper.getAllPage();
    }
}
