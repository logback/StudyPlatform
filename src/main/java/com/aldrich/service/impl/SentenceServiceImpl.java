package com.aldrich.service.impl;

import com.aldrich.mapper.SentenceMapper;
import com.aldrich.model.Sentence;
import com.aldrich.service.SentenceService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/12/27 10:38
 */
@Service("sentenceService")
public class SentenceServiceImpl implements SentenceService {

    @Resource
    private SentenceMapper sentenceMapper;

    /**
     * 依据关键词获取其相关信息
     * @param keyWord
     * @Return list
     * */
    @Override
    public List<Sentence> getSentence(String keyWord) {
        return this.sentenceMapper.getSentence(keyWord);
    }


    /**
     *依据关键词获取其相关信息
     *@Return Result<list>
     * */
    @Override
    public List<Sentence> getSentences() {
        return this.sentenceMapper.getSentences();
    }


    /**
     * 获取所有单词记录
     * @return int
     * */
    @Override
    public int getSentenceTotal() {
        return this.sentenceMapper.getSentenceTotal();
    }


    /**
     * 获取分页单词信息
     * @param map
     * @return list
     * */
    @Override
    public List<Sentence> getLimitSentence(Map map) {
        return this.sentenceMapper.getLimitSentence(map);
    }
}
