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
    public int AddShortReading(ShortReading shortReading) {
        return this.shortReadingMapper.AddShortReading(shortReading);
    }

    @Override
    public List<ShortReading> getLimitShortReading(Map map) {
        return this.shortReadingMapper.getLimitShortReading(map);
    }

    @Override
    public List<ShortReading> getAllShortReading(Map map) {
        return this.shortReadingMapper.getAllShortReading(map);
    }

    @Override
    public List<ShortReading> getAllShortReading() {
        return this.shortReadingMapper.getAllShortReading();
    }

    @Override
    public int getAllPage() {
        return this.shortReadingMapper.getAllPage();
    }

    @Override
    public List<ShortReading> getByIdShortReading(Integer id) {
        return this.shortReadingMapper.getByIdShortReading(id);
    }

    @Override
    public int UpdateAddShortReading(ShortReading shortReading) {
        return this.shortReadingMapper.UpdateAddShortReading(shortReading);
    }

    @Override
    public int deleteShortReadingByIds(Integer[] ids) {
        for(Integer id : ids)
        {
            this.shortReadingMapper.deleteShortReadingById(id);
        }
        return 0;
    }

    @Override
    public int deleteShortReadingById(Integer ids) {
        return this.shortReadingMapper.deleteShortReadingById(ids);
    }
}
