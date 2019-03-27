<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10
  Time: 21:42
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>MyAdmin4.0</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/home.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
</head>
<body class="main_body">

<div class="layui-layout layui-layout-admin">

    <!-- 顶部 -->
    <div class="layui-header header">

        <%--头部--%>
        <div class="layui-main">

            <%--标题--%>
            <a href="#" class="logo">小白后台管理</a>

            <!-- 搜索 -->
            <div class="layui-form component">
                <form class="layui-form" action="">
                    <select name="city" lay-verify="required" lay-search>
                        <option value="">直接选择或搜索选择</option>
                        <option value="1">layer</option>
                        <option value="20">radio</option>
                    </select>
                    <i class="layui-icon">&#xe615;</i>
                </form>
            </div>


            <!--心知天气信息 -->
            <div class="weather" pc>
                <div id="tp-weather-widget"></div>
            </div>


            <!-- 顶部右侧菜单栏-->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item showNotice" id="showNotice" pc>
                    <a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
                </li>
                <li class="layui-nav-item" mobile>
                    <a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite></a>
                </li>
                <li class="layui-nav-item" mobile>
                    <a href="javascript:;"><i class="iconfont icon-loginout"></i> 退出</a>
                </li>
                <li class="layui-nav-item lockcms" pc>
                    <a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
                </li>
                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="<%=basePath%>assets/images/face.jpg" class="layui-circle" width="35" height="35">
                        <cite id="title">请叫我意哥</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
                        <dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
                        <dd><a href="javascript:loginOut();"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>


    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">

        <!--左边头像栏-->
        <div class="user-photo">
            <a class="img" title="我的头像" ><img id="photo" src="<%=basePath%>assets/images/face.jpg"></a>
            <div class="description">
                <ul class="ul_sty" id="loop">
                    <li class="li_sty">你好!请叫我信工马云, 欢迎登录!!!!</li>
                </ul>
            </div>
        </div>

        <!--左边菜单栏-->
        <div class="navBar layui-side-scroll"></div>
    </div>



    <!-- 右侧内容 -->
    <div class="layui-body layui-form">

        <div class="layui-tab marg0" lay-filter="bodyTab">
            <ul class="layui-tab-title top_tab">
                <li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>我的首页</cite></li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="<%=basePath%>start/backstage/firstPage"></iframe>
                </div>
            </div>
        </div>

    </div>


    <!-- 注脚底部 -->
    <div class="layui-footer footer" style="background-color: rgba(0,0,0,.2);">

        <div class="footer-span">
            <span class="foot-content" >欢迎来到小白学习平台后台!</span>
        </div>

        <div class="footer-button">
            <a onclick="donation()" class="layui-btn layui-btn-danger">
                捐赠作者
            </a>
        </div>
    </div>

</div>

<!-- 锁屏 -->
<div class="admin-header-lock" id="lock-box" style="display: none;">
    <div class="admin-header-lock-img">
        <img src="<%=basePath%>assets/images/face.jpg"/></div>
    <div class="admin-header-lock-name" id="lockUserName">请叫我意哥</div>
    <div class="input_btn">
        <input type="password" class="admin-header-lock-input layui-input" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />
        <button class="layui-btn" id="unlock">解锁</button>
    </div>
    <p>请输入“123456”，否则不会解锁成功哦！！！</p>
</div>


<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

</body>
</html>

<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/nav.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/leftNavs.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/home.js"></script>

<!--初始化-->
<script type="text/javascript">

    let imaUrl=" http://localhost:8080/EnglishSystem/assets/images/2018/12/";

    function getAdmin(){

        $.ajax({
            url:'getAdmin',
            type:"get",
            dataType:"json",
            success:function (data) {
                let info;
                let title;
                let path=data['image'];
                let name=data['name'];
                let url=imaUrl+path;
                info="您好！"+name+"欢迎登录系统!!!";
                title="请叫我"+name.substring(0, 1)+"哥";
                if(name==="aldrich"){
                    info="欢迎意哥登录学习平台!!!";
                    title="请叫我意哥";
                }
                $(".layui-circle").attr("src",url);
                $('#title').text(title);
                $("#photo").attr("src",url);
                $(".li_sty").text(info);
            },
            error:function (data) {
                console.log(data);
                layer.msg("登录失败",{icon:5,time:1000});
            }
        });
    }




    $(document).ready(function () {

        getAdmin();

        let tab;
        layui.config({
            base : "<%=basePath%>assets/js/"
        }).use(['bodyTab','form','element','layer','jquery'],function(){
            tab = layui.bodyTab();
            // 添加新窗口
            $(".layui-nav .layui-nav-item a").on("click",function(){
                addTab($(this));
                $(this).parent("li").siblings().removeClass("layui-nav-itemed");
            });
        });

        //打开新窗口
        function addTab(_this){
            tab.tabAdd(_this);
        }

    });

    function loginOut()
    {
        layer.confirm('真的退出么?',
            {btn: ['确定', '取消'],
             title:"提示",skin: 'layui-layer-molv',btnAlign: 'c'},
            function(index) {
                layer.close(index);
                window.location.href="<%=basePath%>start/backstage/login";
            });
    }

</script>


