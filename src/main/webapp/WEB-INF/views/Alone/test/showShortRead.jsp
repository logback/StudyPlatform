<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2019/4/24
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String imagePath="https://aldrich.oss-cn-beijing.aliyuncs.com/image/StudyPlatform/avatar/";
    Integer id=Integer.valueOf(request.getParameter("id"));
%>
<html>
<head>
    <meta charset="utf-8">
    <title>查看题目</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
    <div class="layui-form-item">
        <label class="layui-form-label">文章</label>
        <div class="layui-input-inline">
            <input id="article" type="text" name="article" lay-verify="required" placeholder="请输入文章" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">问题</label>
        <div class="layui-input-inline">
            <input id="topic" type="text" name="topic" lay-verify="required" placeholder="请输入问题" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">A选项</label>
        <div class="layui-input-inline">
            <input id="selectA" type="text" name="selectA" lay-verify="required" placeholder="请输入A选项" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">B选项</label>
        <div class="layui-input-inline">
            <input id="selectB" type="text" name="selectB" lay-verify="required" placeholder="请输入B选项" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">C选项</label>
        <div class="layui-input-inline">
            <input id="selectC" type="text" name="selectC" lay-verify="required" placeholder="请输入C选项" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">D选项</label>
        <div class="layui-input-inline">
            <input id="selectD" type="text" name="selectD" lay-verify="required" placeholder="请输入D选项" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">答案</label>
        <div class="layui-input-inline">
            <input id="answer" type="text" name="answer" lay-verify="required" placeholder="请输入答案，大写字母" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">解析</label>
        <div class="layui-input-inline">
            <input id="parsing" type="text" name="parsing" lay-verify="required" placeholder="请输入解析" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script>
    $.ajax({
        url:'<%=basePath%>start/byidshortread',
        type: 'post',
        dataType: "json",
        data:{id:<%=id%>},
        success:function (data) {
            $('#article').val(data.data[0].article);
            $('#topic').val(data.data[0].topic);
            $('#selectA').val(data.data[0].selectA);
            $('#selectB').val(data.data[0].selectB);
            $('#selectC').val(data.data[0].selectC);
            $('#selectD').val(data.data[0].selectD);
            $('#answer').val(data.data[0].answer);
            $('#parsing').val(data.data[0].parsing);
        }
    });
    layui.config({
        base: '<%=basePath%>assets' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'upload'], function(){
        var $ = layui.$
            ,form = layui.form
            ,upload = layui.upload ;

        upload.render({
            done: function(res){
                $(this.item).prev("div").children("input").val(res.data.src)
            }
        });
    })
</script>
</body>
</html>
