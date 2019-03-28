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
    <link rel="stylesheet" href="<%=basePath%>assets/style/searchs.css">
    <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">


    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>


    <title>搜索页面</title>
    <style>
        body{
            background: url(<%=basePath%>assets/images/bg2.jpg);
        }
    </style>
</head>

<body>


    <!--头部导航栏-->
    <!-- Header Area Start -->
    <header class="top">
        <div class="header-area header-sticky">
            <div class="container">
                <div class="row">

                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <div class="logo">
                            <a href="index.html"><img src="<%=basePath%>assets/index/img/logo/icon.png" alt="" /></a>
                        </div>
                    </div>

                    <div style="margin-left: 6%" class="col-md-8 col-sm-10 col-xs-12">
                        <div class="content-wrapper">
                            <!-- Main Menu Start -->
                            <div class="main-menu text-right">
                                <nav style="margin-left: 10%">
                                    <ul>
                                        <li><a href="<%=basePath%>start/index">Home</a></li>
                                        <li><a href="<%=basePath%>start/reception/search">Word query</a></li>
                                        <li><a href="<%=basePath%>start/test/HomePage">Special practice</a></li>
                                        <li><a href="<%=basePath%>game/gamestart">Word game</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="mobile-menu hidden-lg hidden-md"></div>
                            <!-- Main Menu End -->
                        </div>
                    </div>

                    <div style="width: 10.66666667%" class="col-md-2 hidden-sm hidden-xs" >

                        <div class="header-social text-center">
                            <ul>
                                <li><a style="font-weight: 600;font-size: 20px;" href="">WELCOME!</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->


    <!--中间页面-->
    <div style="width: 100%;height: 600px;margin-top: 11%">
        <div>
            <h1 class="title">One-click search</h1>
        </div>
        <div style="margin-top: 4%">
            <!--按钮-->
            <button id="submit" class="submit  layui-btn" onclick="submitWord()">Go</button>

            <!--搜索框-->
            <span class="second ">
              <input type="text" name="word" id="word" class="makeInput" onfocus="setFocus(this)" oninput="setInput(this);" placeholder="请输入单词">

              <select name="wordList" id="wordOptions" onchange="changeFocus(this)" size="10" style="display:none; ">

              </select>
        </span>
        </div>
    </div>


    <!--脚部-->
    <!-- Footer Start -->
    <footer class="footer-area">
        <div class="container">
            <div class="main-footer">
                <div class="row">

                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="single-widget mr-50">
                            <h3>about us</h3>
                            <p>Ben Parker：If you could do good things for other people you had a moral obligation to do those things.That's what's at stake here.Not choice.Responsibility. </p>
                            <ul>

                                <!--微信-->
                                <li><a href="#"><i class="layui-icon layui-icon-login-wechat"></i> </a></li>

                                <!--QQ-->
                                <li><a href="#"><i class="layui-icon layui-icon-login-qq"></i></a></li>

                                <!--微博-->
                                <li><a href="#"><i class="layui-icon layui-icon-login-weibo"></i></a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="single-widget ml-100">
                            <h3>contact us</h3>
                            <p>2020 Aldrich Glen,<br>
                                Gmail : 201076171@qq.com<br>
                                Phone : +00 111 222 333	<br>
                                address : Anhui Institute of                                       Information Engineering
                            </p>
                        </div>
                    </div>


                    <div class="col-md-4 col-sm-5 col-xs-12">
                        <div class="single-widget ml-85">
                            <h3>QR code</h3>
                            <div class="footer-img">
                                <a><img src="<%=basePath%>assets/index/img/logo/white2.jpg"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom text-center">
                <div class="row">
                    <div class="col-xs-12">
                        <p><a target="_blank" href="<%=basePath%>start/backstage/login">Wisdom in the mind is better than money in the hand.</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer End -->

</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>


<script type="text/javascript" src="<%=basePath%>assets/index/js/vendor/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/index/js/main.js"></script>

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

