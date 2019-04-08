package com.aldrich.service.impl;


import com.aldrich.mapper.ShortReadingMapper;

import com.aldrich.model.ShortReading;

import com.aldrich.service.ShortReadingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ShortReadingService")
public class ShortReadingServiceImpl implements ShortReadingService {
    @Resource
    private ShortReadingMapper shortReadingMapper;

    @Override
    public List<ShortReading> getAllShortReading(Map map) {
        return this.shortReadingMapper.getAllShortReading(map);
    }

    @Override
    public int getAllPage() {
        return this.shortReadingMapper.getAllPage();
    }
}
