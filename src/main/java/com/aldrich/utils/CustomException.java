package com.aldrich.utils;

/**
 * @ClassName CustomException
 * @Description TODO
 * @Author Aldrich
 * @Date 2019/4/22 14:50
 * @Version 1.0
 */
public class CustomException extends Exception{

    private static final long serialVersionUID = 7285493549131712373L;

    public CustomException(String message){
        super(message);
        this.message = message;
    }
    //异常信息
    private String message;
    @Override
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

}
