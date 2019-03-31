<%--
  Created by IntelliJ IDEA.
  User: 李玉廷
  Date: 2018/12/25
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String imagePath=basePath+"assets/images/avatar/";
%>

<html>
<head>
    <title>Title</title>
    <title>管理员注册界面</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/adminStyle.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
</head>
<body>
<%--主体--%>
<div class="register">

    <%--tab--%>
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" id="test">

        <%--title--%>
        <ul class="layui-tab-title">
            <li class="layui-this">添加</li>
            <li id="renew">修改</li>
            <li id="check">查看</li>
        </ul>

        <%--content--%>
        <div class="layui-tab-content">

            <%--添加--%>
            <div class=" layui-tab-item layui-show " lay-id="111" >
                <form class="layui-form layui-form-pane" action="">

                    <!--账号-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" name="account" lay-verify="required|phone"
                                   placeholder="请输入您的账号即手机号" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <!--昵称-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text"  name="name" lay-verify="required|name"
                                   placeholder="请输入您的昵称" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <!--密码-->
                    <div class="layui-form-item " >
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password"  name="pwd" lay-verify="required|pwd"
                                   placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <!--时间-->
                    <div class="layui-form-item " >
                        <label class="layui-form-label">时间</label>
                        <div class="layui-input-block">
                            <input class="layui-input" type="text" name="time" id="times" lay-verify="required"   autocomplete="off" placeholder=" 输入时间 ">
                        </div>
                    </div>

                    <!--邮箱-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text"   name="email" lay-verify="required|email"
                                   placeholder="请输入您的邮箱" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <!--role-->
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">角色</label>
                        <div class="layui-input-block">
                            <input type="radio"   name="role" value="1001" title="VIP用户">
                            <input type="radio"   name="role" value="1002" title="普通用户" checked>
                        </div>
                    </div>

                    <!--未授权-->
                    <div class="layui-form-item layui-form" pane="" >
                        <label class="layui-form-label">未授权</label>
                        <div class="layui-input-block">
                            <input type="checkbox" checked="" name="state" lay-skin="switch" lay-filter="switchTest" title="开关" disabled>
                        </div>
                    </div>

                    <!--头像-->
                    <div class="layui-form-item">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" id="upload1">
                                <i class="layui-icon">&#xe67c;</i>上传图片
                            </button>
                            <input  id="img_url" name="img" value=""/>
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
                            <a  href="<%=basePath%>admin/backstage/show" class="layui-btn layui-btn-radius layui-btn-primary">返回</a>
                        </div>
                    </div>

                </form>
            </div>

            <%--修改--%>
            <div class="layui-tab-item"  lay-id="222">
                <!--修改表单-->
                <form class="layui-form layui-form-pane"
                      action="" id="update">
                    <!--账号-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" id="accounts" name="account" lay-verify="required|phone"
                                   placeholder="请输入您的账号即手机号" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>

                    <!--昵称-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text" id="names" name="name" lay-verify="required|name"
                                   placeholder="请输入您的昵称" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <!--密码-->
                    <div class="layui-form-item " >
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="pwd" name="pwd" lay-verify="required|pwd"
                                   placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <!--role-->
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">角色</label>
                        <div class="layui-input-block">
                            <input type="radio" name="role" value="1001" title="VIP用户">
                            <input type="radio" name="role" value="1002" title="普通用户">
                        </div>
                    </div>

                    <!--邮箱-->
                    <div class="layui-form-item" >
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" id="emails" name="email" lay-verify="required|email"
                                   placeholder="请输入您的邮箱" autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <!--头像-->
                    <div class="layui-form-item">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" id="upload2">
                                <i class="layui-icon">&#xe67c;</i>上传图片
                            </button>
                            <input  id="photos" name="img" value=""/>
                            <div class="layui-upload-list" style="width: 100px;height:100px">
                                <img  class="layui-upload-img" width="100px" height="80px" id="demo2"/>
                                <p id="demoText2"></p>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item" style="margin-left: 27%">
                        <div class="layui-input-block" >
                            <button class="layui-btn" lay-submit="" lay-filter="demo2">修改</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>

            <%--查看--%>
            <div class="layui-tab-item"  lay-id="333">
                <%--用户主页--%>
                <div class="description">
                    <div class="detail">
                        <%--简介--%>
                        <div class="detail-left">
                            <h3>WELCOME TO SYSTEM BACKSTAGE</h3>
                            <hr class="layui-bg-green" width="3px">
                            <ul>
                                <li>
                                    <label class="desc"  >昵称</label>
                                    <span class="spans" id="name">aldrich</span>
                                </li>
                                <li>
                                    <label class="desc">账号</label>
                                    <span class="spans" id="account">18756076151</span>
                                </li>
                                <li>
                                    <label class="desc">角色</label>
                                    <span class="spans" id="role">普通用户</span>
                                </li>
                                <li>
                                    <label class="desc">邮箱</label>
                                    <span class="spans" id="email">201076171@qq.com</span>
                                </li>
                                <li>
                                    <label class="desc">加入时间</label>
                                    <span class="spans" id="start">201076171@qq.com</span>
                                </li>
                            </ul>
                        </div>
                        <%--头像--%>
                        <div class="detail-right"><img id="photo" src="<%=basePath%>assets/images/face.jpg"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<%--
