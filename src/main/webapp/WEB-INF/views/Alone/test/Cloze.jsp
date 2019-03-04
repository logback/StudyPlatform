<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2018/12/29
  Time: 15:08
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
    <link rel="stylesheet" href="<%=basePath%>assets/alone/css/button.css">
    <link rel="stylesheet" href="<%=basePath%>assets/font/css/font-awesome.min.css">
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
                    <div class="subject-question">
                        <p id="article"></p>
                        答案选项：<p id="select"></p>
                    </div>
                    <p>请用大写字母作答</p>
                    <div style="margin-top: 10px">
                        <span class="icons"></span>
                        1.<input type="text" value="" name="answer" id="select1">
                        <span class="icons"></span>
                        2.<input type="text" value="" name="answer" id="select2">
                        <span class="icons"></span>
                        3.<input type="text" value="" name="answer" id="select3">
                    </div>
                    <div style="margin-top: 10px">
                        <span class="icons"></span>
                        4.<input type="text" value="" name="answer" id="select4">
                        <span class="icons"></span>
                        5.<input type="text" value="" name="answer" id="select5">
                        <span class="icons"></span>
                        6.<input type="text" value="" name="answer" id="select6">
                    </div>
                    <div style="margin-top: 10px">
                        <span class="icons"></span>
                        7.<input type="text" value="" name="answer" id="select7">
                        <span class="icons"></span>
                        8.<input type="text" value="" name="answer" id="select8">
                        <span class="icons"></span>
                        9.<input type="text" value="" name="answer" id="select9">
                    </div>
                    <div style="margin-top: 10px">
                        <span class="icons"></span>
                        10.<input type="text" value="" name="answer" id="select10">
                    </div>
                </div>
            </div>
            <!-- 展开的时候加class:open -->
            <div class="answer-sheet-box">
                <div class="subject-question" id="acre" style="display: none">
                    解析:<p id="translate"></p>
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
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script>
    var pageIndex = 1;
    locaDato(pageIndex);
    function locaDato(pageIndex){
        if(pageIndex!=0) {
            $(function () {
                $.ajax({
                    url: '<%=basePath%>start/cloze',
                    type: 'post',
                    dataType: "json",
                    data: {pageIndex: pageIndex, pageSize: 1},
                    success: function (data) {
                        console.log(data);
                        $("#article").html(data.data.data2[0].article);
                        $("#select").html(data.data.data2[0].select);
                        $("#translate").html(data.data.data2[0].translate);
                        $('#jindu').html(pageIndex + "/" + data.data.total2);
                        var str = "";
                        if (pageIndex == 1) {
                            str += "<button style='float: left' id='left' disabled='disabled' class='layui-btn layui-btn-disabled'>上一页</button>";
                        } else {
                            str += "<button style='float: left' value='" + (pageIndex - 1) + "' class='layui-btn'>上一页</button>";
                        }
                        str += "<button style='margin-left: 22%' id='tijiao' class='layui-btn'>提交</button>";
                        str += "<button style='margin-left: 22%;display: none' id='chakan' class='layui-btn'>查看答案</button>";
                        if (pageIndex == data.data.total2) {
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
                            var key=0;
                            var select1=$("#select1").val();
                            var select2=$("#select2").val();
                            var select3=$("#select3").val();
                            var select4=$("#select4").val();
                            var select5=$("#select5").val();
                            var select6=$("#select6").val();
                            var select7=$("#select7").val();
                            var select8=$("#select8").val();
                            var select9=$("#select9").val();
                            var select10=$("#select10").val();
                            if(select1==data.data.data2[0].select1){
                                key++;
                            }
                            if(select2==data.data.data2[0].select2){
                                key++;
                            }
                            if(select3==data.data.data2[0].select3){
                                key++;
                            }
                            if(select4==data.data.data2[0].select4){
                                key++;
                            }
                            if(select5==data.data.data2[0].select5){
                                key++;
                            }
                            if(select6==data.data.data2[0].select6){
                                key++;
                            }
                            if(select7==data.data.data2[0].select7){
                                key++;
                            }
                            if(select8==data.data.data2[0].select8){
                                key++;
                            }
                            if(select9==data.data.data2[0].select9){
                                key++;
                            }
                            if(select10==data.data.data2[0].select10){
                                key++;
                            }
                            layui.use('layer', function() {
                                var layer = layui.layer;
                                if (key == 0) {
                                    layer.msg('正确率为：0', {icon: 2,time:1000});
                                } else {
                                    layer.msg('正确率为：' + key + '/' + 10, {icon: 1,time:1000});
                                }
                            });
                            if (pageIndex != data.data.total2) {
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

