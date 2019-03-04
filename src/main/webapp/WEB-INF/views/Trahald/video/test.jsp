<%--
  Created by IntelliJ IDEA.
  User: Lingjie Kong
  Date: 2018/12/10
  Time: 16:34
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
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=basePath%>assets/Trahald/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>assets/Trahald/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <title>视频界面</title>
</head>

<body class="background_color">
<div class="home_style  Channel">
    <div class="Hot_selection_style Channels">
        <!--英语教学-->
        <div class="Channels margintb">
            <div class="title_name clearfix">

                <i class="icon_title"><img src="<%=basePath%>assets/Trahald/images/icon_title_TV.png"/></i>teaching
            </div>
            <div class="clearfix mb40">
                <div class="var_list_fort">
                    <ul class="video_list list_v_content">
                        <li class="first_content bg">
                            <a href="<%=basePath%>start/playback?id=t1" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/t1.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank">托福116分UP主的背单词偏方<br>街森:CGTN英语新闻记者</a>
                                </p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="<%=basePath%>start/playback?id=t2" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/t2.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank">【浙大学姐】我是如何戒掉手机玩命学习的</a>
                                </p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a id="t4" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">43集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                        <li class="first_content bg">
                            <a href="#" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/4.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <a target="_blank" href="#" class="bq">更新4集</a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank" href="#">轿车公路上行驶被闪电劈中</a>
                                </p>
                                <p class="des">巨响过后冒出浓烟</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--英语演讲-->
        <div class="Channels margintb">
            <div class="title_name clearfix">
                <i class="icon_title"><img src="<%=basePath%>assets/Trahald/images/icon_title_TV.png"/></i>speech
            </div>
            <div class="clearfix mb40">
                <div class="var_list_fort">
                    <ul id="speech" class="video_list list_v_content">
                        <li class="first_content bg">
                            <a href="<%=basePath%>start/playback?id=s1" class="pic " target="_blank">
                                <img src="<%=basePath%>assets/Trahald/images/s1.jpg" width="100%"/>
                                <span class="first_bg"><i class="icon_bf"></i></span>
                            </a>
                            <div class="tc">
                                <p class="tit">
                                    <a target="_blank">奥黛丽赫本演讲<br></a>
                                </p>
                            </div>
                        </li>
                        <c:forEach items="${vList}" var="vItem">
                            <li class="first_content bg">
                                <a href="<%=basePath%>start/playback?id=${vItem.name}" class="pic " target="_blank">
                                    <img src="<%=basePath%>assets/Trahald/images/${vItem.imgName}" width="100%"/>
                                    <span class="first_bg">
                                        <i class="icon_bf"></i>
                                    </span>
                                </a>
                                <div class="tc">
                                    <p class="tit">
                                        <a target="_blank">"${vItem.vtitle}"</a>
                                    </p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 代码 开始 -->
<div class="go-top dn" id="go-top">

    <a href="zhuce.html" target="_blank" class="feedback"></a>
    <a href="javascript:;" class="go"></a>
</div>
</body>
</html>

<!--
<script type="text/javascript">
    /**  $(function () {
            $.ajax({
                url:'<%=basePath%>start/selectVideo',
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    for(var i=0;i<data.size;i++){
                        alert(data.data[i].name);
                        var $li = $("<li class='first_content bg'></li>");
                        var $a=$("<a href='<%=basePath%>start/playback?id="+data.data[i].name+"'></a>");
                        var $img=("<img src='<%=basePath%>assets/Trahald/images/s1.jpg' width='100%'");
                        var $span=$("<span class='first_bg'></span>");
                        var $i=$("<i class='icon_bf'></i>");
                        $span.append($i);
                        $a.append($img);
                        $a.append($span);
                        $li.append($a);
                        $("#speech").append($li);

                    }
                  //  $('#memberName').html(data.name.name);
                }
            });
        });**/
</script>
-->