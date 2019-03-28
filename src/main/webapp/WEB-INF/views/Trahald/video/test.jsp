<%--
  Created by IntelliJ IDEA.
  User: Lingjie Kong
  Date: 2018/12/10
  Time: 16:34
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
   <%-- <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/styles.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/layui/css/layui.css">
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>
--%>


       <meta charset="utf-8">
       <meta http-equiv="x-ua-compatible" content="ie=edge">
       <meta name="description" content="">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <title>视频页面</title>

       <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
       <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
       <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
      <%-- <link rel="stylesheet" href="css/styles.css">--%>
       <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
      <%-- <script src="js/vendor/modernizr-2.8.3.min.js"></script>--%>
    <link href="<%=basePath%>assets/Trahald/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <title>视频界面</title>
</head>

<body class="background_color">

<!--头部导航栏-->
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

<div class="home_style  Channel">
    <div class="Hot_selection_style Channels">
        <!--英语教学-->
        <div class="Channels margintb">
            <div class="title_name clearfix">

                <i class="icon_title"><img src="<%=basePath%>assets/Trahald/images/icon_title_TV.png"/></i>teaching
            </div>
            <div class="clearfix mb40">
                <div class="var_list_fort">
                    <ul class="video_list list_v_content">
                        <li class="first_content bg">
                            <a href="<%=basePath%>start/playback?id=t1" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/t1.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank">托福116分UP主的背单词偏方<br>街森:CGTN英语新闻记者</a>
                                </p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="<%=basePath%>start/playback?id=t2" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/t2.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank">【浙大学姐】我是如何戒掉手机玩命学习的</a>
                                </p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a id="t4" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">更新4集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--英语演讲-->
        <div class="Channels margintb">
            <div class="title_name clearfix">
                <i class="icon_title"><img src="<%=basePath%>assets/Trahald/images/icon_title_TV.png"/></i>speech
            </div>
            <div class="clearfix mb40">
                <div class="var_list_fort">
                    <ul id="speech" class="video_list list_v_content">
                        <li class="first_content bg">
                            <a href="<%=basePath%>start/playback?id=s1" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/s1.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank">奥黛丽赫本演讲<br></a>
                                </p>
                            </div>
                        </li>
                        <c:forEach items="${vList}" var="vItem">
                            <li class="first_content bg">
                                <a href="<%=basePath%>start/playback?id=${vItem.name}" class="pic " target="_blank">
                                    <img src="<%=basePath%>assets/Trahald/images/${vItem.imgName}" width="100%"/>
                                    <span class="first_bg">
                                        <i class="icon_bf"></i>
                                    </span>
                                </a>
                                <div class="tc">
                                    <p class="tit">
                                        <a target="_blank">"${vItem.vtitle}"</a>
                                    </p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
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
                            <a><img src="<%=basePath%>assets/index/img/logo/white.PNG" alt=""></a>
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

<!-- 代码 开始 -->
<div class="go-top dn" id="go-top">

    <a href="zhuce.html" target="_blank" class="feedback"></a>
    <a href="javascript:;" class="go"></a>
</div>
</body>
</html>

<!--
<script type="text/javascript">
    /**  $(function () {
            $.ajax({
                url:'<%=basePath%>start/selectVideo',
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    for(var i=0;i<data.size;i++){
                        alert(data.data[i].name);
                        var $li = $("<li class='first_content bg'></li>");
                        var $a=$("<a href='<%=basePath%>start/playback?id="+data.data[i].name+"'></a>");
                        var $img=("<img src='<%=basePath%>assets/Trahald/images/s1.jpg' width='100%'");
                        var $span=$("<span class='first_bg'></span>");
                        var $i=$("<i class='icon_bf'></i>");
                        $span.append($i);
                        $a.append($img);
                        $a.append($span);
                        $li.append($a);
                        $("#speech").append($li);

                    }
                  //  $('#memberName').html(data.name.name);
                }
            });
        });**/
</script>
-->