<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2018/12/31
  Time: 1:22
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
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="author" content="order by dede58.com"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="revised" content="Ningxia Seasons, 2015/8/13/" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <!-- 搜索关键字 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>a</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <!-- Bootstrap -->
    <link href="<%=basePath%>assets/Trahald/css/crowdfunding.center/make_head.css" rel="stylesheet">
</head>
<body>
<!-- 开始 -->
<div class="make_head_title">修改头像</div>
<div class="make_head_content">
    <div class="make_head_content_pic">
        <input id="head" type="button">
    </div>
    <div class="make_head_content_sm_pic">
        <img src="<%=basePath%>assets/Trahald/images/member_center/default.jpg">
        <br>头像100 x 100
    </div>
</div>

<!-- 结束 -->
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
</body>
</html>

<script>

</script>