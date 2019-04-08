package com.aldrich.service;

import com.aldrich.model.ListeningDialogue;

import java.util.List;
import java.util.Map;

public interface ListeningDialogueService {
    List<ListeningDialogue> getAllListeningDialogue(Map map);
    int getAllPage();
}
