package com.aldrich.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author aldrich
 * @date 2018/11/22 21:16
 */
public class PageUtil {

    /**
     *第几页
     * */
    private int page;

    /**
     *每页的记录条数
     * */
    private int pageSize;


    /**
     *记录起始位置
     * */
    private int start;

    /**
     *记录总数
     * */
    private int count;

    public PageUtil(int page, int pageSize){
        this.page = page;
        this.pageSize = pageSize;
    }

    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStart() {
        return (page-1)*pageSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public static Map<String,Object> createPageMap(int page, int limit)
    {
        PageUtil pageUtilBean = new PageUtil(page,limit);
        Map<String,Object> map=new HashMap<>();
        map.put("pageIndex", pageUtilBean.getStart());
        map.put("pageSize", pageUtilBean.getPageSize());
        return map;
    }


    public static Map<String,Object> createPageMap(int page, int limit,String type)
    {
        PageUtil pageUtilBean = new PageUtil(page,limit);
        Map<String,Object> map=new HashMap<>();
        map.put("pageIndex", pageUtilBean.getStart());
        map.put("pageSize", pageUtilBean.getPageSize());
        map.put("type",type);
        return map;
    }
}
