<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2018/12/31
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">

    <title> 个人中心</title>

    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <!-- CSS公共部分 开始 -->
    <link href="<%=basePath%>assets/Trahald/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>assets/Trahald/css/style.css" rel="stylesheet">
    <!-- CSS公共部分 结束 -->

    <link href="<%=basePath%>assets/Trahald/css/crowdfunding.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/Trahald/css/header.css">
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
</head>
<body>
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
                    <a href="<%=basePath%>game/gamestart"><i class="fa fa-check-square"
                                                          aria-hidden="true"></i><cite>游戏</cite></a>
                </li>

                <!-- <%--资源--%>-->
                <li class="layui-nav-item lockcms" pc>
                    <a href="<%=basePath%>start/test"><i class="fa fa-play-circle-o"
                                                         aria-hidden="true"></i><cite>资源</cite></a>
                </li>

                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="<%=basePath%>assets/Trahald/images/index/back_top_qq.png" class="layui-circle"
                             width="35" height="35">
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
                 //   console.log(data);
                    $('#memberName').html(data.name.name);
                  //  personalName
                }
            });
        });

</script>
<!--
<script type="text/javascript">
    layui.use('element', function () {
        let element = layui.element;
    });
</script>
-->
<!-- 核心 开始 -->
<div class="container border1 nopadding margin10" style="margin-top: 75px;height: 600px">
    <div class="col-lg-3 background831312 nopadding" style="height: 600px">
        <div class="dead_pic"><img src="<%=basePath%>assets/Trahald/images/member_center/QQ.jpg"><br>
            <span class="username">用户名</span></div>
        <div class="usertype">用户<br>
            会员等级：<img style="margin-right:0;" src="<%=basePath%>assets/Trahald/images/member_center/star.png">
            <img style="margin-right:0;" src="<%=basePath%>assets/Trahald/images/member_center/xx2.png">
            <img style="margin-right:0;" src="<%=basePath%>assets/Trahald/images/member_center/xx2.png">
            <img style="margin-right:0;" src="<%=basePath%>assets/Trahald/images/member_center/xx2.png">
            <img style="margin-right:0;" src="<%=basePath%>assets/Trahald/images/member_center/xx2.png"></div>
        <div class="menu">
            <div class="menu_title"> 我的信息</div>
            <div class="menu_list">
                <ul class="list-unstyled">
                    <li id="listClick1" class="menu_list_on" onClick="listClick(1)">
                        <img src="<%=basePath%>assets/Trahald/images/member_center/left_icon_1.png"> 基本信息
                    </li>
                    <li id="listClick2" class="" onClick="listClick(2)">
                        <img src="<%=basePath%>assets/Trahald/images/member_center/left_icon_2.png">
                        修改头像
                    </li>
                    <!-- <li id="listClick3" class="" onClick="listClick(3)"> <img src="img/member_center/left_icon_2.png"> 身份认证</li>-->
                    <li id="listClick4" class="" onClick="listClick(4)">
                        <img src="<%=basePath%>assets/Trahald/images/member_center/left_icon_3.png">
                        修改密码
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-lg-9" width="100%" height="200px">
        <iframe name="left" id="crowdfunding_iframe" src="<%=basePath%>personal/info" frameborder="false"
                scrolling="no" style="border:none;" width="100%" height="620px" allowtransparency="true"></iframe>
    </div>
</div>
<!-- 核心 结束 -->
<!-- JS公共部分 开始 -->

<script src="<%=basePath%>assets/Trahald/js/bootstrap.min.js"></script>
<script src="<%=basePath%>assets/Trahald/js/basics.js"></script>
<!-- JS公共部分 结束 -->
<script src="<%=basePath%>assets/Trahald/js/crowdfunding.js"></script>
</body>
</html>
