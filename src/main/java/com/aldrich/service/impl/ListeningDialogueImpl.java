package com.aldrich.service.impl;

import com.aldrich.mapper.ListeningDialogueMapper;
import com.aldrich.model.ListeningDialogue;
import com.aldrich.service.ListeningDialogueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("ListeningDialogueService")
public class ListeningDialogueImpl implements ListeningDialogueService {
    @Resource
    private ListeningDialogueMapper ListeningDialogueMapper;

    @Override
    public List<ListeningDialogue> getAllListeningDialogue(Map map){ return this.ListeningDialogueMapper.getAllListeningDialogue(map);}

    @Override
    public int getAllPage(){
        return this.ListeningDialogueMapper.getAllPage();
    }
}
