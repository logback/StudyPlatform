package com.aldrich.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;

/**
 * @ClassName CtrLogging
 * @Description TODO
 * @Author Aldrich
 * @Date 2019/4/11 15:34
 * @Version 1.0
 */
@Component("ctrLogging")
@Aspect
public class CtrLogging {

    private long currentMillis = 0;

    @Resource
    private LogUtil logUtil;
    /**
     * @Pointcut("execution(* com.aldrich.controller.*.*(..))")
     *定义一个切入点方法
     * */
    private void allMethods(){}

    /**
     * @Before("execution(* com.aldrich.controller.*.*(..))")
     * 针对指定的切入点表达式选择的切入点应用前置通知
     * */
    public void before(JoinPoint call) {
        logUtil.beforeInform(call);
    }


    /**
     * @AfterReturning("allMethods()")
     * 访问命名切入点来应用后置通知
     * */
    public void afterReturn(JoinPoint call) {
        logUtil.afterInform(call);
    }


    /**
     *@After("allMethods()")
     *应用最终通知
     * */
    public void after(JoinPoint call)
    {
        logUtil.finalInform(call,"Controller");
    }


    /**
     * @AfterThrowing("allMethods()")
     *应用异常抛出后通知
     * */
    public void afterThrowing(JoinPoint call, Throwable exe)
    {
        logUtil.jpAnalysis(call);
        logUtil.recordThrowable(exe);
    }


    /*  @Around("allMethod()")*/
    /*

     应用环绕通知
    public Object doAround(ProceedingJoinPoint call) throws Throwable{
        Object result = null;
        this.before(call);
        //相当于前置通知
        try {
            result = call.proceed();
            this.afterReturn(); //相当于后置通知
        } catch (Throwable e) {
            this.afterThrowing();  //相当于异常抛出后通知
            throw e;
        }finally{
            this.after();  //相当于最终通知
        }
        return result;
    }
*/

}
