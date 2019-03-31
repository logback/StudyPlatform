<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/animate-heading.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/meanmenu.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/et-line-icon.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/responsive.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/imgs.css">
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>


</head>
<body>


<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Header Area Start -->
<header class="top">
    <div class="header-area header-sticky">
        <div class="container">
            <div class="row">

                <div class="col-md-2 col-sm-2 col-xs-12">
                    <div class="logo">
                        <a href=""><img src="<%=basePath%>assets/index/img/logo/icon.png" alt="" /></a>
                    </div>
                </div>

                <div style="margin-left: 6%" class="col-md-8 col-sm-10 col-xs-12">
                    <div class="content-wrapper">
                        <!-- Main Menu Start -->
                        <div class="main-menu text-right">
                            <nav style="margin-left: 10%">
                                <ul>
                                    <li><a class="title" href="#">Home</a></li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="<%=basePath%>personal/home">Personal center</a></li>
                                    <li><a href="">Help</a></li>
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
                            <li><a style="font-weight: 600;font-size: 20px" href="">WELCOME!</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->


<!-- Background Area Start -->
<section id="slider-container" class="slider-area">
    <div class="slider-owl owl-theme owl-carousel">
      
        <!-- Start Slingle Slide -->
        <div class="single-slide item" style="background-image: url(<%=basePath%>assets/index/img/slider/slider1.jpg)">
            <!-- Start Slider Content -->
            <div class="slider-content-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slide-content-wrapper">
                                <div class="slide-content">
                                    <h2>XiaoBai in the heart </h2>
                                    <p>Time erodes all such beauty, but what it cannot diminish… is the wonderful workings of your mind. Your humor, your kindness… and your moral courage</p>
                                    <a class="banner-btn" href="#" data-text="learn more"><span>Learn more</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Start Slider Content -->
        </div>
        <!-- End Slingle Slide -->
       
        <!-- Start Slingle Slide -->
        <div class="single-slide item" style="background-image: url(<%=basePath%>assets/index/img/slider/slider2.jpg)">
            <!-- Start Slider Content -->
            <div class="slider-content-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slide-content-wrapper">
                                <div class="slide-content">
                                    <h2>XiaoBai for winner  </h2>
                                    <p>We all have moments of desperation. But if we can face them head on, that’s when we find out just how strong we really are.</p>
                                    <a class="banner-btn" href="#" data-text="learn more"><span>Learn more</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Start Slider Content -->
        </div>
        <!-- End Slingle Slide -->
        
        <!-- Start Slingle Slide -->
        <div class="single-slide item" style="background-image: url(<%=basePath%>assets/index/img/slider/slider1.jpg)">
            <!-- Start Slider Content -->
            <div class="slider-content-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slide-content-wrapper">
                                <div class="slide-content">
                                    <h2>XiaoBai in the heart </h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod </p>
                                    <a class="banner-btn" href="#" data-text="learn more"><span>Learn more</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Start Slider Content -->
        </div>
        <!-- End Slingle Slide -->
        
    </div>
</section>

<!-- Background Area End -->



<!-- Cowork Start -->
<section class="cowork-area pt-120 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="cowork-content section-title">
                    <h2>What is XiaoBai?</h2>
                    <p>First of all, our project is called "little white four and six levels of learning platform", which mainly provides help for college students to pass four and six levels.Traditional programs of this kind are not comprehensive in function, only in function of exercise and so on.The advantage of our project lies in the comprehensive functions, which can provide users with more comfortable experience.
                    </p>
                    <a class="banner-btn" href="#" data-text="about us"><span>about us</span></a>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="cowork-img">
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="#"><img src="<%=basePath%>assets/index/img/co-worker/coworker1.jpg" alt="cowork"></a>
                        </div>
                        <div class="col-sm-6">
                            <a href="#"><img src="<%=basePath%>assets/index/img/co-worker/coworker2.jpg" alt="cowork"></a>
                        </div>
                        <div class="col-sm-12">
                            <a href="#"><img src="<%=basePath%>assets/index/img/co-worker/coworker3.jpg" alt="cowork"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Cowork End -->


