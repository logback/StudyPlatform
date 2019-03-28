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
    <title>game</title>

    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>

    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">


    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/index1.css">
    <link rel="stylesheet" href="<%=basePath%>assets/LiWei/css/liwei.css">

    <style>
        body {
            text-align: center
        }

        .big {
            margin: 0 auto;
            margin-top: 10px;
            border: 0px solid;
            width: 100%;
            height: 700px;
        }

        .word1 {
            font-family: "幼圆";
            font-size: 23px;
            float: left;
            margin-top: 25px;
        }

        .mag {
            width: 1100px;
            height: 60%;
            margin-top: 30px;
        }
        .btn{
            width: 300px;
            height: 50px;
            margin-top: 100px;
            float: left;
            margin-right: 10%;
            margin-left: 40%;
        }
    </style>
</head>

<body>

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


<div class="big" style="background-color: #F2F2F2;float: initial">
    <div class="word">
        <div class="word1"><b>请选出正确选项</b></div>
    </div>
    <div class="mag"  >
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
    <div class="btn">
        <button id="tijiao" class="layui-btn"><span class="btn-span">下一题</span></button>
    </div>
</div>
<br><br><br><br>

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

<script type="text/javascript" src="<%=basePath%>assets/index/js/vendor/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/index/js/main.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>

<script type="text/javascript">
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