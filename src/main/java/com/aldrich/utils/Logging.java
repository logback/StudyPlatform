package com.aldrich.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;

/**
 * @author aldrich
 * @date 2018/11/19 8:13
 */
@Component("logging")
@Aspect
class Logging {

    private long currentMillis = 0;

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

        String className = call.getTarget().getClass().getName();
        String methodName = call.getSignature().getName();
        currentMillis=System.currentTimeMillis();
        String startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentMillis);
        System.out.println("【前置通知】:"+startTime);
        System.out.println(" "+className+ "类的"
                +   methodName+"()方法" + "执行");
    }

    /**
     * @AfterReturning("allMethod()")
     * 访问命名切入点来应用后置通知
     * */
    public void afterReturn() {
        String consuming=(System.currentTimeMillis()-currentMillis)/1000f+"秒";
        currentMillis=System.currentTimeMillis();
        String endTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentMillis);
        System.out.println("【后置通知】:方法正常结束了"+endTime+"耗时："+consuming);
    }


    /**
     *@After("allMethod()")
     *应用最终通知
     * */

    public void after(){
        System.out.println("【最终通知】:aldrich");
    }

    /**
     * @AfterThrowing("allMethod()")
     *应用异常抛出后通知
     * */
    public void afterThrowing() {
        System.out.println("【异常抛出后通知】:方法执行时出异常了");
    }


    /**
     * @Around("allMethod()")
     *应用环绕通知
     * */
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


}
