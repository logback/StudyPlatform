<%--
  Created by IntelliJ IDEA.
  User: Aldrich
  Date: 2019/4/16
  Time: 15:11
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
    <title>layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>assets/backstage/css/index.css" media="all" />
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0">
            <a href="#" class="logo">小白后台管理</a>
            <!-- 显示/隐藏菜单 -->
            <a href="javascript:;" class="seraph hideMenu icon-caidan"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i></a>
            <!-- 顶级菜单 -->
            <ul class="layui-nav mobileTopLevelMenus" mobile>
                <li class="layui-nav-item" data-menu="OtherBusiness">
                    <a href="javascript:;"><i class="seraph icon-caidan"></i><cite>aldrich</cite></a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this" data-menu="memberCenter"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a></dd>
                        <dd data-menu="authorityManagement"><a href="javascript:;"><i class="seraph icon-icon10" data-icon="&#xe857;">&#xe857;</i><cite>用户中心</cite></a></dd>
                        <dd data-menu="ThesaurusManagement"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a></dd>
                        <dd data-menu="OtherBusiness"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>使用文档</cite></a></dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav topLevelMenus" pc>
                <li class="layui-nav-item layui-this" data-menu="memberCenter">
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>用户中心</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="authorityManagement" pc>
                    <a href="javascript:;"><i class="seraph icon-icon10" data-icon="icon-mokuai"></i><cite>权限管理</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="ThesaurusManagement" pc>
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>词库管理</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="OtherBusiness" pc>
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>其他业务</cite></a>
                </li>
            </ul>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" pc>
                    <a href="javascript:;" class="clearCache"><i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span class="layui-badge-dot"></span></a>
                </li>
                <li class="layui-nav-item lockcms" pc>
                    <a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>
                </li>
                <li class="layui-nav-item showNotice" id="showNotice" pc>
                    <a href="javascript:;" id="notice"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
                </li>
                <li class="layui-nav-item" id="userInfo">
                    <a href="javascript:;"><img src="<%=basePath%>assets/images/face.jpg" class="layui-nav-img userAvatar" width="35" height="35"><cite class="adminName">Aldrich</cite></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd>
                        <dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>
                        <dd><a href="javascript:;" class="showNotice"><i class="layui-icon">&#xe645;</i><cite>系统公告</cite><span class="layui-badge-dot"></span></a></dd>
                        <dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span class="layui-badge-dot"></span></a></dd>
                        <dd pc><a href="javascript:;" class="changeSkin"><i class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
                        <dd><a href="javascript:loginOut();" class="signOut"><i class="seraph icon-tuichu"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像" ><img src="<%=basePath%>assets/images/face.jpg" class="userAvatar"></a>
        <ul class="ul_sty" id="loop">
            <li  class="li_sty">你好！aldrich欢迎登录</li>
        </ul>
        </div>
        <!-- 搜索 -->
        <div class="layui-form component">
            <select name="search" id="search" lay-search lay-filter="searchPage">
                <option value="">搜索页面或功能</option>
                <option value="1">layer</option>
                <option value="2">form</option>
            </select>
            <i class="layui-icon">&#xe615;</i>
        </div>
        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="<%=basePath%>start/backstage/firstPage"><i class="layui-icon" data-icon=""></i><cite>后台首页</cite></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab mag0" style="margin: 0px" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="<%=basePath%>start/backstage/firstPage"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <div class="layui-footer footer">
        <p><span>copyright @2019 aldrich</span>　　<a onclick="donation()" class="layui-btn layui-btn-danger layui-btn-sm">捐赠作者</a></p>
    </div>
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/backstage/js/cache.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/backstage/js/index.js"></script>

<script>
    var $,tab,dataStr,layer;
    layui.config({
        base : "<%=basePath%>assets/backstage/js/"
    }).extend({
        "bodyTab" : "bodyTab"
    });
    layui.use(['bodyTab','form','element','layer','jquery'],function(){
        var form = layui.form,
            element = layui.element;
        $ = layui.$;
        layer = parent.layer === undefined ? layui.layer : top.layer;
        tab = layui.bodyTab({
            openTabNum : "50",  //最大可打开窗口数量
            url : "<%=basePath%>assets/backstage/json/navs.json" //获取菜单json地址
        });


        //页面加载时判断左侧菜单是否显示
        //通过顶部菜单获取左侧菜单
        $(".topLevelMenus li,.mobileTopLevelMenus dd").click(function(){
            if($(this).parents(".mobileTopLevelMenus").length != "0"){
                $(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            }else{
                $(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            }
            $(".layui-layout-admin").removeClass("showMenu");
            $("body").addClass("site-mobile");
            getData($(this).data("menu"));
            //渲染顶部窗口
            tab.tabMove();
        });

//通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
        getData("OtherBusiness");

        // 添加新窗口
        $("body").on("click",".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')",function(){
            //如果不存在子级
            if($(this).siblings().length == 0){
                addTab($(this));
                $('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
            }
            $(this).parent("li").siblings().removeClass("layui-nav-itemed");
        })

    });

    //打开新窗口
    function addTab(_this){
        tab.tabAdd(_this);
    }

</script>