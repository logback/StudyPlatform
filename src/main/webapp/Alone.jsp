<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2018/12/13
  Time: 9:03
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
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <title></title>
    <style>
        a{
            margin-left: 20px;
        }
    </style>

</head>
<body>
<h2>Hello World!</h2>
<img src="<%=basePath%>assets/images/userface3.jpg">
<br>
<br>

<a href="<%=basePath%>start/home" class="layui-btn">首页</a>

<a href="<%=basePath%>start/backstage/main" class="layui-btn">后台首页</a>

<a href="<%=basePath%>start/reception/search" class="layui-btn">搜索</a>

<a href="<%=basePath%>start/backstage/login" class="layui-btn">登录</a>

<a href="<%=basePath%>start/test/ReadPractice" class="layui-btn">练习</a>

<a href="<%=basePath%>start/test/HomePage" class="layui-btn">专项练习首页</a>

<a href="<%=basePath%>start/test/ListeningPractice" class="layui-btn">听力练习</a>

<a href="<%=basePath%>start/test/Cloze" class="layui-btn">完型填空</a>

</body>
</html>
