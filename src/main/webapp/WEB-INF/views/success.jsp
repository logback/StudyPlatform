<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/31
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录成功</title>
</head>
<body>


欢迎你,<shiro:principal/>!<br>


<shiro:hasRole name="user">
    具备user角色才能看到这句话<br>
</shiro:hasRole>


<shiro:hasRole name="teacher">
    具备teacher角色才能看到这句话<br>
</shiro:hasRole>


<shiro:hasPermission name="user:insert">
    具备user:insert权限才能看到这句话<br>
</shiro:hasPermission>


<shiro:hasPermission name="user:update">
    具备user:update权限才能看到这句话<br>
</shiro:hasPermission>
<br>


<shiro:hasPermission name="{student:update,user:*}">
    具备student:update,user:*权限才能看到这句话<br>
</shiro:hasPermission>


<a href="teacher">需要user:create权限才能访问</a><br>
<a href="logout">安全退出</a>
</body>
</html>
