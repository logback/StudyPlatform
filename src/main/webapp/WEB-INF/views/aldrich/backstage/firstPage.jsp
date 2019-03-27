<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10
  Time: 11:19
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
    <title>后台首页</title>
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/home.css">
    <link rel="stylesheet" href="<%=basePath%>assets/style/font_icon.css">
</head>

<body class="childrenBody">
   <div class="panel_box row">
    
    <div class="panel col">
        <a href="javascript:;" data-url="page/message/message.html">
            <div class="panel_icon">
                <i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
            </div>
            <div class="panel_word newMessage">
                <span>10</span>
                <cite>小白简介</cite>
            </div>
        </a>
    </div>
   
    <div class="panel col">
        <a href="javascript:;" data-url="page/user/allUsers.html">
            <div class="panel_icon" style="background-color:#FF5722;">
                <i class="iconfont icon-dongtaifensishu" data-icon="icon-dongtaifensishu"></i>
            </div>
            <div class="panel_word userAll">
                <span>20</span>
                <cite>用户总数</cite>
            </div>
        </a>
    </div>
   
    <div class="panel col">
        <a href="javascript:;" data-url="page/user/allUsers.html">
            <div class="panel_icon" style="background-color:#009688;">
                <i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
            </div>
            <div class="panel_word userAll">
                <span>30</span>
                <cite>管理员总数</cite>
            </div>
        </a>
    </div>
    
    <div class="panel col">
        <a href="javascript:;" data-url="page/img/images.html">
            <div class="panel_icon" style="background-color:#5FB878;">
                <i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
            </div>
            <div class="panel_word imgAll">
                <span>30</span>
                <cite>图片总数</cite>
            </div>
        </a>
    </div>
    
    <div class="panel col">
        <a href="javascript:;" data-url="page/news/newsList.html">
            <div class="panel_icon" style="background-color:#F7B824;">
                <i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
            </div>
            <div class="panel_word waitNews">
                <span>40</span>
                <cite>句子总数</cite>
            </div>
        </a>
    </div>
   
    <div class="panel col ">
        <a href="javascript:;" data-url="page/news/newsList.html">
            <div class="panel_icon" style="background-color:#2F4056;">
                <i class="iconfont icon-text" data-icon="icon-text"></i>
            </div>
            <div class="panel_word allNews">
                <span>20</span>
                <em>单词总数</em>
            </div>
        </a>
    </div>
   </div>

 <%-- <blockquote class="layui-elem-quote">
    <p>本后台界面基于Layui实现，支持所有的Layui组件。<a href="http://layim.layui.com/" target="_blank" class="layui-btn layui-btn-mini">前往获取LayIM授权</a>　　<span style="color:#1E9FFF;">郑重提示：网站所有数据均为静态数据，无数据库，除打开的窗口和部分小改动外所有操作刷新后无效，关闭窗口或清除缓存后，所有操作无效，请知悉</span></p>
    <p style="margin-top:5px;">开发文档地址：<a class="layui-btn layui-btn-mini" target="_blank" href="http://www.layui.com/doc">点此跳转</a> <a class="layui-btn layui-btn-mini layui-btn-danger" target="_blank" href="http://fly.layui.com/case/u/3198216">我要点赞</a>　　技术交流QQ群：<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=8b7dd3ea73528c1e46c5d4e522426d60deed355caefdf481c1eacdd1b7b73bfd"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="layui后台管理模版" title="layui后台管理模版"></a>（添加时请注明来自本框架） <span style="color:#f00;"> 注：本框架未引入任何第三方组件（天气信息除外），单纯的layui+js实现的各种功能【本框架仅作为学习交流使用，如需用作商业用途，请联系作者授权，谢谢】</span></p>
  </blockquote>--%>

 <div class="row">
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">更新日志</blockquote>
        <div class="layui-elem-quote layui-quote-nm">
            <h3># 1.0.9_rls （发行版） - 2017-03-01</h3>
            <p>* checkbox复选框原始风格支持不显示文字（之前会默认显示：勾选）</p>
            <p>* 进度条超出100%情况下的自动处理</p>
            <p>* 修复Tab选项卡在出现下拉按钮时，点击最后的几个选项卡未能正常切换的bug</p>
            <p>* 修复select组件搜索选择时会先显示之前的值再替换新的值的不良体验</p>
            <p>* 修复默认进度条0%时，文本出现太过于左侧的问题</p>
            <br />
            <p># 1.0.9</p>
            <p>* 新增“折叠面板”页面元素及相关事件监听</p>
            <p>* select组件增加搜索匹配功能，通过参数 lay-search 开启</p>
            <p>* checkbox组件增加原始风格样式，通过设置 lay-skin="primary" 开启（跟系统自带的类似样貌）</p>
            <p>* 升级 layer弹层组件到 3.0.2 （ layer3.0.2更新日志 ）</p>
            <p>* 表单元素增加属性 lay-ignore ,设置后，将不会对该标签进行美化渲染，即保留系统风格</p>
            <p>* 开关增加两种状态的自定义文本，通过参数 lay-text="ON|OFF" 开启</p>
            <p>* 修复Tab选项卡嵌套的Tab没有对应的内容结构时，切换到了父级内容的bug</p>
            <p>* 修复Tab选项卡容器中使用下拉框时，被溢出隐藏的问题</p>
            <p>* 修复Tab选项卡溢满情况下，点击展开按钮，再在外部添加一个选项卡出现异常的bug</p>
            <p>* Tab选项卡部分UI细节优化</p>
            <p>* Tab选项卡的tabAdd增加id参数，用于在删除和切换时，以id作为匹配媒介</p>
        </div>
    </div>
    <div class="sysNotice col">
        <blockquote class="layui-elem-quote title">系统基本参数</blockquote>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <td>当前版本</td>
                <td class="version">version3.20</td>
            </tr>
            <tr>
                <td>开发作者</td>
                <td class="author">Aldrich</td>
            </tr>
            <tr>
                <td>网站首页</td>
                <td class="homePage">www.cyxxn.top</td>
            </tr>
            <tr>
                <td>服务器环境</td>
                <td class="server">nginx+Mysql+Tomcat</td>
            </tr>
            <tr>
                <td>数据库版本</td>
                <td class="dataBase">Mysql5.17</td>
            </tr>
            <tr>
                <td>最大上传限制</td>
                <td class="maxUpload">99MB</td>
            </tr>
            <tr>
                <td>当前用户权限</td>
                <td class="userRights">root</td>
            </tr>
            </tbody>
        </table>
        <%--<blockquote class="layui-elem-quote title">最新文章<i class="iconfont icon-new1"></i></blockquote>
        <col width="110">
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col>
            </colgroup>
            <tbody class="hot_news"></tbody>
        </table>--%>
    </div>
 </div>
</body>

</html>
