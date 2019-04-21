package com.aldrich.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.SimpleDateFormat;

/**
 * @ClassName LogUtil
 * @Description TODO
 * @Author Aldrich
 * @Date 2019/4/12 15:40
 * @Version 1.0
 */
@Component
public class LogUtil {

    private static final Logger logs = (Logger) LoggerFactory.getLogger(LogUtil.class);

    private static   long currentMillis = 0;

    /**
     * @Author aldrich
     * @Description 判断异常的类型
     * @Date 16:28 2019/4/12
     * @Param [throwable]
     * @return java.lang.StringBuilder
     */
    public StringBuilder decideExceptionType(Throwable throwable)
    {
        StringBuilder log = new StringBuilder();
        if (throwable instanceof  ArithmeticException)
        {
            log.append("算术异常类：ArithmeticExecption");
        }
        else if (throwable instanceof  NullPointerException)
        {
            log.append("空指针异常类：NullPointerException");
        }
        else if (throwable instanceof  ClassCastException)
        {
            log.append("类型强制转换异常：ClassCastException");
        }
        else if (throwable instanceof  ArrayIndexOutOfBoundsException)
        {
            log.append("数组下标越界异常：ArrayIndexOutOfBoundsException");
        }
        else if (throwable instanceof IOException)
        {
            log.append("输入输出异常：IOException");
        }
        else
        {
            log.append(throwable.getClass().toString().substring(6));
        }
        return log;
    }


    /**
     * @Author aldrich
     * @Description  将异常信息写入error级日志文件
     * @Date 19:32 2019/4/13
     * @Param [throwable]
     * @return void
     */
    public void recordThrowable(Throwable throwable)
    {
        StringBuilder type=decideExceptionType(throwable);
        logs.error("【异常产生类型】:{}",type);
        logs.error("【异常产生原因】:{}",throwable.getMessage());
        logs.error("该异常的堆栈信息如下：");
        logs.error(printCallStack(throwable)+"");
    }

    /**
     * @Author aldrich
     * @Description aop 异常方法连接点解析通知
     * @Date 16:34 2019/4/12
     * @Param [joinPoint]
     * @return java.lang.StringBuilder
     */
    public void jpAnalysis(JoinPoint joinPoint)
    {
        StringBuilder log = new StringBuilder();
        String className = joinPoint.getTarget().getClass().getName();

        String methodName = joinPoint.getSignature().getName();

        logs.error("【异常抛出通知】:系统发生异常了,异常详情如下:");
        logs.error("【异常方法位置】："+className+"-->"+methodName);

        //获取参数名
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        String[] paramNameArr = methodSignature.getParameterNames();

        //获取参数值
        Object[] paramValueArr = joinPoint.getArgs();
        int j=0;
        for(int i=0;i<paramValueArr.length;i++){
            j++;
            log.append("【异常方法参数").append(j).append("】:").append("参数名-->").append(paramNameArr[i]).append(",").append("参数值-->").append(paramValueArr[i]).append("\n");
        }
        logs.error(log.toString());
    }

    /**
     * @Author aldrich
     * @Description aop 前置通知
     * @Date 16:46 2019/4/12
     * @Param [joinPoint]
     * @return java.lang.StringBuilder
     */
    public void beforeInform(JoinPoint joinPoint)
    {
        StringBuilder log = new StringBuilder();
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        log.append("【前置通知】:");
        log.append(className).append("类的");
        log.append(methodName).append("()方法");
        log.append("开始执行");
        logs.info(log.toString());
    }


    /**
     * @Author aldrich
     * @Description aop 后置通知
     * @Date 16:47 2019/4/12
     * @Param [joinPoint]
     * @return java.lang.StringBuilder
     */
    public void afterInform(JoinPoint joinPoint)
    {
        StringBuilder log = new StringBuilder();
        String consuming=(System.currentTimeMillis()-currentMillis)/1000f+"秒";
        String methodName = joinPoint.getSignature().getName();
        log.append("【后置通知】:");
        log.append(methodName);
        log.append("()方法正常结束了:").append(" ");
        log.append("共耗时：");
        log.append(consuming);
        logs.info(log.toString());
    }

    /**
     * @Author aldrich
     * @Description
     * @Date 11:39 2019/4/16
     * @Param
     * @return
     */
    public void finalInform(JoinPoint joinPoint,String floor)
    {
        String methodName = joinPoint.getSignature().getName();
        StringBuilder info = new StringBuilder();
        info.append("【最终通知】:");
        info.append("StudyPlatform-->");
        info.append(floor).append("层").append("-->");
        info.append(methodName).append("()方法执行结束了!").append("\n");
        logs.info(info.toString());
    }



    /**
     * @Author aldrich
     * @Description 异常堆栈信息打印
     * @Date 20:12 2019/4/13
     * @Param [throwable]
     * @return java.lang.StringBuilder
     */
    public static StringBuilder printCallStack(Throwable throwable) {
        StringBuilder info = new StringBuilder();
        StackTraceElement[] stackElements = throwable.getStackTrace();
        if (stackElements != null) {
            for (StackTraceElement stackElement : stackElements) {
                info.append("【类】:").append(stackElement.getClassName()).append("\t");
                info.append("【行数】:").append(stackElement.getLineNumber()).append("\t");
                info.append("【方法】:").append(stackElement.getMethodName()).append("()").append("\n");
            }
        }
        return info;
    }
}
