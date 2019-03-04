package com.aldrich.utils;

/**
 * @author aldrich
 * @date 2018/11/22 20:43
 */
public class StringUtil {

   /**
   * 判断字符串为空
   * */
    public static boolean isEmpty(String str){
        return "".equals(str) || str == null;
    }

    /**
     * 判断字符串不为空
     * */
    public static boolean isNotEmpty(String str){
        return !"".equals(str) && str != null;
    }

    /**
     * 生成模糊查询字符串
     * */
    public static String formatLike(String str){
        if(isNotEmpty(str)){
            return "%"+str+"%";
        }else{
            return null;
        }
    }


}
