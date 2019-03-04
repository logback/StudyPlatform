<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2018/12/13
  Time: 9:16
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
<html >
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/example.css">
</head>
<body id="body">

<div >

      <span class="headIntro">
			<a href="#" id="headBtn"></a>
		</span>
</div>

<div id="part3" class="part">

    <div class="container">
        <div id="item1" class="sHoverItem">
            <img id="img1" src="<%=basePath%>assets/alone/img/timg.jpg">
            <span id="intro1" class="sIntro">
                <p>第一篇</p>
				<input type="button" onclick="cs1()" value="开始练习" style="margin-top:80px;background-color: #f5f5f5">
				</span>
        </div>
    </div>
</div>
</body>
</html>
<script src="<%=basePath%>assets/alone/js/sHover.min.js"></script>
<script>
    function cs1(){
        window.location.href="<%=basePath%>start/test/ListeningPractice";
    }
    window.onload=function(){
        var downLoadBtn=document.getElementById('headBtn');
        downLoadBtn.onclick=function(){
            scrollToBottom(downLoadBtn);
        }

        var b=new sHover('head','headIntro');

        var a=new sHover("sHoverItem","sIntro");
        a.set({
            slideSpeed:5,
            opacityChange:true,
            opacity:80
        });


        var example1Btn=document.getElementById('example1Btn');
        var part1arrow=document.getElementById('part1arrow');
        var example1=document.getElementById('example1');
        example1Btn.onclick=function(){
            part1arrow.style.display='block';
            var example1=new sHover("example1","intro1");
        }

        var example2=new sHover('example2','intro2');
        example2.set({
            slideSpeed:7,
            opacity:80,
            opacityChange:true
        });
        var example2prev=new sHover('example2prev','intro2prev');
        example2prev.set({
        });

    }
    function scrollToBottom(a){
        if(windowHeight()){
            clearInterval(a.scrollTimer);
            var scrollSpeed=100;
            a.scrollTimer=setInterval(function(){
                document.documentElement.scrollTop+=scrollSpeed;
                document.body.scrollTop+=scrollSpeed;
                if((document.documentElement.scrollTop>=(document.documentElement.scrollHeight-windowHeight()))||(document.body.scrollTop>=(document.documentElement.scrollHeight-windowHeight()))){
                    clearInterval(a.scrollTimer);
                }
            },13);
        }else{

        }
    }
    function windowHeight(){
        if(document.documentElement){
            return document.documentElement.clientHeight;
        }else{
            return document.body.clientHeight;
        }
    }
</script>