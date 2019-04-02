<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10
  Time: 9:39
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
    <div class="message">小白学习平台登录</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" action="" id="login">
        <input name="account" id="account"  placeholder="账号"  type="text" lay-verify="required|account" class="layui-input" autocomplete="off" >
        <hr class="hr15">
        <input name="pwd" id="pwd" placeholder="密码"  lay-verify="required|pwd" type="password" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <input class="loginin" value="登录" lay-submit="" lay-filter="demo1" style="width:100%;" type="submit">
        <hr class="hr20" >&nbsp;&nbsp;
        <a  id=""    class="" style="">忘记密码</a>
        <a id="register" class="" style="margin-left: 62%;font-size: 13px">注册用户</a>
    </form>
</div>
</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/login.js"></script>
