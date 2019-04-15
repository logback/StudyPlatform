package com.aldrich.service.impl;

import com.aldrich.mapper.CET6ClozeMapper;
import com.aldrich.model.CET6Cloze;
import com.aldrich.service.CET6ClozeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("CET6ClozeService")
public class CET6ClozeServiceImpl implements CET6ClozeService{
    @Resource
    private CET6ClozeMapper cet6ClozeMapper;

    @Override
    public List<CET6Cloze> getAllCET6Cloze(Map map) {
        return this.cet6ClozeMapper.getAllCET6Cloze(map);
    }

    @Override
    public int getAllPage() {
        return this.cet6ClozeMapper.getAllPage();
    }
}
