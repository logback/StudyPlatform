package com.aldrich.service.impl;

import com.aldrich.mapper.CET6ShortReadingMapper;
import com.aldrich.model.CET6ShortReading;
import com.aldrich.service.CET6ShortReadingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("CET6ShortReadingService")
public class CET6ShortReadingServiceImpl implements CET6ShortReadingService {
    @Resource
    private CET6ShortReadingMapper cet6ShortReadingMapper;
    @Override
    public List<CET6ShortReading> getAllCET6ShortReading(Map map) {
        return this.cet6ShortReadingMapper.getAllCET6ShortReading(map);
    }

    @Override
    public int getAllPage() {
        return this.cet6ShortReadingMapper.getAllPage();
    }
}
