<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2018/12/13
  Time: 8:25
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
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <title>Title</title>
    <style>
        body {
            background-color: #191919
        }

        .m {
            width: 960px;
            height: 400px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0px;
        }
    </style>
    <%
        String id = request.getParameter("id");
        id = new String(id.getBytes("UTF-8"), "gb2312");
    %>

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
                    <a href="<%=basePath%>game/gamehome"><i class="fa fa-check-square"
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
    <%--头部导航--%>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url: '<%=basePath%>personal/selectName',
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $('#memberName').html(data.name.name);
                }
            });
            Video()
        });
    </script>

</div>
<div class="m">
    <video id="my-video" class="video-js" controls preload="auto" width="1100" height="600"
           poster="m.jpg" data-setup="{}">
        <source src="<%=basePath%>assets\Trahald\video\<%=id %>.mp4" type="video/mp4">
        <p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
    </video>

    <script src="js/video.min.js"></script>
    <script src="http://vjs.zencdn.net/5.19/lang/zh-CN.js"></script>
    <script type="text/javascript">
        var myPlayer = videojs('my-video');
        videojs("my-video").ready(function () {
            var myPlayer = this;
            myPlayer.play();
        });
    </script>
</div>
</body>
</html>
