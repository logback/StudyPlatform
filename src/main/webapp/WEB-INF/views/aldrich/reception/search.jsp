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
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/search.css">
    <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
    <title>搜索页面</title>
    <style>
        body{
            background: url(<%=basePath%>assets/images/bg2.jpg);
        }
    </style>
</head>

<body>
<!--头部导航-->
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header" >
        <div class="layui-main">
            <a href="#" class="logo" style="line-height: 64px;" >小白学习平台</a>
            <!-- 天气信息 -->
            <div class="weather" pc>
                <div id="tp-weather-widget"></div>
                <script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
                <script>tpwidget("init", {
                    "flavor": "slim",
                    "location": "WX4FBXXFKE4F",
                    "geolocation": "disabled",
                    "language": "zh-chs",
                    "unit": "c",
                    "theme": "chameleon",
                    "container": "tp-weather-widget",
                    "bubble": "disabled",
                    "alarmType": "badge",
                    "color": "#FFFFFF",
                    "uid": "U9EC08A15F",
                    "hash": "14dff75e7253d3a8b9727522759f3455"
                });
                tpwidget("show");</script>
            </div>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu" >

                <%--主页--%>
                <li class="layui-nav-item showNotice" id="showNotice" pc>
                    <a href="<%=basePath%>index.jsp"><i class="fa fa-telegram" aria-hidden="true"></i><cite>主页</cite></a>
                </li>

                <%--查询--%>
                <li class="layui-nav-item" >
                    <a href="<%=basePath%>start/reception/search" data-url="page/user/changePwd.html"><i class="fa fa-search" aria-hidden="true"></i><cite>查词</cite></a>
                </li>

                <%--练习--%>
                <li class="layui-nav-item" >
                    <a href="<%=basePath%>start/test/HomePage"><i class="fa fa-check-square" aria-hidden="true"></i> <cite>练习</cite></a>
                </li>

                <%--游戏--%>
                <li class="layui-nav-item" >
                        <a href="<%=basePath%>game/gamehome"><i class="fa fa-check-square" aria-hidden="true"></i><cite>游戏</cite></a>
                </li>

                <%--资源--%>
                <li class="layui-nav-item lockcms" pc>
                    <a href="<%=basePath%>start/test"><i class="fa fa-play-circle-o" aria-hidden="true"></i><cite>资源</cite></a>
                </li>

                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="<%=basePath%>assets/images/face.jpg" class="layui-circle" width="35" height="35">
                        <cite id="memberName"></cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人主页</cite></a></dd>
                        <dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
                        <dd><a href="javascript:;"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(function(){
        $.ajax({
            url:'<%=basePath%>personal/selectName',
            dataType: "json",
            success:function (data) {
                console.log(data);
                $('#memberName').html(data.name.name);
            }
        });
    });
</script>


    <div class="title_search" >
        <h1>小白查词</h1>
    </div>

    <div class="container">
        <!--按钮-->
        <button id="submit" class="submit  layui-btn" onclick="submitWord()">Go</button>

        <!--搜索框-->
        <span class="second ">
              <input type="text" name="word" id="word" class="makeInput" onfocus="setFocus(this)" oninput="setInput(this);" placeholder="请输入单词">

              <select name="wordList" id="wordOptions" onchange="changeFocus(this)" size="10" style="display:none; ">

              </select>
        </span>
    </div>


</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<%--头部导航--%>
<script  type="text/javascript">
    layui.use('element', function(){
        let element = layui.element;
    });
</script>