<script type="text/javascript" src="<%=basePath%>assets/js/register.js"></script>
--%>
<script type="text/javascript">

    let url="<%=basePath%>admin/getAdmin";
    let imaUrl=" http://localhost:8080/EnglishSystem/assets/images/2018/12/";
    let sign ="${sessionScope.sign}";
    let part;
    console.log(sign);



    /*获取用户详细信息*/
    function getUser(url)
    {
        $.ajax({
            url:url,
            dataType:"json",
            type:"get",
            contentType: "application/json; charset=utf-8",
            success:function (data) {
                let name = data['name'];
                let role = data['role'];
                let time = data['time'];
                let path =imaUrl+data['image'];
                let email     = data['email'];
                let account   = data['account'];

                if(role==="1001"){
                    $('#role').text("VIP用户");
                }
                if(role==="1002"){
                    $('#role').text("普通用户");
                }


                part=role;
                /*查看*/
                $('#name').text(name);
                $('#start').text(time);
                $('#email').text(email);
                $('#account').text(account);
                $('#authorize').text(authorize);
                $('#photo').attr("src",path);

                /*修改*/
                $('#names').val(name);
                $('#accounts').val(account);
                $('#emails').val(email);
                $('#photos').val(path);


            },
            error:function () {
                layer.msg("发生错误",{icon:5,time:3000});
            }
        })
    }


    $(document).ready(function () {

        layui.use(['layer','upload','form'], function(){
            let layer = layui.layer,
                form = layui.form,
                upload = layui.upload,
                laydate = layui.laydate,
                element = layui.element;



            $('#update input[name="role"]').each(function(){
                if($(this).val()===part)
                {
                    $(this).prop("checked",true);
                }
                form.render('radio');
            });

            /*
             *添加-日历加载
             * */
            laydate.render({
                elem: '#times'
                ,theme: 'molv'
                ,type: 'datetime'
            });

            /*
            *修改-日历加载
            * */
            laydate.render({
                elem: '#time'
                ,theme: 'molv'
                ,type: 'datetime'
            });



            //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
            let layid = location.hash.replace(/^#test1=/, '');
            element.tabChange('test1', layid);

            //监听Tab切换，以改变地址hash值
            element.on('tab(test1)', function(){
                location.hash = 'test1='+ this.getAttribute('lay-id');
            });


            /**
             * 表单验证*/
            form.verify({
                name: function(value){
                    if(value.length < 3){
                        return '请输入至少3位的用户名';
                    }
                    if(value.length>7)
                    {
                        return '请输入少于7位的用户名';
                    }
                    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '用户名不能有特殊字符';
                    }
                    if(/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '用户名首尾不能出现下划线\'_\'';
                    }
                    if(/^\d+\d+\d$/.test(value)){
                        return '用户名不能全为数字';
                    }
                },
                pwd:[ /^[\S]{6,12}$/
                    ,'密码必须6到12位，且不能出现空格']
            });


            /*
            * 保存-上传照片
            * */
            let uploadInst = upload.render({
                elem: '#upload1' //绑定元素
                ,url: '<%=basePath%>admin/upload/img' //上传接口
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

            /*
            * 修改-上传照片
            * */
            let uploadInst2 = upload.render({
                elem: '#upload2' //绑定元素
                ,url: '<%=basePath%>admin/upload/img' //上传接口
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#demo2').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //如果上传失败
                    if(res.code > 0){
                        return layer.msg('上传失败');
                    }
                    //上传成功
                    layer.alert("上传成功"+res['data']['title']);
                    document.getElementById("photos").value = res['data']['title'];
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    let demoText = $('#demoText2');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadInst.upload();
                    });
                }
            });

            /*
            * 保存数据
            * */
            form.on('submit(demo1)', function (data) {
                $.ajax({
                    type: 'POST',
                    url:'<%=basePath%>admin/submit/data',
                    /*dataType: 'json',
                    data: data.field,//往后台发送的是data.field，即一个{name：value}的数据结构*/
                    data: $(data.form).serialize(),
                    success: function (result) {
                        let decide = result.code;
                        if(decide===0)
                        {
                            layer.msg('账号已存在', {icon: 2, time: 3000});
                        }
                        if(decide===-1)
                        {
                            layer.msg('昵称已存在', {icon: 2, time: 3000});
                        }
                        if(decide===2)
                        {
                            layer.msg('邮箱已存在', {icon: 2, time: 3000});
                        }
                        if(decide===1)
                        {
                            layer.msg('保存成功', {icon: 1, time: 3000});
                        }
                    },
                    error: function () {
                        layer.msg('保存失败！', {icon: 2, time: 1000});
                    }
                });
                return false;
            });

            /*
            * 修改数据
            * */
            form.on('submit(demo2)', function (data) {
                $.ajax({
                    type: 'POST',
                    url:'<%=basePath%>admin/submit/update',
                    /*dataType: 'json',
                    data: data.field,//往后台发送的是data.field，即一个{name：value}的数据结构*/
                    data: $(data.form).serialize(),
                    success: function (result) {
                        let decide = result.code;

                        /* if(decide===-1)
                         {
                             layer.msg('昵称已存在', {icon: 2, time: 3000});
                         }
                         if(decide===2)
                         {
                             layer.msg('邮箱已存在', {icon: 2, time: 3000});
                         }*/
                        if(decide===1)
                        {
                            layer.msg('修改成功', {icon: 1, time: 3000});
                        }
                    },
                    error: function () {
                        layer.msg('修改失败！', {icon: 2, time: 1000});
                    }
                });
                return false;
            });

            return false;
        });

        getAdmin(url);

    });


</script>


