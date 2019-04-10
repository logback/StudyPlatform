<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2019/4/3
  Time: 8:30
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
    <title>AllQuestions</title>
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/jq22.css">
    <script src="<%=basePath%>assets/alone/js/modernizr.custom.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <style>
        html {
            -ms-overflow-style: none;
            overflow: -moz-scrollbars-none;
        }

        html::-webkit-scrollbar {
            width: 0px;
        }

    </style>
    <script>
        function cs1() {
            window.location.href = "<%=basePath%>start/test/ListeningDialogue";
        }

        function cs2() {
            window.location.href = "<%=basePath%>start/test/ShortReading";
        }

        function cs3() {
            window.location.href = "<%=basePath%>start/test/Cloze";
        }

        function cs4() {
            window.location.href = "<%=basePath%>start/test/ListeningPassage";
        }

        function cs5() {
            window.location.href = "<%=basePath%>start/test/LongtoRead";
        }

        $(function () {
            $("#but1").bind("click", function () {
                parent.$(window.parent.document).find("#top").hide();
                parent.$(window.parent.document).find(".right").css({"width": "100%", "left": "0px"});
            })
            $("#but2").bind("click", function () {
                parent.$(window.parent.document).find("#top").hide();
                parent.$(window.parent.document).find(".right").css({"width": "100%", "left": "0px"});
            })
            $("#but4").bind("click", function () {
                parent.$(window.parent.document).find("#top").hide();
                parent.$(window.parent.document).find(".right").css({"width": "100%", "left": "0px"});
            })
            $("#but5").bind("click", function () {
                parent.$(window.parent.document).find("#top").hide();
                parent.$(window.parent.document).find(".right").css({"width": "100%", "left": "0px"});
            })
        });
    </script>
</head>
<body >
        <ul class="grid">
            <li class="cs-style-3">
                <figure>
                    <div><img src="<%=basePath%>assets/alone/img/duan.jpg" alt="img02"></div>
                    <figcaption>
                        <h3>Dialogue</h3>
                        <span>Jacob Cummings</span>
                        <a href="javascript:void(0)" onclick="cs1()" id="but1">Take a look</a>
                    </figcaption>
                </figure>
            </li>
            <li class="cs-style-3">
                <figure>
                    <div><img src="<%=basePath%>assets/alone/img/duanwen.jpg" alt="img02"></div>
                    <figcaption>
                        <h3>ListeningPassage</h3>
                        <span>Jacob Cummings</span>
                        <a href="javascript:void(0)" onclick="cs4()" id="but4">Take a look</a>
                    </figcaption>
                </figure>
            </li>
            <li class="cs-style-3">
                <figure>
                    <div><img src="<%=basePath%>assets/alone/img/duanyuedu.jpg" alt="img02"></div>
                    <figcaption>
                        <h3>ShortReading</h3>
                        <span>Jacob Cummings</span>
                        <a href="javascript:void(0)" onclick="cs2()" id="but2">Take a look</a>
                    </figcaption>
                </figure>
            </li>
            <li class="cs-style-3">
                <figure>
                    <div><img src="<%=basePath%>assets/alone/img/longread.jpg" alt="img02"></div>
                    <figcaption>
                        <h3>LongtoRead</h3>
                        <span>Jacob Cummings</span>
                        <a href="javascript:void(0)" onclick="cs5()" id="but5">Take a look</a>
                    </figcaption>
                </figure>
            </li>
            <li class="cs-style-3">
                <figure>
                    <div><img src="<%=basePath%>assets/alone/img/cloze.jpg" alt="img02"></div>
                    <figcaption>
                        <h3>Cloze</h3>
                        <span>Jacob Cummings</span>
                        <a href="javascript:void(0)" onclick="cs3()" id="but3">Take a look</a>
                    </figcaption>
                </figure>
            </li>
        </ul>
        <%--<div class="sHoverItem">
            <a href="javascript:void(0)" onclick="cs1()" id="but1">
                <img src="<%=basePath%>assets/alone/img/duan.jpg">
            </a>
        </div>
        <div class="sHoverItem">
            <a href="javascript:void(0)" onclick="cs4()" id="but4">
                <img src="<%=basePath%>assets/alone/img/duanwen.jpg">
            </a>
        </div>
        <div class="sHoverItem">
            <a href="javascript:void(0)" onclick="cs2()" id="but2">
                <img src="<%=basePath%>assets/alone/img/duanyuedu.jpg">
            </a>
        </div>
        <div class="sHoverItem">
            <a href="javascript:void(0)" onclick="cs5()" id="but5">
                <img src="<%=basePath%>assets/alone/img/longread.jpg">
            </a>
        </div>
        <div class="sHoverItem">
            <a href="javascript:void(0)" onclick="cs3()" id="but3">
                <img src="<%=basePath%>assets/alone/img/cloze.jpg">
            </a>
        </div>--%>
</body>
</html>