<!-- Serving Area Start -->
<!--our serving-->
<div class="pricing-area pt-108 pb-120 text-center">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section-title">
                    <h2>our serving</h2>
                </div>
            </div>
        </div>
        <div class="row">

            <!--查词-->
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="single-table">
                    <div class="table-head">
                        <h4>Word query</h4>
                    </div>
                    <div class="table-body">

                        <a href="<%=basePath%>start/reception/search"><img src="<%=basePath%>assets/index/img/logo/cheks.png" alt=""> </a>

                        <a class="button banner-btn" href="<%=basePath%>start/reception/search" data-text="get start"><span>get start</span></a>
                    </div>
                </div>
            </div>

            <!--练习-->
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="single-table">
                    <div class="table-head">
                        <h4>Special practice</h4>
                    </div>
                    <div class="table-body">
                        <a href="<%=basePath%>start/test/HomePage"><img src="<%=basePath%>assets/index/img/logo/exercise.png" alt=""></a>
                        <a class="button banner-btn" href="<%=basePath%>start/test/HomePage" data-text="get start"><span>get start</span></a>
                    </div>
                </div>
            </div>

            <!--游戏-->
            <div class="col-md-4 hidden-sm col-xs-12">
                <div class="single-table">
                    <div class="table-head">
                        <h4>Word game</h4>
                    </div>
                    <div class="table-body">
                        <a href="<%=basePath%>game/gamestart"><img alt="" src="<%=basePath%>assets/index/img/logo/game.png"></a>
                        <a class="button banner-btn" href="<%=basePath%>game/gamestart" data-text="get start"><span>get start</span></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- Pricing Area End -->


<!-- Event Area Start -->
<div class="event-area text-center pt-108 pb-115">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="event-content">
                    <h3>Are you ready to join our next Events?</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiust </p>
                    <a class="banner-btn" href="#" data-text="join"><span>join</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Event Area End -->



<!-- Testimonial Area Start -->
<!--our mentors-->
<div class="testimonial-area pt-110 pb-110">
    <div class="container">
        <div class="row">
            <div class="testimonial-owl owl-theme owl-carousel">
                <div class="col-sm-12">
                    <div class="single-testimonial">
                        <div class="client-info">
                            <div class="client-img">
                                <!-- 修改图片 人员头像-->
                                <img src="<%=basePath%>assets/index/img/testimonial/test1.jpg" alt="client">
                            </div>
                            <div class="client-title">
                                <h4>Aldrich  Milorina</h4>
                                <h5>HasTech</h5>
                            </div>
                        </div>
                        <div class="client-content">
                            <p>Don't be too obsessed with the present or worry about the future. When you experience something, the scenery is different from the past.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="single-testimonial">
                        <div class="client-info">
                            <div class="client-img">
                                <!-- 修改图片 人员头像 95*95-->
                                <img src="<%=basePath%>assets/index/img/testimonial/face1.jpg" alt="client">
                            </div>
                            <div class="client-title">
                                <h4>Alexander Milorina</h4>
                                <h5>HasTech</h5>
                            </div>
                        </div>
                        <div class="client-content">
                            <p>No one in this world has the obligation to be good to you, so you should think, those cold and mean is taken for granted, those gentle treatment should be more cherished. </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Testimonial Area End -->


<!-- Mentor Area Start -->
<div class="mentor-area pt-108 pb-120 text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 col-xs-12">
                <div class="mentor section-title">
                    <h2>our mentors</h2>
                    <p>A wonderful fact to reflect upon, that every human creature is constituted to be that profound secret and mystery to every other.</p>
                </div>
            </div>
        </div>
        <div class="row" style="height: 45%">

            <!--first-->
            <div class="col-md-3 col-sm-4 col-xs-12">
                <div class="single-mentor">
                    <div class="mentor-img">
                        <!-- 修改图片 演讲人员头像 269*360
                      奥巴马 安东尼·罗宾 博恩崔西
                        -->
                        <a href="#"><img src="<%=basePath%>assets/index/img/team/member1.jpg" alt="member"></a>
                        <div class="mentor-hover">
                            <h5>Jackline Milorina</h5>
                            <h6>HasTech</h6>
                        </div>
                    </div>
    </div>
