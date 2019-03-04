package com.aldrich.service.impl;

import com.aldrich.mapper.ClozeMapper;
import com.aldrich.model.Cloze;
import com.aldrich.service.ClozeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ClozeService")
public class ClozeServiceImpl implements ClozeService {
    @Resource
    private ClozeMapper clozeMapper;

    @Override
    public List<Cloze> getAllCloze(Map map){return this.clozeMapper.getAllCloze(map);};

    @Override
    public int getAllPage(){return this.clozeMapper.getAllPage();};
}
