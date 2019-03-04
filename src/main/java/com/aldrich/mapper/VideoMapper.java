package com.aldrich.mapper;

import com.aldrich.model.Video;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface VideoMapper {
    boolean addVideo(Video video);
    List<Video> selectVideo();




    /**
     * 获取所有的用户记录
     * @return int
     **/
    int getTotalVideo();


}
