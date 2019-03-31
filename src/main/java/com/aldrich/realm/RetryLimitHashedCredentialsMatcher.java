package com.aldrich.realm;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author aldrich
 * @date 2019/1/2 16:50
 */

@Component
public class RetryLimitHashedCredentialsMatcher  extends
        HashedCredentialsMatcher {

    /*
    *在回调方法doCredentialsMatch(AuthenticationToken token,AuthenticationInfo info)中进行身份认证的密码匹配，
    * 这里我们引入了Ehcahe用于保存用户登录次数，
    * 如果登录失败retryCount变量则会一直累加，
    * 如果登录成功，那么这个count就会从缓存中移除，
    * 从而实现了如果登录次数超出指定的值就锁定
    * */

    private Cache<String, AtomicInteger> passwordRetryCache;

    public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token,
                                      AuthenticationInfo info) {
        String account = (String) token.getPrincipal();
        System.out.println("a"+account);
        // retry count + 1
        AtomicInteger retryCount = passwordRetryCache.get(account);

        if (retryCount == null) {
            retryCount = new AtomicInteger(0);
            passwordRetryCache.put(account, retryCount);
        }
        System.out.println("cache"+retryCount);
        System.out.println(retryCount.incrementAndGet());
        if (retryCount.incrementAndGet() > 5) {
            // if retry count > 5 throw
            throw new ExcessiveAttemptsException();
        }

        boolean matches = super.doCredentialsMatch(token, info);
        if (matches) {
            // clear retry count
            passwordRetryCache.remove(account);
        }
        return matches;
    }


}
