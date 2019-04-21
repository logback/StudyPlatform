package com.aldrich.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;

/**
 * @author aldrich
 * @date 2018/11/19 8:13
 */
@Component("srvLogging")
@Aspect
class SrvLogging {

    private long currentMillis = 0;
    @Resource
    private LogUtil logUtil;
    /**
     * @Pointcut("execution(* com.aldrich.service.impl.*.*(..))")
     *定义一个切入点方法
     * */
    private void allMethod(){}

    /**
     * @Before("execution(* com.aldrich.service.impl.*.*(..))")
     * 针对指定的切入点表达式选择的切入点应用前置通知
     * */
    public void before(JoinPoint call) {
        logUtil.beforeInform(call);
    }

    /**
     * @AfterReturning("allMethod()")
     * 访问命名切入点来应用后置通知
     * */
    public void afterReturn(JoinPoint call) {
        logUtil.afterInform(call);
    }


    /**
     *@After("allMethod()")
     *应用最终通知
     * */
    public void after(JoinPoint call){
      logUtil.finalInform(call,"Service");
    }

    /**
     * @AfterThrowing("allMethod()")
     *应用异常抛出后通知
     * */
    public void afterThrowing(JoinPoint call, Throwable ex)
    {
        logUtil.jpAnalysis(call);
        logUtil.recordThrowable(ex);
    }

}
