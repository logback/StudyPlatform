package com.aldrich.utils;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName CustomExceptionResolver
 * @Description TODO
 * @Author Aldrich
 * @Date 2019/4/12 15:29
 * @Version 1.0
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
    {
        ex.printStackTrace();
        CustomException customException = null;
        //如果抛出的是系统自定义异常则直接转换
        if (ex instanceof CustomException) {
            customException = (CustomException) ex;
        } else {
            //如果抛出的不是系统自定义异常则重新构造一个未知错误异常。
            customException = new CustomException("未知错误，请与系统管理 员联系！");
        }

        try {
            request.getRequestDispatcher("/WEB-INF/views/error/thread.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
       /* ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message", customException.getMessage());
        return new ModelAndView("error/thread");
       */
        return null;
    }
}
