package com.aldrich.controller;

import com.aldrich.model.Sentence;
import com.aldrich.model.Word;
import com.aldrich.service.impl.SentenceServiceImpl;
import com.aldrich.utils.PageUtil;
import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author aldrich
 * @date 2018/12/27 10:50
 */
@Controller
@RequestMapping("sentence")
public class SentenceController {

     @Resource
     private SentenceServiceImpl sentenceService;

    /**
     * 依据单词名称获取句子
     * */
    @PostMapping(value = "/getSentence" ,produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getWord(@RequestParam("word") String word
            , HttpServletResponse response)
    {
        List<Sentence> sentence = sentenceService.getSentence(word);
        String string = JSONObject.toJSONString(sentence);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    /**
     * 依据单词名称获取句子
     * */
    @PostMapping(value = "/getSentences" ,produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getSentences(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<Sentence> sentence = sentenceService.getLimitSentence(PageUtil.createPageMap(page,limit));
        int total = sentenceService.getSentenceTotal();
        String sentences = ResponseUtil.createJson(0,"成功",total,sentence);
        ResponseUtil.writeResp(response,sentences);
        return null;
    }

}
