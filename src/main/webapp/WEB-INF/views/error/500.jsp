<%--
  Created by IntelliJ IDEA.
  User: Aldrich
  Date: 2019/4/9
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>500页面</title>
</head>
<body>

<img style="height: 100%;width: 100%" src="<%=basePath%>assets/images/500.png" alt="500">

</body>
</html>
