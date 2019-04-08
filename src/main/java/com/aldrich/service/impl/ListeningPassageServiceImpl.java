package com.aldrich.service.impl;

import com.aldrich.mapper.ListeningPassageMapper;
import com.aldrich.model.ListeningPassage;
import com.aldrich.service.ListeningPassageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ListeningPassageService")
public class ListeningPassageServiceImpl implements ListeningPassageService {
    @Resource
    private ListeningPassageMapper listeningPassageMapper;
    @Override
    public List<ListeningPassage> getAllListeningPassage(Map map) {
        return this.listeningPassageMapper.getAllListeningPassage(map);
    }

    @Override
    public int getAllPage() {
        return this.listeningPassageMapper.getAllPage();
    }
}
