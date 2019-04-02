<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2019/1/2
  Time: 9:17
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
    <title>用户界面</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/adminStyle.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">

</head>
<body style="overflow-x: hidden">

<%--数据表格头部和主体--%>
<div class="content">
    <%--头部搜索栏--%>
    <div class="header">
        <div class="demoTable" style="width: 1100px">
            <blockquote class="layui-elem-quote">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input class="layui-input" id="userAccount" type="text" placeholder="账号">
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


<!--创建表格 -->
<script type="text/javascript">

    layui.use(['table','laydate','form'],function(){

        let table   = layui.table,
            form = layui.form,
            laydate = layui.laydate;

        <!--表格加载-->
        table.render({
            elem: '#test'
            ,url:'<%=basePath%>start/allpractice'
            ,toolbar: '#toolbarDemo'
            , method: 'POST'
            ,title: '题库信息表'
            ,width:1100
            ,algin:'center'
            ,cols: [[
                 {type:'numbers', fixed: 'left',title:'#'}
                ,{type: 'checkbox', fixed: 'left'}
                ,{field:'id',title:'题号',templet:'#id',width:120}
                ,{field:'article', title:'文章', width:150,sort: true}
                ,{field:'topic', title:'问题',templet:'#topic', width:120}
                ,{field:'selectA', title:'A选项', width:120,sort: true}
                ,{field:'selectB', title:'B选项', width:120,}
                ,{field:'selectC', title:'C选项', width:120,style:'height:100%;'}
                ,{field:'selectD', title:'D选项', width:120}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:220}
            ]]
            ,page: true
            ,limit:7
        });
        <!--头工具栏事件-->
        table.on('toolbar(test)', function(obj){
            let checkStatus = table.checkStatus(obj.config.id);
            let data = checkStatus.data;
            switch(obj.event){
                case 'delete':
                    if(role===1001&&state==="已授权") {
                        if (data.length === 0) {
                            parent.layer.msg('请先选择要删除的数据行！', {icon: 2});
                            return;
                        }
                        <!--批量删除-->
                        let ids = "";
                        for (let i = 0; i < checkStatus.data.length; i++) {
                            ids += checkStatus.data[i].id + ",";
                        }
                        parent.layer.msg('删除中...', {icon: 16, shade: 0.3, time: 5000});
                        $.post('<%=basePath%>start/deleteByIds',
                            {'ids': ids},
                            function (data) {
                                layer.closeAll('loading');
                                if (data.code === 1) {
                                    parent.layer.msg('删除成功！', {icon: 1, time: 2000, shade: 0.2});
                                    table.reload('test', {
                                        url: '<%=basePath%>start/allpractice'
                                    });
                                } else {
                                    parent.layer.msg('删除失败！', {icon: 2, time: 3000, shade: 0.2});
                                }
                            }
                        );
                    }else {
                        layer.msg('您无权限！', {icon: 5, time: 2000, shade: 0.2});
                    }
                    break;
                case 'add':
                    if(role!==1003&&state==="已授权"){
                        window.location.href="<%=basePath%>user/manager";
                    }else
                    {
                        layer.msg('您无权限！', {icon: 5, time: 2000, shade: 0.2});
                    }
                case 'flush':
                    table.reload('test',{
                        type:"POST",
                        url:'<%=basePath%>user/allUsers'
                    });
                    break;
            }
        });

        <!--监听行工具事件-->
        table.on('tool(test)', function(obj){
            let data = obj.data;
            if(obj.event === 'del'){
                if(role===1001&&state==="已授权"){
                    let account = data.account;
                    layer.confirm('真的删除行么?',{btn: ['确定', '取消'],title:"提示",skin: 'layui-layer-molv',btnAlign: 'c'},function(index) {
                        $.post('<%=basePath%>start/deleteById',
                            {'account': account},
                            function (data) {
                                layer.close(index);
                                if (data.code === 1) {
                                    parent.layer.msg('删除成功！', {icon: 1, time: 3000, shade: 0.2});
                                    table.reload('test', {
                                        type: "post",
                                        url: '<%=basePath%>start/allpractice'
                                    });
                                } else {
                                    parent.layer.msg('删除失败！', {icon: 2, time: 3000, shade: 0.2});
                                }
                            }
                        );
                    });
                }else {
                    layer.msg('您无权限！', {icon: 5, time: 2000, shade: 0.2});
                }
            } else if(obj.event === 'check'){
                let account =  data.account;
                window.location.href="<%=basePath%>user/forwardUser"+'?account='+account;
            }else if(obj.event==="update")
            {  if(role===1003&&state==="已授权")
            {
                layer.msg('您无权限', {icon: 5, time: 3000, shade: 0.2});
            }else {
                let account =  data.account;
                window.location.href="<%=basePath%>user/forwardUser"+'?account='+account;
            }
            }
        });

        <!--触发搜索事件-->
        let $ = layui.$, active = {
            reload: function(){
                let account = $('#userAccount').val();
                let name    = $('#userName').val();
                let time    = $('#time').val();
                let index=layer.msg("查询中，请稍后...",{icon:16,time:false,shade:0});
                setTimeout(function () {
                    //执行刷新
                    table.reload('test', {
                        type:"post",
                        url:'<%=basePath%>user/search',
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
