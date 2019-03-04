package com.aldrich.service.impl;

import com.aldrich.mapper.PracticeMapper;
import com.aldrich.model.Practice;
import com.aldrich.service.PracticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("practiceService")
public class PracticeServiceImpl implements PracticeService {
    @Resource
    private PracticeMapper practiceMapper;

    @Override
    public List<Practice> getAllPractice(Map map){
        return this.practiceMapper.getAllPractice(map);
    }

    @Override
    public int getAllPage(){
        return this.practiceMapper.getAllPage();
    }
}
