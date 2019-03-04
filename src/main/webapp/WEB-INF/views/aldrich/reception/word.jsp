<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/24
  Time: 19:28
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
<% String word = (String) request.getAttribute("word");%>
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/word.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
    <title>单词展示</title>
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
                    <a href="<%=basePath%>game/gamehome"> <i class="fa fa-check-square" aria-hidden="true"></i><cite>游戏</cite></a>
                </li>

                <%--资源--%>
                <li class="layui-nav-item lockcms" pc>
                    <a href="<%=basePath%>start/test"><i class="fa fa-play-circle-o" aria-hidden="true"></i><cite>资源</cite></a>
                </li>

                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="<%=basePath%>assets/images/face.jpg" class="layui-circle" width="35" height="35">
                        <cite>大顺发</cite>
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

<!--页面-->
<div style="width: 100%;height: 92%;position: absolute;">

    <!--搜素-->
    <div class="header">

        <!--按钮-->
        <button id="submit" class="submit layui-btn" onclick="submitWord()">Go</button>

        <!--搜索框-->
        <span class="second ">
              <input type="text" name="word" id="word" class="makeInput" onfocus="setFocus(this)" oninput="setInput(this);" placeholder="请输入单词">

              <select name="wordList" id="wordOptions" onchange="changeFocus(this)" size="10" style="display:none; ">
                 <option value="">abandon</option>

              </select>
        </span>

    </div>

    <!--展示-->
    <div class="bottom">

        <!--左侧导航-->
        <div class="nav">
            <ul>
                <li style="font-size: 25px;">目录</li>
                <li class="li_sty" onclick="test()">释义</li>
                <li class="li_sty" onclick="test()">例句</li>
            </ul>
        </div>

        <!--中间释义页面-->
        <div class="page" id="meaning">
            <h1 class="title"><%=word%></h1>
            <label class=" common">英</label>

            <label id="eSymbol" class="symbol">[ə'bændən]</label>
            <i class="fa fa-volume-off fa-lg" aria-hidden="true" onclick="ePlay()" ></i>
            <audio id="ePlayer" src="<%=basePath%>assets/sound/abandon--_gb_1.mp3"></audio>

            <label class=" common">美</label>
            <label id="aSymbol" class="symbol">[ə'bændən]</label>
            <i class="fa fa-volume-off fa-lg" aria-hidden="true" onclick="aPlay()" ></i>
            <audio id="aPlayer" src="<%=basePath%>assets/sound/abandon--_gb_1.mp3"></audio>

            <br>
            <label class=" common type" style="margin-right: 2%">lel.</label>
            <label id="level">四级</label>
            <br>
        </div>


        <!--右侧展示-->
        <div class="right" id="sentence">
            <h2>每日一句</h2>
            <div class="picture">
              <img class="img" src="<%=basePath%>assets/images/english.jpg" alt="">
            </div>
            <label class="label">Though life is hard, I want it to be boiling.</label>
            <br>
            <label style="font-size: 20px">虽然辛苦，我还是会选择那种滚烫的人生。</label>
            <br>
            <div class="picture">
                <img class="img" src="<%=basePath%>assets/images/english2.jpg" alt="">
            </div>
            <label class="label">We may talk of beautiful things, but beauty itself is abstract.</label>
            <br>
            <label style="font-size: 20px">我们尽可谈论美的事物，然而美本身却是抽象的。</label>

        </div>

    </div>
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

<%--搜索操作--%>
<script type="text/javascript">

   let words = $("h1").text();

   let TempArr = [], word,option; //存储option
   let select = $("select");
   let vocabulary = $("input");

   let level,ePath,eSound=$('#ePlayer'),aSound=$('#aPlayer'),aPath;
   let meaning;
   let type,mean,br;

   let example;
   let typeName;
   let content;
   let translate;
   let br2,br3;

    /*预加载*/
    $(document).ready(function () {
        /*动态加载所有单词*/
        getWords();

       /*依据单词名称获得单词*/
        getWord();

       /*动态加载单词的句子*/
        getSentence();

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

    /*动态加载所有单词*/
    function getWords() {
       $.ajax({
           url:"<%=basePath%>word/getWords",
           type:"post",
           data_type:'json',
           success:function (data) {
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


    /*动态加载单词的句子*/
    function getSentence() {
       $.ajax({
           url:"<%=basePath%>sentence/getSentence",
           type:"post",
           async:false,
           data:{"word":words},
           data_type:'json',
           success:function (data) {
               meaning = $('#meaning');
               example=$("<label></label>");
               example.text("例句：");
               example.addClass("common");
               meaning.append(example);

               for (let i = 0;i<data.length;i++)
               {
                   br = $("<br>");
                   br2 = $("<br>");
                   br3 = $("<br>");

                   content=$("<label></label>");
                   translate=$("<label></label>");
                   typeName=$("<label></label>");
                   typeName.text(data[i]['typeName']+".");
                   typeName.addClass("common type");
                   content.text(data[i]['content']);
                   content.addClass("common font");
                   translate.text(data[i]['translate']);
                   translate.addClass("common");

                   meaning.append(br);
                   meaning.append(typeName);
                   meaning.append(br2);
                   meaning.append(content);
                   meaning.append(br3);
                   meaning.append(translate);
               }
           },
           error:function () {
               layer.msg('发生错误',{icon:5,time: 1000});
           }
       });
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

    /*依据单词名称获得单词*/
    function getWord() {
       $.ajax({
           url:"<%=basePath%>word/getWordPojo",
           type:"post",
           async:false,
           data:{"word":words},
           data_type:'json',
           success:function (data){
               console.log(data);

               /*英式*/
               $('#eSymbol').text(data[0]['eSymbol']);
               ePath="<%=basePath%>assets/sound/"+data[0]['eSound'];
               eSound.attr("src",ePath);

               /*美式*/
               $('#aSymbol').text(data[0]['aSymbol']);
               aPath="<%=basePath%>assets/sound/"+data[0]['aSound'];
               aSound.attr("src",aPath);

               level =  $('#level');
               meaning = $('#meaning');
               level.text(data[0]['level']);
               level.css("font-weight","bold");
               for(let i=0;i<data.length;i++)
               {
                   type=$("<label></label>");
                   mean=$("<label></label>");
                   br = $("<br>");

                   type.text(data[i]['type']+".");
                   type.addClass("common");
                   type.addClass("type");
                   meaning.append(type);
                   mean.css("font-weight","bold");
                   mean.text(data[i]['meaning']);
                   meaning.append(mean);
                   meaning.append(br);
               }
           },
           error:function (){
               layer.msg('发生错误',{icon:5,time: 1000});
           }
       })
    }

    /*播放录音*/
    function ePlay()
    {
            let player = eSound[0]; /*jquery对象转换成js对象*/
            if (player.paused){ /*如果已经暂停*/
                player.play(); /*播放*/
            }else {
                player.pause();/*暂停*/
            }
    }

    function aPlay()
    {
       let player = aSound[0]; /*jquery对象转换成js对象*/
       if (player.paused){ /*如果已经暂停*/
           player.play(); /*播放*/
       }else {
           player.pause();/*暂停*/
       }
   }

    function test()
    {
       layer.alert("aldrich");
    }


   /*键盘事件*/
    document.onkeyup = function (event) {
       event = event || window.event;
       if (event.keyCode === 13) {
           submitWord();
       }
   };

</script>


<%--显示单词信息--%>
<script type="text/javascript">



</script>