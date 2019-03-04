<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2019/1/5
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

    String imagePath = basePath + "assets/images/2018/12/";
%>
<html>
<head>
    <title>视频管理</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/adminStyle.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">

</head>
<body style="overflow-x: hidden">
<div class="demoTable" style="width: 1100px">
    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input class="layui-input" id="name" type="text" placeholder="视频名称">
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-inline">
                <input class="layui-input" id="title" type="text" placeholder="视频标题">
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-inline">
                <input class="layui-input" type="text" id="time" lay-verify="required" autocomplete="off"
                       placeholder="加入时间 ">
            </div>
            &nbsp; &nbsp;
            <button class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>
        </div>
    </blockquote>
</div>
<%--数据表格头部和主体--%>
<div class="content">
    <div class="center">
        <!--数据表格-->
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>

<!--加载头部工具栏-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" lay-event="delete"><i class="layui-icon">&#xe640;</i>批量删除</button>
        <button class="layui-btn layui-btn" lay-event="add"><i class="layui-icon">&#xe654;</i>添加</button>
        <button class="layui-btn layui-btn" lay-event="flush"><i class="layui-icon">&#x1002;</i>刷新</button>
    </div>
</script>

<!--加载表格操作栏-->
<script type="text/html" id="barDemo">
    <a href="<%=basePath%>start/aaa" class="layui-btn layui-btn-normal layui-btn-xs" lay-event="check"><i class="layui-icon">&#xe638;</i>查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="update"><i class="iconfont icon-edit"></i>修改</a>
</script>


<!--创建表格 -->
<script type="text/javascript">

    layui.use(['table', 'laydate', 'form'], function () {

        let table = layui.table,
            form = layui.form,
            laydate = layui.laydate;

        <!--表格加载-->
        table.render({
            elem: '#test'
            , url: '<%=basePath%>start/allVideo'
            , toolbar: '#toolbarDemo'
            , method: 'POST'
            , title: '视频信息表'
            , width: 1100
            , algin: 'center'
            , cols: [[
                {type: 'numbers', fixed: 'left', title: '#'}
                , {type: 'checkbox', fixed: 'left'}
                , {field: 'url', title: '视频地址', width: 150}
                , {field: 'name', title: '视频名称', width: 120}
                , {field: 'vtitle', title: '视频标题', width: 120}
                , {field: 'imgUrl', title: '封面地址', width: 150}
                , {field: 'imgName', title: '图片名称', width: 120}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 220}
            ]]
        });


        <!--头工具栏事件-->
        table.on('toolbar(test)', function (obj) {
            let checkStatus = table.checkStatus(obj.config.id);
            let data = checkStatus.data;
            switch (obj.event) {
                case 'add':
                    window.location.href = "<%=basePath%>start/addVideo";
                case 'flush':
                    table.reload('test', {
                        type: "POST",
                        url: '<%=basePath%>start/addVideo'
                    });
                    break;
            }
        });

    });
</script>