<script  type="text/javascript">
    let TempArr = [], word,option; //存储option
    let select = $("select");
    let vocabulary = $("input");

    $(document).ready(function () {
        /*加载所有单词*/
        getWords();

        $(document).bind('click',
            function(e) {
                var e = e || window.event; //浏览器兼容性
                let elem = e.target || e.srcElement;
                while (elem) { //循环判断至跟节点，防止点击的是div子元素
                    if (elem.id && (elem.id === 'wordOptions' || elem.id === "word")) {
                        return;
                    }
                    elem = elem.parentNode;
                }
                $('#wordOptions').css('display', 'none'); //点击的不是div或其子元素
            });
    });

    /*  静态
    $(function() {
        /!*先将数据存入数组*!/
        $("#wordOptions option").each(function(index, el) {
            TempArr[index] = $(this).text();
        });
        $(document).bind('click',
            function(e) {
                var e = e || window.event; //浏览器兼容性
                let elem = e.target || e.srcElement;
                while (elem) { //循环判断至跟节点，防止点击的是div子元素
                    if (elem.id && (elem.id === 'wordOptions' || elem.id === "word")) {
                        return;
                    }
                    elem = elem.parentNode;
                }
                $('#wordOptions').css('display', 'none'); //点击的不是div或其子元素
            });
    });
*/


    function changeFocus(this_) {
        $(this_).prev("input").val($(this_).find("option:selected").text());
        $("#wordOptions").css({
            "display": "none"
        });
        window.location.href='<%=basePath%>word/getWord?word='+$(this_).find("option:selected").text();
    }

    function setFocus(this_) {
        $("#wordOptions").css({
            "display": ""
        });
        let select = $("#wordOptions");
        select.empty();
        for (let i = 0; i < TempArr.length; i++) {
            let option = $("<option></option>").text(TempArr[i]);
            select.append(option);
        }

    }

    function setInput(this_) {

        let select = $("#wordOptions");
        select.html("");
        for (let i = 0; i < TempArr.length; i++) {
            //若找到以txt的内容开头的，添option
            option=TempArr[i].substring(0, this_.value.length).indexOf(this_.value);

            /*过滤大小写*/
            word = TempArr[i].toUpperCase().substring(0, this_.value.length).indexOf(this_.value.toUpperCase());


            if (option=== 0||word>-1) {
                let option = $("<option></option>").text(TempArr[i]);
                select.append(option);
            }
        }
    }

    /*动态加载*/
    function getWords() {
       $.ajax({
            url:"<%=basePath%>word/getWords",
            type:"post",
            data_type:'json',
            success:function (data) {
                console.log(data);
                for(let i=0;i<data.length;i++)
                {
                    TempArr[i]=data[i]['name'];
                    let option=$("<option></option>");
                    option.val(data[i]['name']);
                    option.text(data[i]['name']);
                    select.append(option);
                }
            },
            error:function () {
              layer.msg('发生错误',{icon:5,time: 1000});
            }
       })
    }



    /*提交单词*/
    function submitWord()
    {
        if(vocabulary.val()===""||vocabulary.val()===null)
        {
            layer.msg('请输入单词',{icon:5,time: 3000});
        }else {
            window.location.href='<%=basePath%>word/getWord?word='+$("input").val();
        }
    }


    document.onkeyup = function (event) {
        event = event || window.event;
        if (event.keyCode === 13) {
            submitWord();
        }
    }



    /*键盘事件 回车是13，空格是32，上键是38，下键是40；*/
   /* document.onkeyup = function (event) {
        event = event || window.event;
        console.log(event.keyCode);
        /!*下键*!/
        if (40 === event.keyCode) {
            index++;
            if (index > wordList.length - 1) {
                index = 0
            }
            for (let i = 0; i < wordList.length; i++) {
                wordList[i].style.backgroundColor = null;
            }
            wordList[index].style.backgroundColor = "#ccc";
        }

        /!*上键*!/
        if (event.keyCode === 38) {
            index--;
            if (index < 0) {
                index = wordList.length - 1;
            }
            for (let i = 0; i < wordList.length; i++) {
                wordList[i].style.backgroundColor = null;
            }
            wordList[index].style.backgroundColor = "#ccc";
        }

        /!*回车*!/
        if (event.keyCode === 13) {
            for (let i = 0; i < wordList.length; i++) {
                wordList[i].style.backgroundColor = null;
            }

            input.innerHTML = $(this).find("option:hover").text();


            $("#wordOptions").css({
                "display": "none"
            });
        }


    }*/

</script>

