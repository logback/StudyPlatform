package com.aldrich.service.impl;

import com.aldrich.mapper.PersonalMapper;
import com.aldrich.mapper.VideoMapper;
import com.aldrich.model.Video;
import com.aldrich.service.VideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("videoService")
public class VideoServiceImpl implements VideoService {
    @Resource
    private VideoMapper mapper;
    @Resource
    private Video video;

    public boolean addVideo(String name,String url,String vtitle,String imgUrl,String imgName){
        video.setName(name);
        video.setUrl(url);
        video.setVtitle(vtitle);
        video.setImgUrl(imgUrl);
        video.setImgName(imgName);

        return this.mapper.addVideo(video);
    }

    public List<Video> selectVideo(){
        return this.mapper.selectVideo();
    }


    /**
     * 获取所有的用户信息记录条数
     * @return int
     **/
    @Override
    public int getTotalVideo() {
        return this.mapper.getTotalVideo();
    }

}
