package com.aldrich.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * 生成响应返回json对象
 * @author aldrich
 * @date 2018/11/22 20:38
 */
public class ResponseUtil {


    // 是否是Ajax请求
    public static boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("x-requested-with");
        if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
            return Boolean.TRUE;
        } else {
            return Boolean.FALSE;
        }
    }

    public static String createJson(Map<String,Object> map)
    {
        String json = JSON.toJSONString(map);
        return json;
    }


    /**
     * 创建layui格式的json
     * */
    public static String createJson(int code, String msg, int count,List list)
    {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",code);
        jsonObject.put("msg",msg);
        jsonObject.put("count",count);
        jsonObject.put("data",list);
        return jsonObject.toJSONString();
    }




    /**
     *
     * */
    public static void writeResp(HttpServletResponse response,String string){

        try {
            PrintWriter printWriter;
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json;charset=utf-8");
            printWriter = response.getWriter();
            printWriter.println(string);
            printWriter.flush();
            printWriter.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
