<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/29
  Time: 14:00
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
    <title>登录界面</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/loginStyles.css">
</head>
<body class="login-bg">

<div class="login">
    <div class="message">小白学习前台登录</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" action="" id="login">
        <input name="account" id="account"  placeholder="账号"  type="text" lay-verify="required|account" class="layui-input" autocomplete="off" >
        <hr class="hr15">
        <input name="pwd" id="pwd" placeholder="密码"  lay-verify="required|pwd" type="password" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <input class="loginin" value="登录" lay-submit="" lay-filter="demo1" style="width:100%;" type="submit">
        <hr class="hr20" >
        <a  id=""    class="" style="">忘记密码</a>
        <a id="register" class="" style="margin-left: 62%;font-size: 13px">注册用户</a>
    </form>
</div>


<%--
<form action="<%=basePath%>user/login" method="post">
    用户名:<input type="text" name="account" /><br/>
    密码:<input type="password" name="pwd" ><br/>
    <input type="submit" value="login"/><br>
    <font color="red">${errorMsg }</font>
</form>
--%>


</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript">
        let  account=$('#account'),
             pwd=$('#pwd');
        layui.use(['layer','laydate','form'],function() {
            let layer = layui.layer,
                form = layui.form;

          /*  /!**
             * 通用表单验证
             *!/
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
            });*/

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
                            window.location.href="start/system";
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
