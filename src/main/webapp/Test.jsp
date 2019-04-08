<%--
  Created by IntelliJ IDEA.
  User: Aldrich
  Date: 2019/4/8
  Time: 10:07
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
<html>
<head>
    <title>图片上传测试</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
</head>
<body>

<div style="width: 80%;height: 100%;position: absolute;overflow: hidden;margin-left: 10%">
    <form class="layui-form layui-form-pane" action="">


        <!--头像-->
        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="upload">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <input  id="img_url" name="img_url" type="file"/>
                <div class="layui-upload-list" style="width: 100px;height:100px">
                    <img  class="layui-upload-img" width="100px" height="80px" id="demo1"/>
                    <p id="demoText"></p>
                </div>
            </div>
        </div>

        <!--提交-->
        <div class="layui-form-item" style="margin-left: 27%">
            <div class="layui-input-block" >
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>

<div>
    
    <img style="height: 100%;width: 100%" src="https://aldrich.oss-cn-beijing.aliyuncs.com/image/StudyPlatform/a3.jpg">
    
</div>
</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript">


        layui.use(['layer','upload','form','laydate'], function() {
        let layer = layui.layer,
            form    = layui.form,
            upload = layui.upload;


        let uploadInst = upload.render({
            elem: '#upload' //绑定元素
            ,type:'post'
            ,url: '${pageContext.request.contextPath}/admin/upload/img' //上传接口
            ,processData: false//上传必须
            ,contentType: false//上传必须
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                layer.alert("上传成功"+res['data']['title']);
                document.getElementById("img_url").value = res['data']['title'];
            }
            ,error: function(){
                //演示失败状态，并实现重传
                let demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });


    });

</script>