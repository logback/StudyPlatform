<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2018/12/27
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <title>小白听力练习</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/ncfontcustom.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/global.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/ui.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/base.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/exercise.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/shCoreDefault.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=basePath%>assets/alone/js/dangxuan.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/alone/js/highlighter.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/alone/js/questionUtil.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <style>
        html {
            -ms-overflow-style:none;
            overflow:-moz-scrollbars-none;
        }
        html::-webkit-scrollbar{width:0px}

    </style>
</head>
<body>
<div class="nk-container with-validate" >
    <div class="nk-main clearfix" >
        <div class="module-box subject-box">
            <div class="nowcoder-topic" >
                <div class="subject-progress">
                    <div class="progress">
                        <div style="width: 100%"class="progress-bar"></div>
                    </div>
                    <span class="progress-nums" id="jindu"></span>
                    <a href="javascript:void(0);" class="progress-time" >
                        <span  data-time="0" class="time-text" style="text-align: center"></span>
                    </a>
                </div>
                <div class="subject-title">[单选题]</div>
                <div class="subject-main" >
                    <div class="subject-content" >
                        <button class="layui-btn" style="display: none" onclick="playMusic()">播放</button>
                        <audio id="player" controls="controls" autoplay="autoplay">
                            <source src="<%=basePath%>assets/alone/sound/201806cet402.mp3"/>
                        </audio>
                        </div>
                        <a href="javascript:void(0);" class="subject-options" >
                            <label class="radio" >
                                <span class="icons"></span>
                                <input type="radio" value="A" name="answer">
                                A.<pre id="selectA"></pre>
                            </label>
                        </a>
                        <a href="javascript:void(0);" class="subject-options" >
                            <label class="radio" >
                                <span class="icons"></span>
                                <input type="radio" value="B" name="answer">
                                B.<pre id="selectB"></pre>
                            </label>
                        </a>
                        <a href="javascript:void(0);" class="subject-options">
                            <label class="radio" >
                                <span class="icons"></span>
                                <input type="radio" value="C" name="answer">
                                C.<pre id="selectC"></pre>
                            </label>
                        </a>
                        <a href="javascript:void(0);" class="subject-options" >
                            <label class="radio" >
                                <span class="icons"></span>
                                <input type="radio" value="D" name="answer">
                                D.<pre id="selectD"></pre>
                            </label>
                        </a>
                    </div>
                </div>
                <!-- 展开的时候加class:open -->
                <div class="answer-sheet-box">
                    <div class="subject-question" id="acre" style="display: none">
                        正确答案：<p id="answer"></p><br>
                        解析:<p id="parsing"></p>
                        <div style="border-top: 1px dashed #ddd"></div>
                    </div>
                    <a href="javascript:void(0)" class="card-unfold">收起答题卡</a>
                    <a href="javascript:void(0)" class="card-fold">展开答题卡</a>
                    <div id="bt" class="answer-sheet-num clearfix" >

                    </div>
                </div>
                <script>
                    window.isLogin = true;
                    canLoadInIframe: 'false'
                    window.useNeteaseCaptcha = true;
                </script>
                <script type="text/javascript">
                    window.ncDeployImageRoot = "//static.nowcoder.com/";
                    window.ncJsVersion = "1.02.69";
                    window.ncJsPluginVersion = "1.0.17";
                    window.ncIsInNowcoderMainSite = true;
                </script>
                <script src="<%=basePath%>assets/alone/js/sea.js" type="text/javascript"></script>
                <script src="<%=basePath%>assets/alone/js/nc.cpn.js" type="text/javascript"></script>
                <script src="<%=basePath%>assets/alone/js/pc.js" type="text/javascript"></script>
                <script src="<%=basePath%>assets/alone/js/base.js" type="text/javascript"></script>
                <script>
                    (function() {
                        let hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?a808a1326b6c06c437de769d1b85b870";
                        let s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });
                </script>

                <script>
                    (function(window, undefined) {
                        seajs.use('nowcoder/1.2.1139/javascripts/site/question/dangxuan.js');
                    })(window);
                </script>
            </div>
            <input type="hidden" id="jsQuestionInfo" data-pid="13944725" data-tid="20340210" data-qid="15123" data-total="10" data-left="10">
        </div>
        <div class="ad-window-sm js-global-tips" style="display:none;">
            <a href="javascript:void(0);" class="ad-close">X</a>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script >
    var pageIndex = 1;
    locaDato(pageIndex);
    function locaDato(pageIndex){
        if(pageIndex!=0) {
            $(function () {
                $.ajax({
                    url: '<%=basePath%>start/listeningpractice',
                    type: 'post',
                    dataType: "json",
                    data: {pageIndex: pageIndex, pageSize: 1},
                    success: function (data) {
                        console.log(data);
                        $('#selectA').html(data.data.data1[0].selectA);
                        $('#selectB').html(data.data.data1[0].selectB);
                        $('#selectC').html(data.data.data1[0].selectC);
                        $('#selectD').html(data.data.data1[0].selectD);
                        $('#answer').html(data.data.data1[0].answer);
                        $('#parsing').html(data.data.data1[0].parsing);
                        $('#jindu').html(pageIndex + "/" + data.data.total1);
                        var str = "";
                        if (pageIndex == 1) {
                            str += "<button style='float: left' id='left' disabled='disabled' class='layui-btn layui-btn-disabled'>上一页</button>";
                        } else {
                            str += "<button style='float: left' value='" + (pageIndex - 1) + "' class='layui-btn'>上一页</button>";
                        }
                        str += "<button style='margin-left: 22%' id='tijiao' class='layui-btn'>提交</button>";
                        str += "<button style='margin-left: 22%;display: none' id='chakan' class='layui-btn'>查看答案</button>";
                        if (pageIndex == data.data.total1) {
                            str += "<button style='float: right' id='right' disabled='disabled' class='layui-btn layui-btn-disabled'>下一页</button>";
                        } else {
                            str += "<button style='float: right' id='right'  value='" + (pageIndex + 1) + "' disabled='disabled' class='layui-btn layui-btn-disabled'>下一页</button>";
                        }
                        $("#bt").html(str);
                        $("#bt button").click(function () {
                            var pi = Number($(this).val());
                            locaDato(pi);
                        });
                        $("#tijiao").click(function () {
                            var answer = $('input[name=answer][checked]').val();
                            layui.use('layer', function() {
                                var layer = layui.layer;
                                if (answer == data.data.data1[0].answer) {
                                    layer.msg('正确', {icon: 1,time:1000});
                                } else {
                                    layer.msg('错误', {icon: 2,time:1000});
                                }
                            });
                            if (pageIndex != data.data.total1) {
                                $("#right").attr("class", "layui-btn");
                                $("#right").removeAttr('disabled');
                            }
                            $("#chakan").css("display", "inline");
                        });
                        $("#chakan").click(function () {
                            $("#acre").show(1000);
                        });
                        $("#left").click(function () {
                            $("#acre").hide();
                        });
                        $("#right").click(function () {
                            $("#acre").hide();
                            $("a").removeClass('selected');
                            $("label").removeClass('checked');
                        });
                    }
                });
            });
        }
    }
    function playMusic()
    {
        let player = $("#player")[0]; /*jquery对象转换成js对象*/
        if (player.paused){ /*如果已经暂停*/
            player.play(); /*播放*/
        }else {
            player.pause();/*暂停*/
        }
    }
    window.selected = {
        "content": ""
    };
    window.isIntelligentPaper = true;
    window.canPauseTime = true;
    window.isContest = false;
    window.leaveCount = 0;
    // 问题信息
    window.questionInfo = {
        pid: '13944725',
        tid: '20340210',
        qid: '15123',
        total: '10',
        left: '10',
        type: '1'
    };
</script>