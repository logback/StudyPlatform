package com.aldrich.mapper;

import com.aldrich.model.Game;

import java.util.List;
import java.util.Map;

public interface GameMapper {
    List<Game> findRight(int number);
    List<Game> findOther(Map map);
    int findAllWord();

}
