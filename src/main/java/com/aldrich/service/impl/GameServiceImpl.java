package com.aldrich.service.impl;

import com.aldrich.mapper.GameMapper;
import com.aldrich.model.Game;
import com.aldrich.service.GameService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service("gameService")
@Transactional
public class GameServiceImpl implements GameService {
    @Resource
    protected GameMapper mapper;
    /**
     * 查询全部选项
     */
    public List<Game> findRight(int number) {

        return this.mapper.findRight(number);
    }

    public List<Game> findOther(Map map) {
        return this.mapper.findOther(map);
    }

    //获取单词数量，即word_id,id数量
    public int findAllWord(){ return this.mapper.findAllWord(); }
}
