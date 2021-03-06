<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2019/4/15
  Time: 9:18
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
    <title>六级听力短文选择页面</title>
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/jq22.css">
    <script src="<%=basePath%>assets/alone/js/modernizr.custom.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <style>
        html {
            -ms-overflow-style: none;
            overflow: -moz-scrollbars-none;
        }

        html::-webkit-scrollbar {
            width: 0px
        }
    </style>
</head>
<body >
<ul class="grid">
    <li class="cs-style-3">
        <figure>
            <div><img src="<%=basePath%>assets/alone/img/CET-6 comprehension.jpg" alt="img02"></div>
            <figcaption>
                <h3>CET6ListeningPassage</h3>
                <span>Jacob Cummings</span>
                <a href="javascript:void(0)" onclick="cs1()" id="but">Take a look</a>
            </figcaption>
        </figure>
    </li>
</ul>
</body>
</html>

<script>
    function cs1() {
        window.location.href = "<%=basePath%>start/test/CET6ListeningPassage";
    }

    $(function () {
        $("#but").bind("click", function () {
            parent.$(window.parent.document).find("#top").hide();
            parent.$(window.parent.document).find(".right").css({"width": "100%", "left": "0px"});
        })
    });
</script>
