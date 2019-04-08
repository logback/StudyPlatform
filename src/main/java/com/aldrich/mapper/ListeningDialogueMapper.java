package com.aldrich.mapper;

import com.aldrich.model.ListeningDialogue;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ListeningDialogueMapper {
    List<ListeningDialogue> getAllListeningDialogue(Map map);
    int getAllPage();
}
