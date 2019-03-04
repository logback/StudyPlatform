package com.aldrich.service.impl;

import com.aldrich.mapper.ListeningPracticeMapper;
import com.aldrich.model.ListeningPractice;
import com.aldrich.service.ListeningPracticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ListeningPracticeService")
public class ListeningPracticeImpl implements ListeningPracticeService {
    @Resource
    private ListeningPracticeMapper listeningPracticeMapper;

    @Override
    public List<ListeningPractice> getAllListeningPractice(Map map){ return this.listeningPracticeMapper.getAllListeningPractice(map);}

    @Override
    public int getAllPage(){
        return this.listeningPracticeMapper.getAllPage();
    }
}
