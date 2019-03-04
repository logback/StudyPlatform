package com.aldrich.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author aldrich
 * @date 2018/12/14 10:28
 */
public class TimeUtil {



    public static Date timeUtil(String time) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd ");
        Date date = df.parse(time);
        return date;
    }

    public static void main(String[] args) {
        System.out.println("测试");
    }

}
