package com.aldrich.service.impl;

import com.aldrich.mapper.WordMapper;
import com.aldrich.model.Word;
import com.aldrich.service.WordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author aldrich
 * @date 2018/12/24 9:12
 */
@Service("wordService")
public class WordServiceImpl  implements WordService {

    @Resource
    private WordMapper wordMapper;


    /**
     * 查询所有的单词
     * @return list
     * */
    @Override
    public List<Word> getWords() {
        return this.wordMapper.getWords();
    }


    /**
     * 依据名称查询单词
     * @param name
     * @return list
     * */
    @Override
    public List<Word> getWord(String name) {
        return this.wordMapper.getWord(name);
    }


}
