package com.aldrich.service;

import com.aldrich.model.CET6ListeningDialogue;

import java.util.List;
import java.util.Map;

public interface CET6ListeningDialogueService {
    List<CET6ListeningDialogue> getAllCET6ListeningDialogue(Map map);
    int getAllPage();
}
