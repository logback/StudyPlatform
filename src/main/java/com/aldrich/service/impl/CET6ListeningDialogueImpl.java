package com.aldrich.service.impl;

import com.aldrich.mapper.CET6ListeningDialogueMapper;
import com.aldrich.model.CET6ListeningDialogue;
import com.aldrich.service.CET6ListeningDialogueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("CET6ListeningDialogueService")
public class CET6ListeningDialogueImpl implements CET6ListeningDialogueService {
    @Resource
    private CET6ListeningDialogueMapper cet6ListeningDialogueMapper;

    @Override
    public List<CET6ListeningDialogue> getAllCET6ListeningDialogue(Map map) {
        return this.cet6ListeningDialogueMapper.getAllCET6ListeningDialogue(map);
    }

    @Override
    public int getAllPage() {
        return this.cet6ListeningDialogueMapper.getAllPage();
    }
}
