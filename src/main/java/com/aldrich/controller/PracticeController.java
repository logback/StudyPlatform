package com.aldrich.controller;

import com.aldrich.model.*;

import com.aldrich.service.impl.*;

import com.aldrich.utils.ModelView;


import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.beanutils.ConvertUtils;
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
    private ShortReadingServiceImpl shortReadingService;

    @Resource
    private ListeningDialogueImpl ListeningDialogue;

    @Resource
    private ClozeServiceImpl clozeService;

    @Resource
    private ListeningPassageServiceImpl listeningPassageService;

    @Resource
    private LongtoReadServiceImpl longtoReadService;

    @Resource
    private CET6ClozeServiceImpl cet6ClozeService;

    @Resource
    private CET6ListeningDialogueImpl cet6ListeningDialogue;

    @Resource
    private CET6ListeningPassageServiceImpl cet6ListeningPassageService;

    @Resource
    private CET6LongtoReadServiceImpl cet6LongtoReadService;

    @Resource
    private CET6ShortReadingServiceImpl cet6ShortReadingService;


    //专项练习首页
    @GetMapping("/test/HomePage")
    public ModelAndView viewHomePage() {
        String mv = "Alone/test/HomePage";
        return ModelView.createView(mv);
    }

    //总题目页面
    @GetMapping("/test/AllQuestions")
    public ModelAndView viewAllQuestions() {
        String mv = "Alone/test/AllQuestions";
        return ModelView.createView(mv);
    }

    //专项练习听力对话选择页面
    @GetMapping("/test/ListeningPage")
    public ModelAndView viewListening() {
        String mv = "Alone/test/ListeningPage";
        return ModelView.createView(mv);
    }

    //专项练习听力短文选择页面
    @GetMapping("/test/ListeningPassagePage")
    public ModelAndView viewListeningPassagePage() {
        String mv = "Alone/test/ListeningPassagePage";
        return ModelView.createView(mv);
    }

    //专项练习长阅读选择页面
    @GetMapping("/test/LongtoReadPage")
    public ModelAndView viewLongtoReadPage() {
        String mv = "Alone/test/LongtoReadPage";
        return ModelView.createView(mv);
    }

    //专项练习阅读理解选择页面
    @GetMapping("/test/ReadPage")
    public ModelAndView viewRead() {
        String mv = "Alone/test/ReadPage";
        return ModelView.createView(mv);
    }

    //专项练习完型填空选择页面
    @GetMapping("/test/ClozePage")
    public ModelAndView viewClozePage() {
        String mv = "Alone/test/ClozePage";
        return ModelView.createView(mv);
    }

    //专项六级练习听力对话选择页面
    @GetMapping("/test/CET6ListeningPage")
    public ModelAndView viewCET6Listening() {
        String mv = "Alone/test/CET6ListeningPage";
        return ModelView.createView(mv);
    }

    //专项六级练习听力短文选择页面
    @GetMapping("/test/CET6ListeningPassagePage")
    public ModelAndView viewCET6ListeningPassagePage() {
        String mv = "Alone/test/CET6ListeningPassagePage";
        return ModelView.createView(mv);
    }

    //专项六级练习长阅读选择页面
    @GetMapping("/test/CET6LongtoReadPage")
    public ModelAndView viewCET6LongtoReadPage() {
        String mv = "Alone/test/CET6LongtoReadPage";
        return ModelView.createView(mv);
    }

    //专项六级短阅读理解选择页面
    @GetMapping("/test/CET6ReadPage")
    public ModelAndView viewCET6Read() {
        String mv = "Alone/test/CET6ReadPage";
        return ModelView.createView(mv);
    }

    //专项六级练习完型填空选择页面
    @GetMapping("/test/CET6ClozePage")
    public ModelAndView viewCET6ClozePage() {
        String mv = "Alone/test/CET6ClozePage";
        return ModelView.createView(mv);
    }

    //专项练习短阅读页面
    @GetMapping("/test/ShortReading")
    public ModelAndView viewShortReading() {
        String mv = "Alone/test/ShortReading";
        return ModelView.createView(mv);
    }

    //专项练习长阅读页面
    @GetMapping("/test/LongtoRead")
    public ModelAndView viewLongtoRead() {
        String mv = "Alone/test/LongtoRead";
        return ModelView.createView(mv);
    }

    //专项练习听力对话页面
    @GetMapping("/test/ListeningDialogue")
    public ModelAndView viewListeningDialogue() {
        String mv = "Alone/test/ListeningDialogue";
        return ModelView.createView(mv);
    }

    //专项练习听力短文页面
    @GetMapping("/test/ListeningPassage")
    public ModelAndView viewListeningPassage() {
        String mv = "Alone/test/ListeningPassage";
        return ModelView.createView(mv);
    }

    //专项练习选词填空页面
    @GetMapping("/test/Cloze")
    public ModelAndView viewCloze() {
        String mv = "Alone/test/Cloze";
        return ModelView.createView(mv);
    }

    //专项六级练习短阅读页面
    @GetMapping("/test/CET6ShortReading")
    public ModelAndView viewCET6ShortReading() {
        String mv = "Alone/test/CET6ShortReading";
        return ModelView.createView(mv);
    }

    //专项六级练习长阅读页面
    @GetMapping("/test/CET6LongtoRead")
    public ModelAndView viewCET6LongtoRead() {
        String mv = "Alone/test/CET6LongtoRead";
        return ModelView.createView(mv);
    }

    //专项六级练习听力对话页面
    @GetMapping("/test/CET6ListeningDialogue")
    public ModelAndView viewCET6ListeningDialogue() {
        String mv = "Alone/test/CET6ListeningDialogue";
        return ModelView.createView(mv);
    }

    //专项六级练习听力短文页面
    @GetMapping("/test/CET6ListeningPassage")
    public ModelAndView viewCET6ListeningPassage() {
        String mv = "Alone/test/CET6ListeningPassage";
        return ModelView.createView(mv);
    }

    //专项六级练习选词填空页面
    @GetMapping("/test/CET6Cloze")
    public ModelAndView viewCET6Cloze() {
        String mv = "Alone/test/CET6Cloze";
        return ModelView.createView(mv);
    }

    @GetMapping("/test/LongtoReadBackground")
    public ModelAndView viewLongtoReadBackground() {
        String mv = "Alone/test/LongtoReadBackground";
        return ModelView.createView(mv);
    }

    @GetMapping("/test/addShortRead")
    public ModelAndView viewaddShortRead() {
        String mv = "Alone/test/addShortRead";
        return ModelView.createView(mv);
    }

    @GetMapping("/test/updateShortRead")
    public ModelAndView updateShortRead() {
        String mv = "Alone/test/updateShortRead";
        return ModelView.createView(mv);
    }

    @GetMapping("/test/showShortRead")
    public ModelAndView showShortRead() {
        String mv = "Alone/test/showShortRead";
        return ModelView.createView(mv);
    }

    @PostMapping(value = "/shortreading", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<ShortReading> AllPractice(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<ShortReading> practices = shortReadingService.getAllShortReading(map);
        System.out.println(practices.toString());
        int page = shortReadingService.getAllPage();
        Page<ShortReading> data = new Page<ShortReading>();
        data.setTotal(page);
        data.setData(practices);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/listeningdialogue", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<ListeningDialogue> AllListeningPractice(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<ListeningDialogue> listening = ListeningDialogue.getAllListeningDialogue(map);
        int page = ListeningDialogue.getAllPage();
        Page<ListeningDialogue> data = new Page<ListeningDialogue>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cloze", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<Cloze> AllCloze(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<Cloze> clozes = clozeService.getAllCloze(map);
        int page = clozeService.getAllPage();
        Page<Cloze> data = new Page<Cloze>();
        data.setTotal2(page);
        data.setData2(clozes);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/listeningpassage", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<ListeningPassage> AllListeningPassage(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<ListeningPassage> listening = listeningPassageService.getAllListeningPassage(map);
        int page = listeningPassageService.getAllPage();
        Page<ListeningPassage> data = new Page<ListeningPassage>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/longtoread", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<LongtoRead> AllLongtoRead(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<LongtoRead> listening = longtoReadService.getAllLongtoRead(map);
        int page = longtoReadService.getAllPage();
        Page<LongtoRead> data = new Page<LongtoRead>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cet6shortreading", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<CET6ShortReading> AllCET6Practice(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<CET6ShortReading> practices = cet6ShortReadingService.getAllCET6ShortReading(map);
        System.out.println(practices.toString());
        int page = cet6ShortReadingService.getAllPage();
        Page<CET6ShortReading> data = new Page<CET6ShortReading>();
        data.setTotal(page);
        data.setData(practices);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cet6listeningdialogue", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<CET6ListeningDialogue> AllCET6ListeningPractice(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<CET6ListeningDialogue> listening = cet6ListeningDialogue.getAllCET6ListeningDialogue(map);
        int page = cet6ListeningDialogue.getAllPage();
        Page<CET6ListeningDialogue> data = new Page<CET6ListeningDialogue>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cet6cloze", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<CET6Cloze> AllCET6Cloze(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<CET6Cloze> clozes = cet6ClozeService.getAllCET6Cloze(map);
        int page = cet6ClozeService.getAllPage();
        Page<CET6Cloze> data = new Page<CET6Cloze>();
        data.setTotal2(page);
        data.setData2(clozes);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cet6listeningpassage", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<CET6ListeningPassage> AllCET6ListeningPassage(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<CET6ListeningPassage> listening = cet6ListeningPassageService.getAllCET6ListeningPassage(map);
        int page = cet6ListeningPassageService.getAllPage();
        Page<CET6ListeningPassage> data = new Page<CET6ListeningPassage>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/cet6longtoread", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<CET6LongtoRead> AllCET6LongtoRead(int pageIndex, int pageSize, HttpServletResponse response) {
        Map map = new HashMap();
        map.put("pi", (pageIndex - 1) * pageSize);
        map.put("ps", pageSize);
        List<CET6LongtoRead> listening = cet6LongtoReadService.getAllCET6LongtoRead(map);
        int page = cet6LongtoReadService.getAllPage();
        Page<CET6LongtoRead> data = new Page<CET6LongtoRead>();
        data.setTotal1(page);
        data.setData1(listening);
        JSONObject json = new JSONObject();
        json.put("data", data);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/shortread", produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String getAllAdmins(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               HttpServletResponse response)
    {
        Map map = new HashMap();
        map.put("pageIndex", (page - 1) * limit);
        map.put("pageSize", limit);
        List<ShortReading> listening = shortReadingService.getLimitShortReading(map);
        int page1 = shortReadingService.getAllPage();
        String string = ResponseUtil.createJson(0,"成功",page1,listening);
        ResponseUtil.writeResp(response, string);
        return null;
    }

    @PostMapping(value = "/addshortread",produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String AddShortRead(String article,String topic,String selectA,String selectB,
                               String selectC,String selectD,String answer,String parsing,HttpServletResponse response){
        ShortReading shortReading=new ShortReading();
        shortReading.setArticle(article);
        shortReading.setAnswer(answer);
        shortReading.setSelectA(selectA);
        shortReading.setSelectB(selectB);
        shortReading.setSelectC(selectC);
        shortReading.setSelectD(selectD);
        shortReading.setParsing(parsing);
        shortReading.setTopic(topic);
        int key=shortReadingService.AddShortReading(shortReading);
        JSONObject decide = new JSONObject();
        decide.put("code",key);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }

    @PostMapping(value = "/byidshortread", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Page<ShortReading> getByIdShortReading(Integer id, HttpServletResponse response) {
        List<ShortReading> shortReading = shortReadingService.getByIdShortReading(id);
        System.out.println(shortReading);
        JSONObject json = new JSONObject();
        json.put("data", shortReading);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }

    @PostMapping(value = "/updateshortread",produces = "application/json ;charset=UTF-8")
    @ResponseBody
    public String UpdateShortRead(String article,String topic,String selectA,String selectB,
                               String selectC,String selectD,String answer,String parsing,Integer id,HttpServletResponse response){
        ShortReading shortReading=new ShortReading();
        shortReading.setArticle(article);
        shortReading.setAnswer(answer);
        shortReading.setSelectA(selectA);
        shortReading.setSelectB(selectB);
        shortReading.setSelectC(selectC);
        shortReading.setSelectD(selectD);
        shortReading.setParsing(parsing);
        shortReading.setTopic(topic);
        shortReading.setId(id);
        int key=shortReadingService.UpdateAddShortReading(shortReading);
        JSONObject decide = new JSONObject();
        decide.put("code",key);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }

    @PostMapping(value = "/deleteshortreadbyids",produces = "application/json ;charset=UTF-8")
    public String deleteByIds(@RequestParam("ids") String accounts, HttpServletResponse response){

        String[] id =  accounts.split(",");
        /*int[] ids=new int[id.length];
        for (int i=0;i<id.length;i++){
            ids[i]=Integer.parseInt(id[i]);
        }*/
        Integer[] ids=(Integer[]) ConvertUtils.convert(id,Integer.class);
        int key = shortReadingService.deleteShortReadingByIds(ids);
        JSONObject decide = new JSONObject();
        decide.put("code",key);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }

    @PostMapping(value = "/deleteshortreadbyid",produces = "application/json ;charset=UTF-8")
    public String deleteById(@RequestParam("id") String id, HttpServletResponse response){
        Integer ids=(Integer) ConvertUtils.convert(id,Integer.class);
        int key = shortReadingService.deleteShortReadingById(ids);
        JSONObject decide = new JSONObject();
        decide.put("code",key);
        ResponseUtil.writeResp(response,decide.toJSONString());
        return null;
    }
}
