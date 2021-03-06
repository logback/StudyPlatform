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
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>小白专项练习首页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/words.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/admin.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>assets/alone/css/nav.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>assets/alone/css/chongfu/iconfont.css">
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/alone/js/nav.js"></script>
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/index/js/main.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>

    <style>
        html {
            -ms-overflow-style: none;
            overflow: -moz-scrollbars-none;
        }

        html::-webkit-scrollbar {
            width: 0px
        }

        .right {
            top: 105px;
            left: 204px;
            width: 86.5%;
            height: 699px;
            position: absolute;
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
            $("#ListeningPassage").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/ListeningPassagePage");
            });
            $("#LongtoRead").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/LongtoReadPage");
            });
            $("#CET6ID").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/CET6ListeningPage");
            });
            $("#CET6cent").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/CET6ReadPage");
            });
            $("#CET6sent").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/CET6ClozePage");
            });
            $("#CET6ListeningPassage").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/CET6ListeningPassagePage");
            });
            $("#CET6LongtoRead").bind("click", function () {
                $("#ifrID").attr("src", "<%=basePath%>start/test/CET6LongtoReadPage");
            });
            /*$("#ifrID").center().find("#but").bind("click",function () {
                $(".right").width("100%");
                $("#top").hide();
            });*/
        });
    </script>
</head>

<body>
<!--头部导航栏-->
<!-- Header Area Start -->
<header class="top">
    <div class="header-area header-sticky">
        <div class="container">
            <div class="row">

                <div class="col-md-2 col-sm-2 col-xs-12">
                    <div class="logo">
                        <a href=""><img src="<%=basePath%>assets/index/img/logo/icon.png" alt=""/></a>
                    </div>
                </div>

                <div style="margin-left: 6%" class="col-md-8 col-sm-10 col-xs-12">
                    <div class="content-wrapper">
                        <!-- Main Menu Start -->
                        <div class="main-menu text-right">
                            <nav style="margin-left: 10%">
                                <ul>
                                    <li><a class="title" href="<%=basePath%>start/index">Home</a></li>
                                    <li><a href="<%=basePath%>start/reception/search">Word query</a></li>
                                    <li><a href="<%=basePath%>start/test/HomePage">Special practice</a></li>
                                    <li><a href="<%=basePath%>game/gamestart">Word game</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="mobile-menu hidden-lg hidden-md"></div>
                        <!-- Main Menu End -->
                    </div>
                </div>

                <div style="width: 10.66666667%" class="col-md-2 hidden-sm hidden-xs">

                    <div class="header-social text-center">
                        <ul>
                            <li><a style="font-weight: 600;font-size: 20px" href="">WELCOME!</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->
<div style="width: 100%;height: 700px;margin-top: 4px">
    <div class="nav" id="top">
        <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
            lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item">
                <a href="javascript:;" lay-tips="CET4" lay-direction="2">
                    <i class="layui-icon layui-icon-template"></i>
                    <cite>CET4</cite>
                    <span class="layui-nav-more"></span></a>
                <dl class="layui-nav-child">
                    <dd data-name="grid">
                        <a href="javascript:;">Hearing<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="ID">ListeningDialogue</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="ListeningPassage">ListeningPassage</a></dd>
                        </dl>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd data-name="grid">
                        <a href="javascript:;">Reading<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="cent">ShortReading</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="LongtoRead">LongtoRead</a></dd>
                        </dl>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd data-name="grid">
                        <a href="javascript:;">Gap Filling<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="sent">Cloze</a></dd>
                        </dl>
                    </dd>
                </dl>
            </li>
            <li data-name="home" class="layui-nav-item">
                <a href="javascript:;" lay-tips="CET6" lay-direction="2">
                    <i class="layui-icon layui-icon-template"></i>
                    <cite>CET6</cite>
                    <span class="layui-nav-more"></span></a>
                <dl class="layui-nav-child">
                    <dd data-name="grid">
                        <a href="javascript:;">Hearing<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="CET6ID">CET6ListeningDialogue</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="CET6ListeningPassage">CET6ListeningPassage</a></dd>
                        </dl>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd data-name="grid">
                        <a href="javascript:;">Reading<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="CET6cent">CET6ShortReading</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="CET6LongtoRead">CET6LongtoRead</a></dd>
                        </dl>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd data-name="grid">
                        <a href="javascript:;">Gap Filling<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="javascript:;" id="CET6sent">CET6Cloze</a></dd>
                        </dl>
                    </dd>
                </dl>
            </li>
        </ul>
        <%--<ul>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon "></i><span id="ID">Hearing</span><i
                        class="my-icon "></i></a>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon "></i><span id="cent">Reading</span><i
                        class="my-icon "></i></a>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon "></i><span id="sent">translation</span><i
                        class="my-icon "></i></a>
            </li>
        </ul>--%>
    </div>
    <div class="right">
        <iframe id="ifrID" src="<%=basePath%>start/test/AllQuestions" frameBorder="0" width="100%" scrolling="yes"
                height="100%"></iframe>
    </div>
</div>

<!--脚部-->
<!-- Footer Start -->
<footer class="footer-area">
    <div class="container">
        <div class="main-footer">
            <div class="row">

                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="single-widget mr-50">
                        <h3>about us</h3>
                        <p>Ben Parker：If you could do good things for other people you had a moral obligation to do
                            those things.That's what's at stake here.Not choice.Responsibility. </p>
                        <ul>

                            <!--微信-->
                            <li><a href="#"><i class="layui-icon layui-icon-login-wechat"></i> </a></li>

                            <!--QQ-->
                            <li><a href="#"><i class="layui-icon layui-icon-login-qq"></i></a></li>

                            <!--微博-->
                            <li><a href="#"><i class="layui-icon layui-icon-login-weibo"></i></a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-4 col-sm-3 col-xs-12">
                    <div class="single-widget ml-100">
                        <h3>contact us</h3>
                        <p>2020 Aldrich Glen,<br>
                            Gmail : 201076171@qq.com<br>
                            Phone : +00 111 222 333 <br>
                            address : Anhui Institute of Information Engineering
                        </p>
                    </div>
                </div>


                <div class="col-md-4 col-sm-5 col-xs-12">
                    <div class="single-widget ml-85">
                        <h3>QR code</h3>
                        <div class="footer-img">
                            <a><img src="<%=basePath%>assets/index/img/logo/white2.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom text-center">
            <div class="row">
                <div class="col-xs-12">
                    <p><a target="_blank" href="<%=basePath%>start/backstage/login">Wisdom in the mind is better than
                        money in the hand.</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer End -->
</body>
</html>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
