<%--
  Created by IntelliJ IDEA.
  User: Lingjie Kong
  Date: 2018/12/31
  Time: 1:23
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
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="author" content="order by dede58.com"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="revised" content="Ningxia Seasons, 2015/8/13/" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <!-- 搜索关键字 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>某经融公司股权众筹站点</title>

    <!-- Bootstrap -->
    <link href="<%=basePath%>assets/Trahald/css/crowdfunding.center/my_info.css" rel="stylesheet">
</head>
<body>
<!-- 开始 -->
<div class="my_info_title">修改密码<span>
  <button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p>
  </span></div>
<div class="my_info_title_3">
    <ul>
        <li id="listClick_1" onClick="listClick(1)">基本资料</li>
        <!--<li id="listClick_3" onClick="listClick(3)">身份认证</li>-->
        <li id="listClick_4" onClick="listClick(4)" style="border-bottom: 1px solid #C40521; color: #C40521;">修改密码</li>
    </ul>
</div>
<div class="my_info_content">
    <div class="my_info_content_care">友好提示：您的个人信息只做为投融资和有限合伙企业设立时使用，感谢您对某经融公司众筹平台的信任和支持！</div>
    <table class="my_info_content_care_table">
        <tbody>
        <tr>
            <td width="300" align="right" class="color555">旧密码：</td>
            <td type="text" class="color555">
                <input  id=password class="my_info_content_care_table_text" name="" >
                <span class="colorCA1E37 margin_left10 font_size12">请输入旧密码</span>
            </td>
        </tr>
        <tr>
            <td align="right" class="color555">新密码：</td>
            <td class="color555">
                <input type="text" id="newPassword" class="my_info_content_care_table_text" name="" >
                <span class="colorCA1E37 margin_left10 font_size12">请输入新密码</span>
            </td>
        </tr>
        <tr>
            <td align="right" class="color555">确认新密码：</td>
            <td class="color555"><input type="text" id=newPassword2 class="my_info_content_care_table_text" name="" >
                <span class="colorCA1E37 margin_left10 font_size12">请再次输入</span>
            </td>
        </tr>
        <!--
        <tr>
            <td align="right" class="color555">验证码：</td>
            <td class="color555"><input class="my_info_content_care_table_text" name="" type="text">
                <span class="color959595 margin_left10 font_size12">请输入验证码</span></td>
        </tr>
        -->
        <tr>
            <td align="center" class="color555" colspan="2">
                <input class="my_info_content_care_table_submit" name="" type="submit" value="申请认证" onclick="fun()">
            </td>
        </tr>
        </tbody>
    </table>
</div>

<!-- 结束 -->
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script src="<%=basePath%>assets/Trahald/js/my_info.js"></script>
</body>
</html>
<script type="text/javascript" language="javascript">

    function fun() {
        var password = $('#password').val();
        var newPassword = $('#newPassword').val();
        $.ajax({
            data:{password:password,newPassword:newPassword},
            type: 'POST',
            dataType: "json",
            url: '<%=basePath%>personal/updatePassword',
            success: function (result) {
                if(result.code==1) {
                    alert("修改成功");
                }else if(result.code==2){
                    alert("旧密码错误");
                }
            },
            error: function () {
                alert("错误");
            }
        });
    }

</script>