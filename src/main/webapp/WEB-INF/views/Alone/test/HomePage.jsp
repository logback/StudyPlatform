<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2018/12/13
  Time: 8:51
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
    <meta charset="utf-8">
    <title>小白专项练习首页</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>assets/alone/css/nav.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>assets/alone/css/chongfu/iconfont.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>assets/alone/js/min/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/alone/js/nav.js"></script>
    <style>
        body {
            overflow-x: hidden;
            overflow-y: hidden;
        }

        .right {
            top: 60px;
            left: 225px;
            width: 85.5%;
            height: 100%;
            position: absolute;
            border: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#ID").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/ListeningPage");
            });
            $("#cent").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/ReadPage");
            });
            $("#sent").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/ClozePage");
            });
        });

    </script>
</head>

<body>
<!--头部导航-->
<div class="layui-layout layui-layout-admin">
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

                <%--主页--%>
                <li class="layui-nav-item showNotice" id="showNotice" pc>
                    <a href="<%=basePath%>index.jsp"><i class="fa fa-telegram"
                                                        aria-hidden="true"></i><cite>主页</cite></a>
                </li>

                <%--查询--%>
                <li class="layui-nav-item">
                    <a href="<%=basePath%>start/reception/search" data-url="page/user/changePwd.html"><i
                            class="fa fa-search" aria-hidden="true"></i><cite>查词</cite></a>
                </li>

                <%--练习--%>
                <li class="layui-nav-item">
                    <a href="<%=basePath%>start/test/HomePage"><i class="fa fa-check-square" aria-hidden="true"></i>
                        <cite>练习</cite></a>
                </li>

                <%--游戏--%>
                <li class="layui-nav-item">
                    <a href="<%=basePath%>start/first"><i class="fa fa-check-square"
                                                          aria-hidden="true"></i><cite>游戏</cite></a>
                </li>

                <%--资源--%>
                <li class="layui-nav-item lockcms" pc>
                    <a href="<%=basePath%>start/test"><i class="fa fa-play-circle-o"
                                                         aria-hidden="true"></i><cite>资源</cite></a>
                </li>

                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="<%=basePath%>assets/images/face.jpg" class="layui-circle" width="35" height="35">
                        <cite>大顺发</cite>
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
<div class="nav">
    <ul>
        <li class="nav-item">
            <a href="javascript:;"><i class="my-icon nav-icon "></i><span id="ID">听力</span><i
                    class="my-icon "></i></a>
        </li>
        <li class="nav-item">
            <a href="javascript:;"><i class="my-icon nav-icon "></i><span id="cent">阅读理解</span><i
                    class="my-icon "></i></a>
        </li>
        <li class="nav-item">
            <a href="javascript:;"><i class="my-icon nav-icon "></i><span id="sent">完型填空</span><i
                    class="my-icon "></i></a>
        </li>
    </ul>
</div>
<div class="right">
    <iframe id="ifrID" src="<%=basePath%>start/test/ListeningPage" frameBorder="0" width="100%" scrolling="yes"
            height="100%"></iframe>
</div>
</body>

</html>
<%--头部导航--%>
<script type="text/javascript">
    layui.use('element', function () {
        let element = layui.element;
    });
</script>