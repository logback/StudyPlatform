<%--
  Created by IntelliJ IDEA.
  User: Aldrich
  Date: 2019/3/19
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>登录首页</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/login/css/logins.css">
</head>
<body>

<div class="layui-canvs"></div>

<form class="layui-form" method="post"  action="" id="login">

    <div class="layui-layout layui-layout-login">
        <h1>
            <strong>XiaoBai Four or Six </strong>
            <em>learning Platform</em>
        </h1>

        <%--账号--%>
        <div class="layui-user-icon larry-login">
            <input type="text" name="account" id="account"  placeholder="account/email" lay-verify="required|account" class="login_txtbx" autocomplete="off"/>
        </div>

        <%--密码--%>
        <div class="layui-pwd-icon larry-login">
            <input  name="pwd" id="pwd" placeholder="password" lay-verify="required|pwd" type="password" class="login_txtbx"/>
        </div>

        <%--记住我、忘记密码--%>
        <div class="layui-pwd-icon larry-login">
            <input style="background-color: #00F7DE" type="checkbox" name="like" title="remember me" checked="checked">
            <a style="margin-left: 18.333%;" href="http://www.layui.com" class="layui-btn">reset Password</a>
        </div>

        <%--登录按钮--%>
        <div class="layui-submit larry-login">
            <input  value="Log in" class="submit_btn" lay-submit="" lay-filter="demo1"  type="submit"/>
        </div>

        <%--注册按钮--%>
        <div class="layui-login-text" style="height: 22px">
            <p><a href="http://demo.larrycms.com" title="">Go to register>></a></p>
        </div>
    </div>

</form>


</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/login/js/login.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/login/js/jparticle.jquery.js"></script>
<script>
    $(function(){
        $(".layui-canvs").jParticle({
            background: "#141414",
            color: "#E6E6E6"
        });})
</script>
<script type="text/javascript">
    let  account=$('#account'),pwd=$('#pwd');

    layui.use(['layer','laydate','form'],function() {
        let layer = layui.layer,
            form = layui.form;

          /**
           * 通用表单验证
           */
          form.verify({
              account: function(value, item){ //value：表单的值、item：表单的DOM对象
                  if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                      return '账号不能有特殊字符';
                  }
                  if(/(^\_)|(\__)|(\_+$)/.test(value)){
                      return '账号首尾不能出现下划线\'_\'';
                  }
                  if(/[\u4E00-\u9FA5]/g.test(value)){
                      return '账号不能有中文';
                  }
                  if(value.length!==11)
                  {
                      return '账号必须11位，只能是数字！';
                  }
              },
              pwd:[ /^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']
          });

        //监听提交
        form.on('submit(demo1)', function(data){
            $.ajax({
                url:'<%=basePath%>user/login',
                type: data.form.method,
                data: $(data.form).serialize(),
                beforeSend:function(XMLHttpRequest)
                {
                    layer.load(1,{
                        icon: 1, // 0~2 ,0比较好看
                        // 黑色透明度0.5背景
                    });
                },
                success: function (result) {
                    console.log(result);
                    //layer.msg("登录成功！",{icon:6,time:4000});
                    if(result.code===0)
                    {
                        layer.closeAll();
                        layer.msg("登录成功！",{icon:6,time:4000});
                        window.location.href="start/index";
                    }else if(result.code===1)
                    {
                        layer.closeAll();
                        layer.msg('账号错误',{icon:5,time: 3000});
                        account.val("");
                        pwd.val("");
                    }else if(result.code===2){
                        layer.closeAll();
                        layer.msg('密码错误',{icon:5,time: 3000});
                        account.val("");
                        pwd.val("");
                    }else if(result.code===3){
                        layer.closeAll();
                        layer.msg('错误次数过多，已锁定', {icon: 5, time: 3000});
                        /* account.val("");
                         pwd.val("");
                         account.attr("disabled", true);
                         pwd.attr("disabled", true);*/
                        /*setTimeout(function () {
                             account.removeAttr("disabled");
                         }, 6000);*/
                    }else{
                        layer.closeAll();
                        layer.msg('您无授权',{icon:5,time: 3000});
                        account.val("");
                        pwd.val("");
                    }
                },
                error:function () {
                    layer.msg('发生错误',{icon:5,time: 1000});
                }
            });
            return false;
        });
    });

</script>