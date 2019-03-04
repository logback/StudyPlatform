package com.aldrich.controller;

import com.aldrich.model.Video;
import com.aldrich.service.impl.VideoServiceImpl;
import com.aldrich.utils.ModelView;
import com.aldrich.utils.PageUtil;
import com.aldrich.utils.ResponseUtil;
import com.alibaba.fastjson.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/start")
public class VideoController extends HttpServlet {
    @Resource
    private VideoServiceImpl videoService;

    //视频主页面
    @GetMapping("/test")
    public ModelAndView videoListening() {
        String mv = "Trahald/video/test";
        return ModelView.createView(mv);
    }

    /**
     * 视频管理页面
     * */
    @GetMapping("/videoManage")
    public ModelAndView viewShow()
    {
        String mv="Trahald/video/videoManage";
        return ModelView.createView(mv);
    }

    /**
     * 添加视频
     * */
    @GetMapping("/addVideo")
    public ModelAndView addVideo()
    {
        String mv="Trahald/video/addVideo";
        return ModelView.createView(mv);
    }


    //视频播放页面
    @GetMapping("/playback")
    public ModelAndView playback() {
        String mv = "Trahald/video/playback";
        return ModelView.createView(mv);
    }

    @RequestMapping(value = "uploadVideo", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView fileUpload2(@RequestParam("file") CommonsMultipartFile file,
                              @RequestParam("imgFile") CommonsMultipartFile imgFile,
                              @RequestParam("vtitle") String vtitle,
                              HttpServletRequest request) throws IOException {
        long startTime = System.currentTimeMillis();
        String basePath = request.getRealPath("/") + "assets/Trahald/video/";
        String imgBasePath = request.getRealPath("/") + "assets/Trahald/images/";
        // System.out.println("fileName："+file.getOriginalFilename());
        String imgFilePath = imgBasePath + imgFile.getOriginalFilename();
        String filePath = basePath + file.getOriginalFilename();

        String url = "assets/Trahald/video/" + file.getOriginalFilename();
        String imgUrl = "assets/Trahald/images/" + imgFile.getOriginalFilename();
        System.out.println("imgUrl============================"+imgUrl);
        String fullname = file.getOriginalFilename();//带后缀的文件名
        String imgName = imgFile.getOriginalFilename();//带后缀的文件名
        System.out.println(imgName+"=====================imgName");
        String name = fullname.substring(0, fullname.lastIndexOf("."));//去后缀
      //  String imgName = imgfullname.substring(0, imgfullname.lastIndexOf("."));//去后缀

        File newFile = new File(filePath);
        File imgNewFile = new File(imgFilePath);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        imgFile.transferTo(imgNewFile);
        System.out.println("================" + filePath);
        System.out.println("================" + imgFilePath);

        boolean addVideo = videoService.addVideo(name, url,vtitle,imgUrl,imgName);

        long endTime = System.currentTimeMillis();
        System.out.println("运行时间：" + String.valueOf(endTime - startTime) + "ms");

        return new ModelAndView("redirect:/start/videoManage");
    }

    @RequestMapping(value = "aaa")
    public ModelAndView toVideo() {
        ModelAndView modelAndView = new ModelAndView();
        List<Video> video = videoService.selectVideo();
        System.out.println(video.toString());//可以输出
        modelAndView.setViewName("Trahald/video/test");
        modelAndView.addObject("vList", video);

        return modelAndView;
    }

    @RequestMapping(value = "selectVideo")
    @ResponseBody
    public String selectVideo(HttpServletResponse response) {
        List<Video> video = videoService.selectVideo();
        int size = video.size();
        JSONObject json = new JSONObject();
        json.put("data", video);
        json.put("size", size);
        ResponseUtil.writeResp(response, json.toJSONString());
        return null;
    }


    /**
     * 获取所有的video
     * */
    @PostMapping(value = "allVideo",produces = "application/json ;charset=UTF-8")
    public String getAllUsers(
                              HttpServletResponse response)
    {
//        List<Video> list =videoService.getLimitVideo(PageUtil.createPageMap(page,limit));\
        List<Video> list = videoService.selectVideo();
        int total = videoService.getTotalVideo();
        System.out.println(total);
        String video = ResponseUtil.createJson(0,"成功",total,list);
        ResponseUtil.writeResp(response,video);
        return null;
    }


}
