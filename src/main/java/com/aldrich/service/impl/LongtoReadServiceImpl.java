package com.aldrich.service.impl;

import com.aldrich.mapper.LongtoReadMapper;
import com.aldrich.model.LongtoRead;
import com.aldrich.service.LongtoReadService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service("LongtoReadServiceImpl")
public class LongtoReadServiceImpl implements LongtoReadService {
    @Resource
    private LongtoReadMapper longtoReadMapper;

    @Override
    public List<LongtoRead> getAllLongtoRead(Map map) {
        return this.longtoReadMapper.getAllLongtoRead(map);
    }

    @Override
    public int getAllPage() {
        return this.longtoReadMapper.getAllPage();
    }

    /*@Override
    public int countAllId() {
        return this.longtoReadMapper.countAllId();
    }*/
}
