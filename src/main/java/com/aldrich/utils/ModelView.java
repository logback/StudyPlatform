package com.aldrich.utils;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author aldrich
 * @date 2018/12/10 9:51
 */
public class ModelView {

    /**
     * 创建视图
     * */
    public static ModelAndView createView(String view)
    {
        ModelAndView mv = new ModelAndView(view);
        return mv;
    }
}
