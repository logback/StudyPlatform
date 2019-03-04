package com.aldrich.mapper;

import com.aldrich.model.Word;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author aldrich
 * @date 2018/12/24 8:53
 */
@Repository
public interface WordMapper {

    /**
     * 查询所有的单词
     * @return list
     * */
    List<Word>  getWords();

    /**
     * 依据名称查询单词
     * @param name
     * @return list
     * */
    List<Word>  getWord(String name);

}
