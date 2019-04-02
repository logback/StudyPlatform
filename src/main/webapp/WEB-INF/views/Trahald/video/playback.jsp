<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2018/12/13
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
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
    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">


    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <%--    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">--%>
    <%--    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">--%>

    <title>Title</title>
    <style>
        /* body {
             background-color: #191919
         }*/

        .m {
            margin-left: auto;
            margin-right: auto;
         /*   width: 960px;*/
            background-color: #F2F2F2;
            margin-top: 0px;
        }

        .v {

              margin-left: 220px;
            /*margin: 0 auto;*/
            width: 1100px;
        }
    </style>
    <%
        String id = request.getParameter("id");
        id = new String(id.getBytes("UTF-8"), "gb2312");
    %>

</head>
<body>
<%--头部导航
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
</script>--%>
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
                                    <li><a href="<%=basePath%>game/gamehome">Word game</a></li>
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
</br>
<div class="m">
    <video class="v" controls preload="auto" data-setup="{}">
        <source src="<%=basePath%>assets\Trahald\video\<%=id %>.mp4" type="video/mp4">
        <p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
    </video>


    <script type="text/javascript">
        var myPlayer = videojs('my-video');
        videojs("my-video").ready(function () {
            var myPlayer = this;
            myPlayer.play();
        });
    </script>
</div>
</br>
</br>
</br>

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
<script type="text/javascript" src="<%=basePath%>assets/index/js/vendor/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/index/js/main.js"></script>
<script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>