<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18
  Time: 16:57
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
    <title>Title</title>
</head>
<body>
<a href="<%=basePath%>start/backstage/login" class="layui-btn">登录</a>
</body>
</html>
