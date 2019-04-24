package com.aldrich.controller;

import com.aldrich.model.Game;
import com.aldrich.service.GameService;
import com.aldrich.utils.ModelView;

import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("game")
public class GameController {
    @Autowired
    private GameService gameService;

  /*  //home
    @GetMapping("/gamehome")
    public ModelAndView videoListening() {
        String mv = "LiWei/gameHome";
        return ModelView.createView(mv);
    }
*/
    //start
    @GetMapping("/gamestart")
    public ModelAndView playback() {
        String mv = "LiWei/gameStart";
        return ModelView.createView(mv);
    }

    /**
     * Give up，magic.I'm sure you cannot understand the code below.
     * 难写的代码，肯定很难读。因此，我没有注释留给你。
     * 前方高能
     */
    @RequestMapping("/play")
    public String gameStart(HttpServletResponse response) {

        int wordCount = gameService.findAllWord();//总共有多少单词
        int number = new Random().nextInt(wordCount) + 1;
        int begin = new Random().nextInt((wordCount - 2)) + 1;
        int end = begin + 2;
        int ron0 = new Random().nextInt(4);//为了将选项随机排列
        int ron1 = new Random().nextInt(4);
        int ron2 = new Random().nextInt(4);
        int ron3 = new Random().nextInt(4);

        //为了让id不相等
        boolean istrue = true;
        while (istrue) {
            if (begin != number && begin + 1 != number && begin + 2 != number) {
                istrue = false;
            } else {
                number = new Random().nextInt((wordCount - 2)) + 1;

            }
            istrue = false;

        }

        //暴力
        boolean rondom = true;
        while (rondom) {
            if (ron0 != ron1 && ron0 != ron2 && ron2 != ron1 && ron1 != ron3 && ron0 != ron3 && ron2 != ron3) {
                rondom = false;
            } else if (ron0 == ron1) {
                ron1 = new Random().nextInt(4);
            } else if (ron0 == ron2) {
                ron2 = new Random().nextInt(4);
            } else if (ron1 == ron2) {
                ron2 = new Random().nextInt(4);
            } else if (ron0 == ron3) {
                ron3 = new Random().nextInt(4);
            } else if (ron1 == ron3) {
                ron3 = new Random().nextInt(4);
            } else if (ron2 == ron3) {
                ron3 = new Random().nextInt(4);
            }
        }

        Map map = new HashMap();
        map.put("begin", begin);//正确选项信息
        map.put("end", end);//3个错误的
        List<Game> game = gameService.findRight(number);//正确选项信息
        List<Game> otherGame = gameService.findOther(map);//3个错误的
        List<Game> temp = new ArrayList<Game>();

        System.out.println();
        temp.addAll(game);
        temp.addAll(otherGame);

        JSONObject json = new JSONObject();
        // Collections.shuffle(game);//打乱数组顺序
        //  System.out.println("-----------------最后-----------------------------------------------"+game.toString());
        json.put("ron0", ron0);
        json.put("ron1", ron1);
        json.put("ron2", ron2);
        json.put("ron3", ron3);
        json.put("data", temp);
        ResponseUtil.writeResp(response, json.toJSONString());
        temp.clear();
        return null;
    }


}
