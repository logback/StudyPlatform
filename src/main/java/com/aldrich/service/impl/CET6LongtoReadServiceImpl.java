package com.aldrich.service.impl;

import com.aldrich.mapper.CET6LongtoReadMapper;
import com.aldrich.model.CET6LongtoRead;
import com.aldrich.service.CET6LongtoReadService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("CET6LongtoReadService")
public class CET6LongtoReadServiceImpl implements CET6LongtoReadService {
    @Resource
    private CET6LongtoReadMapper cet6LongtoReadMapper;

    @Override
    public List<CET6LongtoRead> getAllCET6LongtoRead(Map map) {
        return this.cet6LongtoReadMapper.getAllCET6LongtoRead(map);
    }

    @Override
    public int getAllPage() {
        return this.cet6LongtoReadMapper.getAllPage();
    }
}
