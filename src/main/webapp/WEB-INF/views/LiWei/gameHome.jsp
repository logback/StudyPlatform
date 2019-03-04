<%--
  Created by IntelliJ IDEA.
  User: Lingjie Kong
  Date: 2018/12/25
  Time: 9:45
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
    <meta charset="UTF-8">
    <title>Game</title>
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/index.css">

    <script src="<%=basePath%>assets/LiWei/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <!-- CSS公共部分 开始 -->

    <link href="<%=basePath%>assets/LiWei/css/style.css" rel="stylesheet">
    <!-- CSS公共部分 结束 -->

    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/header.css">
</head>
<body>
<!--<header class="header" id="header">
<div class="header-bg"></div>
<div class="header-top">
<div class="container">
<nav class="header-nav">
    <a href="#" class="item">小白</a>
  <a href="#" class="item item-cur">首页</a>
  <a href="#" class="item">小白简介</a>
  <a href="#" class="item new-icon">个人中心<i></i></a>
  <a href="#" class="item">退出</a>
  <div class="nav-more__hover">
    <div class="wrapper">
    </div>
  </div>
</nav>
</div>
</div>-->
<div class="container-fluid cfh_top" style="height: 70px;">
           <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main">
            <a href="#" class="logo" style="line-height: 64px;">小白学习平台</a>
            <!-- 天气信息 -->
            <div class="weather" pc>
                <div id="tp-weather-widget"></div>
                <script>(function (T, h, i, n, k, P, a, g, e) {
                    g = function () {
                        P = h.createElement(i);
                        a = h.getElementsByTagName(i)[0];
                        P.src = k;
                        P.charset = "utf-8";
                        P.async = 1;
                        a.parentNode.insertBefore(P, a)
                    };
                    T["ThinkPageWeatherWidgetObject"] = n;
                    T[n] || (T[n] = function () {
                        (T[n].q = T[n].q || []).push(arguments)
                    });
                    T[n].l = +new Date();
                    if (T.attachEvent) {
                        T.attachEvent("onload", g)
                    } else {
                        T.addEventListener("load", g, false)
                    }
                }(window, document, "script", "tpwidget", "//widget.seniverse.com/widget/chameleon.js"))</script>
                <script>tpwidget("init", {
                    "flavor": "slim",
                    "location": "WX4FBXXFKE4F",
                    "geolocation": "disabled",
                    "language": "zh-chs",
                    "unit": "c",
                    "theme": "chameleon",
                    "container": "tp-weather-widget",
                    "bubble": "disabled",
                    "alarmType": "badge",
                    "color": "#FFFFFF",
                    "uid": "U9EC08A15F",
                    "hash": "14dff75e7253d3a8b9727522759f3455"
                });
                tpwidget("show");</script>
            </div>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">

                <!--<%--主页--%>-->
                <li class="layui-nav-item showNotice" id="showNotice" pc>
                    <a href="<%=basePath%>index.jsp"><i class="fa fa-telegram"
                                                        aria-hidden="true"></i><cite>主页</cite></a>
                </li>

                <!-- <%--查询--%>-->
                <li class="layui-nav-item">
                    <a href="<%=basePath%>start/reception/search" data-url="page/user/changePwd.html"><i
                            class="fa fa-search" aria-hidden="true"></i><cite>查词</cite></a>
                </li>

                <!-- <%--练习--%>-->
                <li class="layui-nav-item">
                    <a href="<%=basePath%>start/test/HomePage"><i class="fa fa-check-square" aria-hidden="true"></i>
                        <cite>练习</cite></a>
                </li>

                <!-- <%--游戏--%>-->
                <li class="layui-nav-item">
                    <a href="<%=basePath%>game/gamehome"><i class="fa fa-check-square"
                                                          aria-hidden="true"></i><cite>游戏</cite></a>
                </li>

                <!-- <%--资源--%>-->
                <li class="layui-nav-item lockcms" pc>
                    <a href="<%=basePath%>start/test"><i class="fa fa-play-circle-o"
                                                         aria-hidden="true"></i><cite>资源</cite></a>
                </li>

                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="<%=basePath%>assets/LiWei/images/back_top_qq_move.png" class="layui-circle" width="35" height="35">
                        <cite id="memberName"></cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu"
                                                                                         data-icon="icon-zhanghu"></i><cite>个人主页</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1"
                                                                                          data-icon="icon-shezhi1"></i><cite>修改密码</cite></a>
                        </dd>
                        <dd><a href="javascript:;"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

</div>


<script type="text/javascript">
    $(function(){
        $.ajax({
            url:'<%=basePath%>personal/selectName',
            dataType: "json",
            success:function (data) {
                console.log(data);
                $('#memberName').html(data.name.name);
            }
        });
    });
</script>

<div class="container">
    <div id="timer"></div>
    <h1>Four or Six Levels Away</h1>
</div>
<div class="box">

    <div class="link mission-link">

        <span class="icon animated"></span>

        <a class="button" data-title="My mission is clear" href="<%=basePath%>game/gamestart">

            <span class="line line-top"></span>

            <span class="line line-right"></span>

            <span class="line line-bottom"></span>

            <span class="line line-left"></span>
            Start
        </a>
    </div>

    </a>

    <p class="tip"><em></em><span></span></p>

</div>
</body>
</html>



