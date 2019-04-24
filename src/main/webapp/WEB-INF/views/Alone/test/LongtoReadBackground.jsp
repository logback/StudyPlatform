<%--
  Created by IntelliJ IDEA.
  User: Alone1114qq
  Date: 2019/4/22
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String imagePath = "https://aldrich.oss-cn-beijing.aliyuncs.com/image/StudyPlatform/avatar/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>阅读后台</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <style>
        body {
            margin: 10px;
        }

        .demo-carousel {
            height: 200px;
            line-height: 200px;
            text-align: center;
        }
    </style>
</head>
<body>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<div class="layui-tab layui-tab-brief" lay-filter="demo">
    <div class="layui-tab-content">
        <div class="layui-tab-item">
            <div id="laydateDemo"></div>
        </div>
        <div class="layui-tab-item">
            <div id="pageDemo"></div>
        </div>
        <div class="layui-tab-item">
            <div id="sliderDemo" style="margin: 50px 20px;"></div>
        </div>
    </div>
</div>


<script type="text/javascript" src="<%=basePath%>assets/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script>
    layui.config({
        version: '1554901097999' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , carousel = layui.carousel //轮播
            , upload = layui.upload //上传
            , element = layui.element //元素操作
            , slider = layui.slider //滑块


        //监听Tab切换
        element.on('tab(demo)', function (data) {
            layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
                tips: 1
            });
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            , height: 420
            , id:'text'
            , url: '<%=basePath%>start/shortread' //数据接口
            , method: 'POST'
            , title: '题库表'
            , page: true //开启分页
            , limit: 7
            , algin: 'center'
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , totalRow: true //开启合计行
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'article', title: '文章', width: 80}
                , {field: 'topic', title: '问题', width: 80}
                , {field: 'selectA', title: 'A选项', width: 80}
                , {field: 'selectA', title: 'B选项', width: 80}
                , {field: 'selectA', title: 'C选项', width: 80}
                , {field: 'selectA', title: 'D选项', width: 80}
                , {field: 'answer', title: '答案', width: 80}
                , {field: 'parsing', title: '解析', width: 80}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 2
                        , title: '添加题目'
                        , content: '<%=basePath%>start/test/addShortRead'
                        , maxmin: true
                        , area: ['600px', '500px']
                        , btn: ['确定', '取消']
                        , yes: function (index, layero) {
                            var iframes=$(layero).find("iframe")[0].contentWindow;
                            var article=iframes.document.getElementById("article").value;
                            var topic=iframes.document.getElementById("topic").value;
                            var selectA=iframes.document.getElementById("selectA").value;
                            var selectB=iframes.document.getElementById("selectB").value;
                            var selectC=iframes.document.getElementById("selectC").value;
                            var selectD=iframes.document.getElementById("selectD").value;
                            var answer=iframes.document.getElementById("answer").value;
                            var parsing=iframes.document.getElementById("parsing").value;
                            $.ajax({
                                url:'<%=basePath%>start/addshortread',
                                type: 'post',
                                data:{article:article,topic:topic,selectA:selectA,selectB:selectB,selectC:selectC,selectD:selectD,answer:answer,parsing:parsing},
                                /*success:function (data) {
                                    console.log(data);
                                    if (data.code==1) {
                                        layer.msg("添加成功",{icon: 1,time:1000});
                                        location.reload();
                                    }else {
                                        layer.msg("添加失败",{icon: 2,time:1000});
                                    }

                                }*/
                                beforeSend:function(){
                                    change = layer.msg('正在切换中，请稍候',{icon: 16,time:false,shade:0.8});
                                },
                                success: function(result){
                                    if(result.code===1){
                                        setTimeout(function(){
                                            layer.close(change);layer.msg('操作成功！');},2000);
                                            table.reload('text');
                                    }else{
                                        layer.msg('数据异常，操作失败！');
                                    }
                                },
                                error: function(data){
                                    layer.msg('数据异常，操作失败！8');
                                }
                                });
                            layer.close(index); //关闭弹层
                        }
                    });
                    break;
                case 'update':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.open({
                            type: 2
                            , title: '修改题目'
                            , content: '<%=basePath%>start/test/updateShortRead?id='+checkStatus.data[0].id
                            , maxmin: true
                            , area: ['600px', '500px']
                            , btn: ['确定', '取消']
                            , yes: function (index, layero) {
                                var iframes=$(layero).find("iframe")[0].contentWindow;
                                var article=iframes.document.getElementById("article").value;
                                var topic=iframes.document.getElementById("topic").value;
                                var selectA=iframes.document.getElementById("selectA").value;
                                var selectB=iframes.document.getElementById("selectB").value;
                                var selectC=iframes.document.getElementById("selectC").value;
                                var selectD=iframes.document.getElementById("selectD").value;
                                var answer=iframes.document.getElementById("answer").value;
                                var parsing=iframes.document.getElementById("parsing").value;
                                $.ajax({
                                    url:'<%=basePath%>start/updateshortread',
                                    type: 'post',
                                    data:{article:article,topic:topic,selectA:selectA,selectB:selectB,selectC:selectC,selectD:selectD,answer:answer,parsing:parsing,id:checkStatus.data[0].id},
                                    beforeSend:function(){
                                        change = layer.msg('正在切换中，请稍候',{icon: 16,time:false,shade:0.8});
                                    },
                                    success: function(result){
                                        if(result.code===1){
                                            setTimeout(function(){
                                                layer.close(change);layer.msg('操作成功！');},2000);
                                                table.reload('text');
                                        }else{
                                            layer.msg('数据异常，操作失败！');
                                        }
                                    },
                                    error: function(data){
                                        layer.msg('数据异常，操作失败！8');
                                    }
                                });
                                layer.close(index); //关闭弹层
                            }
                        });
                    }
                    break;
                case 'delete':
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
                    $.post('<%=basePath%>start/deleteshortreadbyids',
                        {'ids': ids},
                        function (data) {
                        console.log(data)
                            layer.closeAll('loading');
                            if (data.code === 0) {
                                parent.layer.msg('删除成功！', {icon: 1, time: 2000, shade: 0.2});
                                table.reload('text');
                            } else {
                                parent.layer.msg('删除失败！', {icon: 2, time: 3000, shade: 0.2});
                            }
                        }
                    );
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            let data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            switch (layEvent) {
                case 'detail':
                    let id=data.id;
                    layer.open({
                        type: 2
                        , title: '修改题目'
                        , content: '<%=basePath%>start/test/showShortRead?id='+id
                        , maxmin: true
                        , area: ['600px', '500px']
                        , btn: ['确定', '取消']
                        , yes: function (index, layero) {
                            layer.close(index); //关闭弹层
                        }
                    });
                    break;
                case 'del':
                    if (data.length === 0) {
                        parent.layer.msg('请先选择要删除的数据行！', {icon: 2});
                        return;
                    }
                    parent.layer.msg('删除中...', {icon: 16, shade: 0.3, time: 5000});
                    $.post('<%=basePath%>start/deleteshortreadbyid',
                        {'id': id},
                        function (data) {
                            console.log(data)
                            layer.closeAll('loading');
                            if (data.code === 0) {
                                parent.layer.msg('删除成功！', {icon: 1, time: 2000, shade: 0.2});
                                table.reload('text');
                            } else {
                                parent.layer.msg('删除失败！', {icon: 2, time: 3000, shade: 0.2});
                            }
                        }
                    );
                    break;
                case 'edit':
                    layer.open({
                        type: 2
                        , title: '修改题目'
                        , content: '<%=basePath%>start/test/updateShortRead?id='+id
                        , maxmin: true
                        , area: ['600px', '500px']
                        , btn: ['确定', '取消']
                        , yes: function (index, layero) {
                            var iframes=$(layero).find("iframe")[0].contentWindow;
                            var article=iframes.document.getElementById("article").value;
                            var topic=iframes.document.getElementById("topic").value;
                            var selectA=iframes.document.getElementById("selectA").value;
                            var selectB=iframes.document.getElementById("selectB").value;
                            var selectC=iframes.document.getElementById("selectC").value;
                            var selectD=iframes.document.getElementById("selectD").value;
                            var answer=iframes.document.getElementById("answer").value;
                            var parsing=iframes.document.getElementById("parsing").value;
                            $.ajax({
                                url:'<%=basePath%>start/updateshortread',
                                type: 'post',
                                data:{article:article,topic:topic,selectA:selectA,selectB:selectB,selectC:selectC,selectD:selectD,answer:answer,parsing:parsing,id:id},
                                beforeSend:function(){
                                    change = layer.msg('正在切换中，请稍候',{icon: 16,time:false,shade:0.8});
                                },
                                success: function(result){
                                    if(result.code===1){
                                        setTimeout(function(){
                                            layer.close(change);layer.msg('操作成功！');},2000);
                                            table.reload('text');
                                    }else{
                                        layer.msg('数据异常，操作失败！');
                                    }
                                },
                                error: function(data){
                                    layer.msg('数据异常，操作失败！8');
                                }
                            });
                            layer.close(index); //关闭弹层
                        }
                    });
                    break;
            }
            /*if (layEvent === 'detail') {

            } else if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);

                });
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 2
                    , title: '修改题目'
                    , maxmin: true
                    , area: ['600px', '500px']
                    , btn: ['确定', '取消']
                    , yes: function (index, layero) {
                        var iframes=$(layero).find("iframe")[0].contentWindow;
                        var article=iframes.document.getElementById("article").value;
                        var topic=iframes.document.getElementById("topic").value;
                        var selectA=iframes.document.getElementById("selectA").value;
                        var selectB=iframes.document.getElementById("selectB").value;
                        var selectC=iframes.document.getElementById("selectC").value;
                        var selectD=iframes.document.getElementById("selectD").value;
                        var answer=iframes.document.getElementById("answer").value;
                        var parsing=iframes.document.getElementById("parsing").value;
                        $.ajax({

                            type: 'post',
                            data:{article:article,topic:topic,selectA:selectA,selectB:selectB,selectC:selectC,selectD:selectD,answer:answer,parsing:parsing,id:checkStatus.data[0].id},
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
                        layer.close(index); //关闭弹层
                    }
                });
            }*/
        });


        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            , count: 100 //总页数
            , skin: '#1E9FFF' //自定义选中色值
            //,skip: true //开启跳页
            , jump: function (obj, first) {
                if (!first) {
                    layer.msg('第' + obj.curr + '页', {offset: 'b'});
                }
            }
        });

        slider.render({
            elem: '#sliderDemo'
            , input: true //输入框
        });
    });

</script>
</body>
</html>

