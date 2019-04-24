<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String imagePath="https://aldrich.oss-cn-beijing.aliyuncs.com/image/StudyPlatform/avatar/";
%>
<html>
<head>
    <title>管理员界面</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/adminStyle.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
</head>
<body>

<%--数据表格头部和主体--%>
<div class="content">
    <%--头部搜索栏--%>
    <div class="header">
       <div class="demoTable" style="width: 1100px">
        <blockquote class="layui-elem-quote">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input class="layui-input" id="adminAccount" type="text" placeholder="账号">
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input class="layui-input" id="adminName" type="text" placeholder="昵称">
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input class="layui-input" type="text"  id="time" lay-verify="required"   autocomplete="off" placeholder="加入时间 ">
                </div>
                &nbsp; &nbsp;
                <button class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>
            </div>

            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal">审核权限</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger">设置权限</a>
            </div>

        </blockquote>
       </div>
    </div>

    <div class="center">
        <!--数据表格-->
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>

<!--加载头部工具栏-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" lay-event="delete"><i class="layui-icon">&#xe640;</i>批量删除</button>
        <button class="layui-btn layui-btn" lay-event="add"> <i class="layui-icon">&#xe654;</i>添加</button>
        <button class="layui-btn layui-btn" lay-event="flush"><i class="layui-icon">&#x1002;</i>刷新</button>
    </div>
</script>


<!--加载表格操作栏-->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="check"><i class="layui-icon">&#xe638;</i>查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="update"><i class="iconfont icon-edit"></i>修改</a>
</script>