</div>

            <!--second-->
            <div class="col-md-3 col-sm-4 col-xs-12">
                <div class="single-mentor">
                    <div class="mentor-img">
                        <a href="#"><img src="<%=basePath%>assets/index/img/team/member2.jpg" alt="member"></a>
                        <div class="mentor-hover">
                            <h5>Jackline Milorina</h5>
                            <h6>HasTech</h6>
                        </div>
                    </div>
                </div>
            </div>


            <!--Third-->
            <div class="col-md-3 col-sm-4 col-xs-12">
                <div class="single-mentor">
                    <div class="mentor-img">
                        <a href="#"><img src="<%=basePath%>assets/index/img/team/member3.jpg" alt="member"></a>
                        <div class="mentor-hover">
                            <h5>Jackline Milorina</h5>
                            <h6>HasTech</h6>
                        </div>
                    </div>
                </div>
            </div>


            <!--Four-->
            <div class="col-md-3 hidden-sm col-xs-12">
                <div class="single-mentor">
                    <div class="mentor-img">
                        <a href="#"><img src="<%=basePath%>assets/index/img/team/member4.jpg" alt="member"></a>
                        <div class="mentor-hover">
                            <h5>Jackline Milorina</h5>
                            <h6>HasTech</h6>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- Mentor Area End -->



<!-- Article Start -->
<div class="article-area pt-108 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="ccle section-title text-center">
                    <h2>latest videos</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="single-article">
                    <div class="article-img">
                        <!-- 修改图片 最新演讲图片370*240-->
                        <a href="<%=basePath%>start/playback?id=s1"><img style="width: 370px; height: 240px;" src="<%=basePath%>assets/index/img/article/article5.jpg" alt="article"></a>
                        <div class="article-content">
                            <div class="article-left">
                                <h3><a href="#">14<br> July</a></h3>
                            </div>
                            <div class="article-right">
                                <p><a href="#">There are only the pursued, the pursuing, the busy and the tired.</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="single-article">
                    <div class="article-img">
                        <a href="<%=basePath%>start/playback?id=s1"><img style="width: 370px; height: 240px;" src="<%=basePath%>assets/index/img/article/article2.jpg" alt="article"></a>
                        <div class="article-content">
                            <div class="article-left">
                                <h3><a href="#">14<br> July</a></h3>
                            </div>
                            <div class="article-right">
                                <p><a href="">There are only the pursued, the pursuing, the busy and the tired.</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 hidden-sm col-xs-12">
                <div class="single-article">
                    <div class="article-img">
                        <a href="<%=basePath%>start/playback?id=s1"><img style="width: 370px; height: 240px;" src="<%=basePath%>assets/index/img/article/article3.jpg" alt="article"></a>
                        <div class="article-content">
                            <div class="article-left">
                                <h3><a href="#">14<br> July</a></h3>
                            </div>
                            <div class="article-right">
                                <p><a href="#">There are only the pursued, the pursuing, the busy and the tired. </a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Article End -->


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
                            <a><img src="<%=basePath%>assets/index/img/logo/white2.jpg" alt=""></a>
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

<script src="<%=basePath%>assets/index/js/vendor/jquery-1.12.0.min.js"></script>
<script src="<%=basePath%>assets/index/js/jquery.meanmenu.js"></script>
<script src="<%=basePath%>assets/index/js/jquery.magnific-popup.min.js"></script>
<script src="<%=basePath%>assets/index/js/isotope.pkgd.min.js"></script>
<script src="<%=basePath%>assets/index/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=basePath%>assets/index/js/jquery.counterup.min.js"></script>
<script src="<%=basePath%>assets/index/js/waypoints.min.js"></script>
<script src="<%=basePath%>assets/index/js/owl.carousel.min.js"></script>
<script src="<%=basePath%>assets/index/js/main.js"></script>