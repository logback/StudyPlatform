package com.aldrich.service;

import com.aldrich.model.Video;

import java.util.List;
import java.util.Map;

public interface VideoService {
    boolean addVideo(String name,String url,String vtitle,String imgUrl,String imgName);
    List<Video> selectVideo();

    /**
     * 获取所有的用户记录
     * @return int
     **/
    int getTotalVideo();



}
