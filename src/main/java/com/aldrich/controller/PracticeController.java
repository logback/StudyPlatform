package com.aldrich.controller;

import com.aldrich.model.Cloze;
import com.aldrich.model.ListeningPractice;
import com.aldrich.model.Page;
import com.aldrich.model.Practice;
import com.aldrich.service.impl.ClozeServiceImpl;
import com.aldrich.service.impl.ListeningPracticeImpl;
import com.aldrich.service.impl.PracticeServiceImpl;
import com.aldrich.utils.ModelView;

import com.aldrich.utils.PageUtil;
import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/start")
public class PracticeController {
    @Resource
    private PracticeServiceImpl practiceService;

    @Resource
    private ListeningPracticeImpl listeningPractice;

    @Resource
    private ClozeServiceImpl clozeService;

    //专项练习首页
    @GetMapping("/test/HomePage")
    public ModelAndView viewHomePage(){
        String mv="Alone/test/HomePage";
        return ModelView.createView(mv);
    }

    //专项练习听力是选择页面
    @GetMapping("/test/ListeningPage")
    public ModelAndView viewListening(){
        String mv="Alone/test/ListeningPage";
        return ModelView.createView(mv);
    }

    //专项练习阅读理解是选择页面
    @GetMapping("/test/ReadPage")
    public ModelAndView viewRead(){
        String mv="Alone/test/ReadPage";
        return ModelView.createView(mv);
    }

    //专项练习完型填空是选择页面
    @GetMapping("/test/ClozePage")
    public ModelAndView viewClozePage(){
        String mv="Alone/test/ClozePage";
        return ModelView.createView(mv);
    }

    //专项阅读练习页面
    @GetMapping("/test/ReadPractice")
    public ModelAndView viewReadPractice(){
        String mv="Alone/test/ReadPractice";
        return ModelView.createView(mv);
    }

    //专项练习听力页面
    @GetMapping("/test/ListeningPractice")
    public ModelAndView viewListeningPractice(){
        String mv="Alone/test/ListeningPractice";
        return ModelView.createView(mv);
    }

    //专项练习完型填空页面
    @GetMapping("/test/Cloze")
    public ModelAndView viewCloze(){
        String mv="Alone/test/Cloze";
        return ModelView.createView(mv);
    }

    @PostMapping(value = "/practice",produces ="application/json;charset=UTF-8")
    @ResponseBody
    public Page<Practice> AllPractice(int pageIndex, int pageSize, HttpServletResponse response){
        Map map=new HashMap();
        map.put("pi",(pageIndex-1)*pageSize);
        map.put("ps",pageSize);
        List<Practice> practices=practiceService.getAllPractice(map);
        System.out.println(practices.toString());
        int page=practiceService.getAllPage();
        Page<Practice> data=new Page<Practice>();
        data.setTotal(page);
        data.setData(practices);
        JSONObject json=new JSONObject();
        json.put("data",data);
        ResponseUtil.writeResp(response,json.toJSONString());
        return null;
    }

    @PostMapping(value = "/listeningpractice", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<ListeningPractice> AllListeningPractice(int pageIndex, int pageSize,HttpServletResponse response){
        Map map=new HashMap();
        map.put("pi",(pageIndex-1)*pageSize);
        map.put("ps",pageSize);
        List<ListeningPractice> listening=listeningPractice.getAllListeningPractice(map);
        int page=listeningPractice.getAllPage();
        Page<ListeningPractice> data=new Page<ListeningPractice>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json=new JSONObject();
        json.put("data",data);
        ResponseUtil.writeResp(response,json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cloze", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<Cloze> AllCloze(int pageIndex, int pageSize,HttpServletResponse response){
        Map map=new HashMap();
        map.put("pi",(pageIndex-1)*pageSize);
        map.put("ps",pageSize);
        List<Cloze> clozes=clozeService.getAllCloze(map);
        int page=clozeService.getAllPage();
        Page<Cloze> data=new Page<Cloze>();
        data.setTotal2(page);
        data.setData2(clozes);
        JSONObject json=new JSONObject();
        json.put("data",data);
        ResponseUtil.writeResp(response,json.toJSONString());
        return null;
    }


}