<!--改变状态颜色-->
<script type="text/html" id="actor">
    {{#if(d.role==='1001'){ }}
    <span style="color: #189F92;font-weight: bolder">超级管理员</span>
    {{#  } else if(d.role==='1002') { }}
    <span style="color:#FF5722;font-weight: bolder">系统管理员</span>
    {{# } else { }}
    <span style="color: #393D49;font-weight: bolder">小白管理员</span>
    {{#  } }}
</script>


<%--<script type="text/html" id="TimeTpl">
    {{#
    var parseDate= function(date){
    if(date){
    var t=new Date(date);
    return t.getFullYear()+"-"+(t.getMonth()+1)+"-"+t.getDate()+" "+t.getHours()+":"+t.getMinutes();
    }
    }
    }}
    {{parseDate(d.updateTime)}}
</script>--%>

<!--  表单开关是否显示 -->
<script type="text/html" id="state">
{{#  if(d.state=== '已授权'){ }}
<input type="checkbox" id="on" name="menuDisplay" value="{{d.account}}" lay-skin="switch"  lay-text="已授权|未授权" lay-filter="state" checked >
{{#  } else { }}
<input type="checkbox" id="off" name="menuDisplay" value="{{d.account}}" lay-skin="switch" lay-text="已授权|未授权" lay-filter="state" >
{{#  } }}
</script>


<!--创建表格 -->
<script type="text/javascript">


    layui.use(['table','laydate','form'],function(){

        let table   = layui.table,
            form = layui.form,
            laydate = layui.laydate;

        <!--表格加载-->
        table.render({
            elem: '#test'
            ,url:'<%=basePath%>admin/allAdmins'
            ,toolbar: '#toolbarDemo'
            , method: 'POST'
            ,title: '管理员个人信息数据表'
            ,width:1100
            ,algin:'center'
            ,cols: [[
                {type:'numbers' , fixed: 'left',title:'#'}
                ,{type: 'checkbox', fixed: 'left'}
                ,{field:'account', title:'帐号', width:150,templet:'#account',sort: true}
                ,{field:'name', title:'昵称', width:120}
                ,{field:'state', title:'审核状态', width:120,templet:'#state',unresize: true}
                ,{field:'time', title:'加入时间', width:120,sort: true}
                ,{field:'role', title:'角色', width:120,templet:'#actor'}
                ,{field:'image', title:'头像', width: 100,style:'height:100%;',templet:'<div><img src="<%=imagePath%>{{d.image}}" alt=""></div>'}
                ,{field:'email', title:'邮箱', width:200}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:220}
            ]]
            ,page: true
            ,limit:7
        });

        <!--日历加载-->
      /*  laydate.render({
            elem: '#time'
            ,theme: 'molv'
            ,type: 'datetime'
        });*/


        <!--switch事件-->
        form.on('switch(state)', function(data){

              let alert_value =this.checked ? '已授权' : '未授权';
                //状态更新
               $.ajax({
                        type: 'POST',
                        url: '<%=basePath%>admin/submit/authorize',
                        dataType: 'json',
                        data: {"state":alert_value,"account":this.value},
                        beforeSend:function(){
                            change = layer.msg('正在切换中，请稍候',{icon: 16,time:false,shade:0.8});
                        },
                        success: function(result){
                            if(result.code===1){
                                setTimeout(function(){
                                    layer.close(change);layer.msg('操作成功！');},2000);
                            }else{
                                layer.msg('数据异常，操作失败！');
                            }
                        },
                        error: function(data){
                        layer.msg('数据异常，操作失败！8');
                        }
                    });

              /*if(data.elem.checked){
                data.elem.checked=false;
                $(data.othis).removeClass("layui-form-onswitch");
                data.othis.html("<em>未授权</em><i></i>");
              }
              else{
                data.elem.checked=true;
                $(data.othis).addClass("layui-form-onswitch");
                data.othis.html("<em>已授权</em><i></i>");
              }*/
        });


        <!--头工具栏事件-->
        table.on('toolbar(test)', function(obj){
            let checkStatus = table.checkStatus(obj.config.id);
            let data = checkStatus.data;
            switch(obj.event){
                case 'delete':
                        if (data.length === 0) {
                            parent.layer.msg('请先选择要删除的数据行！', {icon: 2});
                            return;
                        }
                        <!--批量删除-->
                        let accounts = "";
                        for (let i = 0; i < checkStatus.data.length; i++) {
                            accounts += checkStatus.data[i].account + ",";
                        }
                        parent.layer.msg('删除中...', {icon: 16, shade: 0.3, time: 5000});
                        $.post('<%=basePath%>admin/deleteByIds',
                            {'accounts': accounts},
                            function (data) {
                                layer.closeAll('loading');
                                if (data.code === 1) {
                                    parent.layer.msg('删除成功！', {icon: 1, time: 2000, shade: 0.2});
                                    table.reload('test', {
                                        url: '<%=basePath%>admin/allAdmins'
                                    });
                                } else {
                                    parent.layer.msg('删除失败！', {icon: 2, time: 3000, shade: 0.2});
                                }
                            }
                        );
                    break;
                case 'add':
                        window.location.href="<%=basePath%>admin/manager";
                case 'flush':
                    table.reload('test',{
                        type:"POST",
                        url:'<%=basePath%>admin/allAdmins'
                    });
                    break;
            }
        });

        <!--监听行工具事件-->
        table.on('tool(test)', function(obj){
            let data = obj.data;
            if(obj.event === 'del'){

                let account = data.account;
                layer.confirm('真的删除行么?',{btn: ['确定', '取消'],title:"提示",skin: 'layui-layer-molv',btnAlign: 'c'},function(index) {
                    $.post('<%=basePath%>admin/deleteById',
                        {'account': account},
                        function (data) {
                            layer.close(index);
                            if (data.code === 1) {
                                parent.layer.msg('删除成功！', {icon: 1, time: 3000, shade: 0.2});
                                table.reload('test', {
                                    type: "post",
                                    url: '<%=basePath%>admin/allAdmins'
                                });
                            } else {
                                parent.layer.msg('删除失败！', {icon: 2, time: 3000, shade: 0.2});
                            }
                        }
                    );
                });

            } else if(obj.event === 'check'){
                let account =  data.account;
                window.location.href="<%=basePath%>admin/forwardAdmin"+'?account='+account;
            }else if(obj.event==="update")
            {
                let account =  data.account;
                window.location.href="<%=basePath%>admin/forwardAdmin"+'?account='+account;
            }
        });

        <!--触发搜索事件-->
        let $ = layui.$, active = {
            reload: function(){
                let account = $('#adminAccount').val();
                let name    = $('#adminName').val();
                let time    = $('#time').val();
                let index=layer.msg("查询中，请稍后...",{icon:16,time:false,shade:0});
                setTimeout(function () {
                    //执行刷新
                    table.reload('test', {
                        type:"post",
                        url:'<%=basePath%>admin/search',
                        page: {
                            curr: 1 //重新从第 1 页开始
                        },
                        where: {
                            account:account,
                            name:name,
                            time:time
                        }
                    });
                    layer.close(index);
                },800);
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            let type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


    });
</script>
