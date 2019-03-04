<%--
  Created by IntelliJ IDEA.
  User: 78203
  Date: 2019/1/5
  Time: 14:50
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
    <title>添加视频</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/adminStyle.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
</head>
<body>
<%--主体--%>
<div class="register">

    <%--tab--%>
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" id="test">

        <%--title--%>
        <ul class="layui-tab-title">
            <li class="layui-this">添加</li>
        </ul>

        <%--content--%>
        <div class="layui-tab-content">

            <%--添加--%>
            <div class=" layui-tab-item layui-show " lay-id="111">
                <form class="layui-form layui-form-pane" action="<%=basePath%>start/uploadVideo" method="post"
                      enctype="multipart/form-data">
                    <!--昵称-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">上传视频</label>
                        <div class="layui-input-block">
                            <input type="file" name="file"  required="required">
                        </div>
                    </div>

                    <div class="layui-form-item" >
                        <label class="layui-form-label">上传图片</label>
                        <div class="layui-input-block">
                            <input type="file" name="imgFile"  required="required">
                        </div>
                    </div>

                    <div class="layui-form-item" >
                        <label class="layui-form-label">视频标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="vtitle"  required="required">
                        </div>
                    </div>
                    <input class="layui-btn" type="submit" value="确定添加"/>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
