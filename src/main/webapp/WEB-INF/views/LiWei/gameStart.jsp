<%--
  Created by IntelliJ IDEA.
  User:Lingjie Kong
  Date: 2018/12/25
  Time: 9:54
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
    <title>四级</title>
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/index1.css">

    <script src="<%=basePath%>assets/LiWei/js/jquery.js"></script>
    <!-- CSS公共部分 开始 -->
    <link href="<%=basePath%>assets/LiWei/css/style.css" rel="stylesheet">
    <!-- CSS公共部分 结束 -->

    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/header.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/liwei.css">
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
    <style>
        body {
            text-align: center
        }

        .big {
            margin: 0 auto;
            margin-top: 10px;
            border: 0px solid;
            width: 1100px;
            height: 620px;

        }

        .word1 {
            font-family: "幼圆";
            font-size: 23px;
            float: left;
            margin-top: 25px;
        }

        .mag {
            width: 1100px;
            height: 620px;
            margin-top: 0px;
        }
    </style>
</head>

<body>
<div class="container-fluid cfh_top" style="height: 70px;">

    <div class="layui-header header">
        <div class="layui-main">
            <a href="#" class="logo" style="line-height: 64px;">小白学习平台</a>
            <!-- 天气信息 -->
            <div class="weather" pc>
                <div id="tp-weather-widget"></div>
                <script>
                    (function (T, h, i, n, k, P, a, g, e) {
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
                    }(window, document, "script", "tpwidget", "//widget.seniverse.com/widget/chameleon.js"))
                </script>
                <script>
                    tpwidget("init", {
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
                    tpwidget("show");
                </script>
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
                        <dd>
                            <a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu"
                                                                                         data-icon="icon-zhanghu"></i><cite>个人主页</cite></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1"
                                                                                          data-icon="icon-shezhi1"></i><cite>修改密码</cite></a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="iconfont icon-loginout"></i><cite>退出</cite></a>
                        </dd>
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


<div class="big">
    <div class="word">
        <div class="word1"><b>请选出正确选项</b></div>
    </div>
    <div class="mag" style="background: url(<%=basePath%>assets/LiWei/images/tupian.jpg);">
        <div id="topic">
            <!--题干序号打印在b标签中-->

            <!--题干打印在p标签中-->
            <p id="word"></p>
        </div>
        <div id="options">
            <div id="options_A">
                <div id="options_A_div">
                    <div id="options_A_A">
                        <div class="options_A">
                            <h3><b>A</b></h3>
                        </div>
                        <div class="options_A">
                            <h3><b>B</b></h3>
                        </div>
                        <div class="options_A">
                            <h3><b>C</b></h3>
                        </div>
                        <div class="options_A">
                            <h3><b>D</b></h3>
                        </div>
                    </div>
                    <div id="options_B">
                        <div class="options_B_B">
                            <h3><b><input id="A" name="sex" type="radio" value="A"/></b></h3>
                        </div>
                        <div class="options_B_B">
                            <h3><b><input id="B" name="sex" type="radio" value="B"/></b></h3>
                        </div>
                        <div class="options_B_B">
                            <h3><b><input id="C" name="sex" type="radio" value="C"/></b></h3>
                        </div>
                        <div class="options_B_B">
                            <h3><b><input id="D" name="sex" type="radio" value="D"/></b></h3>
                        </div>
                    </div>
                </div>
            </div>
            <div id="answer">
                <!--题目答案打印循环开始-->
                <div class="answer_P">
                    <p id="selectA"></p>
                </div>
                <div class="answer_P">
                    <p id="selectB"></p>
                </div>
                <div class="answer_P">
                    <p id="selectC"></p>
                </div>
                <div class="answer_P">
                    <p id="selectD"></p>
                </div>
                <input type="radio" id="test" value="" style="display:none;">
                <!--题目答案打印循环结束-->
            </div>
        </div>
    </div>
    <div>
        <button id="tijiao" class="layui-btn"><span class="btn-span">下一题</span></button>
    </div>
</div>
</body>
</html>


<script type="text/javascript" language="javascript">
    var grade = 0;
    var count = 0;
    load();

    function load() {
        $(function () {
            $.ajax({
                url: '<%=basePath%>game/play',
                type: 'post',
                dataType: "json",
                success: function (data) {
                    $('#word').html(data.data[0].name);
                    $('#word').val(data.data[0].name);

                    $('#selectA').html(data.data[data.ron0].meaning);
                    $('#A').val(data.data[data.ron0].meaning);
                    $('#selectB').html(data.data[data.ron1].meaning);
                    $('#B').val(data.data[data.ron1].meaning);
                    $('#selectC').html(data.data[data.ron2].meaning);
                    $('#C').val(data.data[data.ron2].meaning);
                    $('#selectD').html(data.data[data.ron3].meaning);
                    $('#D').val(data.data[data.ron3].meaning);

                    if (count >= 5) {
                        count = 0;
                        layer.alert('你获得了' + grade + '分', {
                            skin: 'layui-layer-molv' //样式类名  自定义样式
                            ,closeBtn: 1    // 是否显示关闭按钮
                            ,anim: 1 //动画类型
                            ,btn: ['确定'] //按钮
                            ,icon: 6    // icon
                            ,yes:function(){
                                window.location.href = "<%=basePath%>/game/gamehome";//需要跳转的地址
                            }
                        });
                    }
                    //var val = data.data[0].meaning;
                   // test为了传值
                    $('#test').val(data.data[0].meaning);
                }
            });
        });
    }

    $("#tijiao").click(function () {
        var test = $('#test').val();
        var v = $('input:radio[name="sex"]:checked').val();
        if(v!=null){
            count++;
            if(test == v){
                grade += 20;
            }

            $('input:radio[name=sex]').prop('checked',false);
            load();
        }else if(v==null){
           //alert("请选择");
            layer.alert('请选择', {icon: 6});
        //   layer.msg("请选择");
        }
    });
</script>