package com.aldrich.service.impl;

import com.aldrich.mapper.WordPojoMapper;
import com.aldrich.model.WordPojo;
import com.aldrich.service.WordPojoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/12/26 19:09
 */
@Service("wordPojoService")
public class WordPojoServiceImpl implements WordPojoService {

    @Resource
    private WordPojoMapper wordPojoMapper;


    /**
     * 依据名称查询单词
     * @param name
     * @return list
     * */
    @Override
    public List<WordPojo> getWordPojo(String name) {
        return this.wordPojoMapper.getWordPojo(name);
    }


    /**
     * 获取所有单词信息
     * @return list
     * */
    @Override
    public List<WordPojo> getWordPojos() {
        return this.wordPojoMapper.getWordPojos();
    }

    @Override
    public int getWordTotal() {
        return this.wordPojoMapper.getWordTotal();
    }

    @Override
    public List<WordPojo> getLimitWords(Map map) {
        return this.wordPojoMapper.getLimitWords(map);
    }
}
