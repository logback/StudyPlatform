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

    <link rel="apple-touch-icon" href="<%=basePath%>assets/index/apple-touch-icon.png">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/index/css/style.css">
    <script src="<%=basePath%>assets/index/js/vendor/modernizr-2.8.3.min.js"></script>

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
                                            <li><a class="title" href="<%=basePath%>start/index">Home</a></li>
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


        <!--页面-->
        <div style="width: 100%;height:1250px; background-color:#f2f2f2">

            <!--搜素-->
            <div class="header">

                <!--按钮-->
                <button id="submit" class="submit layui-btn" style="margin-top: 2.2%" onclick="submitWord()">Go</button>

                <!--搜索框-->
                <span class="second ">
                      <input type="text" name="word" id="word"  style="margin-top: 2.2%" class="makeInput" onfocus="setFocus(this)" oninput="setInput(this);" placeholder="请输入单词">

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
                    <h2 style="margin-left: 26%;">每日一句</h2>
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