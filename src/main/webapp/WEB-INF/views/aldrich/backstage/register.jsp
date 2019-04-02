<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18
  Time: 17:11
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
    <title>注册界面</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
</head>
<body>
  <div style="width: 80%;height: 100%;position: absolute;overflow: hidden;margin-left: 10%">
        <form class="layui-form layui-form-pane" action="">

        <!--账号-->
        <div class="layui-form-item" >
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input type="text" name="account" lay-verify="required|phone"
                       placeholder="请输入您的账号即手机号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <!--昵称-->
        <div class="layui-form-item" >
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input type="text"  name="name" lay-verify="required|name"
                       placeholder="请输入您的昵称" autocomplete="off" class="layui-input">
            </div>
        </div>

        <!--密码-->
        <div class="layui-form-item " >
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password"  name="pwd" lay-verify="required|pwd"
                       placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <!--时间-->
        <div class="layui-form-item " >
            <label class="layui-form-label">时间</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="time" id="time" lay-verify="required"   autocomplete="off" placeholder=" 输入时间 ">
            </div>
        </div>

        <!--邮箱-->
        <div class="layui-form-item" >
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text"   name="email" lay-verify="required|email"
                       placeholder="请输入您的邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>

        <!--role-->
        <div class="layui-form-item" pane>
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
                <input type="radio"   name="role" value="1001" title="超级管理员">
                <input type="radio"   name="role" value="1002" title="系统管理员">
                <input type="radio"   name="role" value="1003" title="小白管理员" checked>
            </div>
        </div>

        <!--未授权-->
        <div class="layui-form-item layui-form" pane="" >
            <label class="layui-form-label">未授权</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" name="state" lay-skin="switch" lay-filter="switchTest" title="开关" disabled>
            </div>
        </div>

        <!--头像-->
        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="upload1">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <input  id="img_url" name="img" value=""/>
                <div class="layui-upload-list" style="width: 100px;height:100px">
                    <img  class="layui-upload-img" width="100px" height="80px" id="demo1"/>
                    <p id="demoText"></p>
                </div>
            </div>
        </div>

        <!--提交-->
        <div class="layui-form-item" style="margin-left: 27%">
            <div class="layui-input-block" >
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

        </form>
  </div>
</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/append.js"></script>
