package com.aldrich.controller;

import com.aldrich.model.Admin;
import com.aldrich.model.Word;
import com.aldrich.model.WordPojo;
import com.aldrich.service.impl.WordPojoServiceImpl;
import com.aldrich.service.impl.WordServiceImpl;
import com.aldrich.utils.ModelView;
import com.aldrich.utils.PageUtil;
import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author aldrich
 * @date 2018/12/24 9:57
 */
@Controller
@RequestMapping("word")
public class WordController{

    @Resource
    private WordServiceImpl wordService;

    @Resource
    private WordPojoServiceImpl wordPojoService;


    @GetMapping("/wordPage")
    public ModelAndView viewWord()
    {
        String mv="aldrich/backstage/word";
        return ModelView.createView(mv);
    }

    @GetMapping("/sentencePage")
    public ModelAndView viewSentence()
    {
        String mv="aldrich/backstage/sentence";
        return ModelView.createView(mv);
    }

    /**
    * 获取所有的单词
    * */
    @PostMapping(value = "/getWords" ,produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getWords(HttpServletResponse response)
    {
        List<Word> words = wordService.getWords();
        String string = JSONObject.toJSONString(words);
        ResponseUtil.writeResp(response,string);
        return null;
    }



    /**
     * 依据单词名称获取单个的单词
     * */
    @PostMapping(value = "/getWordByName" ,produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getWord(@RequestParam("word") String word
                          ,HttpServletResponse response)
    {
        List<Word> words = wordService.getWord(word);
        String string = JSONObject.toJSONString(words);
        ResponseUtil.writeResp(response,string);
        return null;
    }


    /**
     * 获取单个的单词并转发到单词显示页面
     * */
    @GetMapping(value = "/getWord" )
    public ModelAndView getWord(@RequestParam("word") String word)
    {
        String mv = "aldrich/reception/word";
        ModelAndView view =new ModelAndView(mv);
        view.addObject("word",word);
        return view;
    }



    /**
     * 依据单词名称获取单个的单词
     * */
    @PostMapping(value = "/getWordPojo" ,produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getWordPojo(@RequestParam("word") String word
                 ,HttpServletResponse response)
    {
        List<WordPojo> words = wordPojoService.getWordPojo(word);
        String string = JSONObject.toJSONString(words);
        ResponseUtil.writeResp(response,string);
        return null;
    }



    /**
     * 获取所有单词信息
     * */
    @PostMapping(value = "/getWordPojos" ,produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getWordPojos(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        List<WordPojo> word = wordPojoService.getLimitWords(PageUtil.createPageMap(page,limit));
        int total = wordPojoService.getWordTotal();
        String words = ResponseUtil.createJson(0,"成功",total,word);
        ResponseUtil.writeResp(response,words);
        return null;
    }


}
