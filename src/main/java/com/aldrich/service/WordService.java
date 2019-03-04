package com.aldrich.service;

import com.aldrich.model.Word;

import java.util.List;

/**
 * @author aldrich
 * @date 2018/12/24 9:10
 */
public interface WordService {

    /**
     * 查询所有的单词
     * @return list
     * */
    List<Word> getWords();


    /**
     * 依据名称查询单词
     * @param name
     * @return list
     * */
    List<Word>  getWord(String name);
}
