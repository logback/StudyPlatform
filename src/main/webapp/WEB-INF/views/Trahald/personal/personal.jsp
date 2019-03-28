<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2018/12/31
  Time: 0:07
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

    <title> 个人中心</title>

    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <!-- CSS公共部分 开始 -->
    <link href="<%=basePath%>assets/Trahald/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>assets/Trahald/css/style.css" rel="stylesheet">
    <!-- CSS公共部分 结束 -->

    <link href="<%=basePath%>assets/Trahald/css/crowdfunding.css" rel="stylesheet">

    <!--头部-->
    <!--start-->
    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>

    <!--end-->

    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
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
                            <a href="index.html"><img src="<%=basePath%>assets/index/img/logo/icon.png" alt="" /></a>
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

                    <div style="width: 10.66666667%" class="col-md-2 hidden-sm hidden-xs" >

                        <div class="header-social text-center">
                            <ul>
                                <li><a style="font-weight: 600;font-size: 20px;margin-top: 4px;" href="">WELCOME!</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->


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



    <!--脚部-->
    <!-- Footer Start -->
    <footer class="footer-area">
        <div class="container">
            <div class="main-footer">
                <div class="row">

                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="single-widget mr-50">
                            <h3>about us</h3>
                            <p>Ben Parker：If you could do good things for other people you had a moral obligation to do those things.That's what's at stake here.Not choice.Responsibility. </p>
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
                                Phone : +00 111 222 333	<br>
                                address : Anhui Institute of                                       Information Engineering
                            </p>
                        </div>
                    </div>


                    <div class="col-md-4 col-sm-5 col-xs-12">
                        <div class="single-widget ml-85">
                            <h3>QR code</h3>
                            <div class="footer-img">
                                <a><img src="<%=basePath%>assets/index/img/logo/white2.jpg"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom text-center">
                <div class="row">
                    <div class="col-xs-12">
                        <p><a target="_blank" href="<%=basePath%>start/backstage/login">Wisdom in the mind is better than money in the hand.</a></p>
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

<script src="<%=basePath%>assets/Trahald/js/bootstrap.min.js"></script>
<script src="<%=basePath%>assets/Trahald/js/basics.js"></script>
<!-- JS公共部分 结束 -->
<script src="<%=basePath%>assets/Trahald/js/crowdfunding.js"></script>
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
