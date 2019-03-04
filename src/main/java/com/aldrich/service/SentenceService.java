package com.aldrich.service;

import com.aldrich.model.Sentence;

import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/12/27 10:36
 */

public interface SentenceService {

    /**
     * 依据关键词获取其相关信息
     * @param keyWord
     * @Return list
     * */
    List<Sentence> getSentence(String keyWord);



    /**
     *依据关键词获取其相关信息
     *@Return Result<list>
     * */
    List<Sentence> getSentences();

    /**
     * 获取所有单词记录
     * @return int
     * */
    int getSentenceTotal();


    /**
     * 获取分页单词信息
     * @param map
     * @return list
     * */
    List<Sentence>  getLimitSentence(Map map);
}
