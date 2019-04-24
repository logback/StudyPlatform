<%--
  Created by IntelliJ IDEA.
  User: 78203
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
    <meta name="revised" content="Ningxia Seasons, 2015/8/13/"/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
    <!-- 搜索关键字 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>某经融公司股权众筹站点</title>

    <!-- Bootstrap -->
    <link href="<%=basePath%>assets/Trahald/css/crowdfunding.center/my_info.css" rel="stylesheet">
</head>
<body>
<!-- 开始 -->
<div class="my_info_title" style="height: 50px;">我的资料</div>
<div class="my_info_title_3">
    <ul>
        <li id="listClick_1" onClick="listClick(1)" style="border-bottom: 1px solid #C40521; color: #C40521;">基本资料</li>
        <!--<li id="listClick_3" onClick="listClick(3)">身份认证</li>-->
        <li id="listClick_4" onClick="listClick(4)">修改密码</li>
    </ul>
</div>
<div class="my_info_content">
    <div class="my_info_content_care"> 以下信息都为必填项，请您认真填写，感谢您对小白学习平台的信任和支持！</div>
    <table class="my_info_content_care_table">
        <tr>
            <td width="90" align="right" class="color555">用户名：</td>
            <td class="color555" id="personalName"></td>
        </tr>
        <!--<tr>
          <td align="right" class="color555">手机号码：</td>
          <td class="color555">18609515574<span class="color959595 margin_left10 font_size12">友好提示：网站前台不会显示您手机号</span></td>
        </tr>-->
        <tr>
            <td align="right" class="color555">用户名：</td>
            <td class="color555">
                <input type="text" id="name" class="my_info_content_care_table_text" name="name" >
                <span class="color959595 margin_left10 font_size12">友好提示：网站前台不会显示您的信息</span>
            </td>
        </tr>
        <!--
        <tr>
            <td align="right" class="color555">性别：</td>
            <td class="color555"><label>
                <input type="radio" name="sex" value="未知" checked>
                未知 </label>
                <label>
                    <input type="radio" name="sex" value="男士">
                    男士 </label>
                <label class="radio-inline">
                    <input type="radio" name="sex" value="女士">
                    女士
                </label>
            </td>
        </tr>
        -->
        <tr>
            <td align="right" class="color555">邮箱：</td>
            <td class="color555"><input type="text" id="email" class="my_info_content_care_table_text" name="email" >
                <span class="color959595 margin_left10 font_size12">友好提示：请填写常用邮箱，您忘记密码时可用邮箱找回，有新项目动态时会发邮件给您</span></td>
        </tr>
        <!--<tr>
          <td align="right" class="color555">身份证号：</td>r
          <td class="color555"><input class="my_info_content_care_table_text" name="" type="text">
            <span class="colorCA1E37 margin_left10 font_size12">保存后不能修改，请确认无误后再保存</span></td>
        </tr>-->
        <tr>
            <td align="right" class="color555">&nbsp;</td>
            <td class="color555"><span class="color959595 margin_left10 font_size12">友情提示：网站不会显示您的身份信息</span></td>
        </tr>
        <tr>
            <td align="right" class="color555">个人名片：</td>
            <td class="color555"><img id="cardimg" width="215" height="110"
                                      src="<%=basePath%>assets/Trahald/images/member_center/carddefault.jpg">
                <input class="my_info_content_care_table_file" name="" type="file"></td>
        </tr>
        <tr>
            <td align="right" class="color555">&nbsp;</td>
            <!--<td class="color555"><span class="color959595 margin_left10 font_size12">友情提示：便于投融双方了解到您的相关信息，从而促进项目尽快达成</span></td>-->
        </tr>

        <tr>
            <td align="center" class="color555" colspan="2">
                <input class="my_info_content_care_table_submit" id="save" value="保    存" onclick="fun()">
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
    <script src="<%=basePath%>assets/Trahald/js/my_info.js"></script>
    <script src="<%=basePath%>assets/Trahald/js/jquery.cityselect.js"></script>
    <script type="text/javascript">
        // JavaScript Document
        $(document).ready(function () {
            $("#my_city").citySelect({
                prov: "北京",
                nodata: "none"
            });
        });
    </script>
</div>
</body>
</html>
<script type="text/javascript" language="javascript">

    function fun() {
        var name = $('#name').val();
        var email = $('#email').val();
        $.ajax({
            data:{name:name,email:email},
            type: 'POST',
            dataType: "json",
            url: '<%=basePath%>personal/updateName',
            success: function (result) {
                if(result.code==1) {
                    alert("保存成功");
                }
            },
            error: function () {
                alert("保存失败");
            }
        });
    }

    $(function(){
        $.ajax({
            url:'<%=basePath%>personal/selectName',
            dataType: "json",
            success:function (data) {
                  console.log(data);
               // $('#personalName').html(data.name.name);
                //  personalName
            }
        });
    });


</script>