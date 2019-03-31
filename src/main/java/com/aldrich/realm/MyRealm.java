package com.aldrich.realm;
import com.aldrich.mapper.UserMapper;
import com.aldrich.model.User;
import com.aldrich.service.impl.UserServiceImpl;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Set;

/**
 * @author aldrich
 * @date 2018/12/29 15:12
 */
@Component
public class MyRealm extends AuthorizingRealm {

    @Override
    @Autowired //注入父类的属性，注入加密算法匹配密码时使用
    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher){
        super.setCredentialsMatcher(credentialsMatcher);
    }


    @Autowired
    protected UserMapper userMapper;

    @Resource
    private UserServiceImpl userService;

    /**
     * 用于的权限的认证。
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String account = (String) principals.getPrimaryPrincipal() ;
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo() ;
        Set<String> roleName = userMapper.findRole(account) ;
        Set<String> permissions = userMapper.findPermissions(account) ;

        System.out.println(roleName);
        System.out.println(permissions);

        info.setRoles(roleName);
        info.setStringPermissions(permissions);
        System.out.println(info);
        return info;
    }

    /**
     * 首先执行这个登录验证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
        //获取用户账号
        String account = (String) token.getPrincipal();
        System.out.println("账号"+account);
        User user = userMapper.searchById(account) ;
        System.out.println(user);

        if(user==null){
            throw new UnknownAccountException("用户不存在");
        }

        if (Boolean.TRUE.equals(user.getLock())) {
            // 抛出 帐号锁定异常
            throw new LockedAccountException("账号被锁定!");
        }

        //7.根据用户的情况，来构建AuthenticationInfo对象,通常使用的实现类为SimpleAuthenticationInfo
        //以下信息是从数据库中获取的
        //1)principal：认证的实体信息，可以是username，也可以是数据库表对应的用户的实体对象
        Object principal = user.getAccount();
        //2)credentials：密码
        Object credentials = user.getPassword();
        //3)realmName：当前realm对象的name，调用父类的getName()方法即可
        String realmName = getName();
        //盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(principal);

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,credentials,credentialsSalt,realmName);
        return info;
}


   /* @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }*/


}

