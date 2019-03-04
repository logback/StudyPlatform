package com.aldrich.service;

import com.aldrich.model.Game;

import java.util.List;
import java.util.Map;

public interface GameService {
    List<Game> findRight(int number);
    int findAllWord();
     List<Game> findOther(Map map);
}
