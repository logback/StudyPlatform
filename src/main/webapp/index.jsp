<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Demo</title>
    <link rel="stylesheet" href="<%=basePath%>assets/graceful/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>assets/graceful/css/index.css">
    <link rel="stylesheet" href="<%=basePath%>assets/layui/css/layui.css">

</head>

<body>

<header class="header" id="header">
    <div class="header-bg"></div>
    <div class="header-top">
        <div class="container">
            <nav class="header-nav">
                <a href="#" class="item">小白</a>
                <a href="#" class="item item-cur">首页</a>
                <a href="#" class="item">小白简介</a>
                <a href="<%=basePath%>personal/home" class="item new-icon">个人中心<i></i></a>
                <a href="#" class="item">退出</a>
                <div class="nav-more__hover">
                    <div class="wrapper">
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>

<div class="main">
    <div class="main-inner">
        <div class="main-list">
            <div class="recommend-line">
                <span>大家正在关注</span>
            </div>
            <div class="main-list__wrapper clearfix">

                <a href="<%=basePath%>start/test/HomePage"><img src="assets/graceful/images/conts/main-list__img1.jpg" alt="#"><span>练习</span></a>
                <a href="<%=basePath%>start/reception/search"><img src="assets/graceful/images/conts/main-list__img2.jpg" alt="#"><span>查词</span></a>
                <a href="<%=basePath%>start/test"><img src="assets/graceful/images/conts/main-list__img3.jpg" alt="#"><span>资源</span></a>
                <a href="<%=basePath%>game/gamehome"><img src="assets/graceful/images/conts/main-list__img4.jpg" alt="#"><span>游戏</span></a>


            </div>
        </div>
        <div class="main-waterfall">
            <div class="recommend-line">
                <span>为您推荐</span>
            </div>
            <div class="main-waterfall__wrapper">
                <div class="main-waterfall__row clearfix">
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx1.sinaimg.cn/mw690/0060lm7Tly1fy1o2ounyyj308w08w0tc.jpg" alt="#" title="蝙蝠侠：黑暗骑士崛起"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx3.sinaimg.cn/mw690/0060lm7Tly1fy1o4wwb2aj308w08wq3q.jpg" alt="#" title="阿甘正传"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx1.sinaimg.cn/mw690/0060lm7Tly1fy1o8613l8j308w08wgn8.jpg" alt="#" title="疯狂动物城"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1o8dhjhoj308w08wwfh.jpg" alt="#" title="泰坦尼克号"></div>
                </div>
                <div class="main-waterfall__row clearfix">
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx3.sinaimg.cn/mw690/0060lm7Tly1fy1of0cnktj308w08w402.jpg" alt="#" title="驯龙高手3"></div>
                    <div class="waterfall-imgbox waterfall-box"> <img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1of4umcwj308w08wdgu.jpg" alt="#" title="飞屋环游记"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx3.sinaimg.cn/mw690/0060lm7Tly1fy1ofchjq6j308w08wwfm.jpg" alt="#" title="速度与激情8"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1ofg3nihj308w08wjt7.jpg" alt="#" title="寻梦环游记"></div>
                </div>
                <div class="main-waterfall__row clearfix">
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1ok0v6c2j308w08wwfu.jpg" alt="#" title="狂暴巨兽"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1ol6wk24j308w08wq45.jpg" alt="#" title="忠犬八公的故事"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1ol8n910j308w08wta1.jpg" alt="#" title="怦然心动 美国版"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1opm8yl7j30a00a0abo.jpg" alt="#" title="超人总动员2"></div>
                </div>
                <div class="main-waterfall__row clearfix">
                    <div onclick="window.open('<%=basePath%>start/playback?id=s1')" class="waterfall-imgbox waterfall-box"><img src="http://wx4.sinaimg.cn/mw690/0060lm7Tly1fy1py7fhd5j308w08w3z4.jpg" alt="#" title="【TED演讲】孩子都是天生的撒谎高手"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx2.sinaimg.cn/mw690/0060lm7Tly1fy1q0bwtzsj308w08wmy1.jpg" alt="#" title="【TED演讲】面对海量数据该何去何从"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx3.sinaimg.cn/mw690/0060lm7Tly1fy1q0utdxhj308w08wmxj.jpg" alt="#" title="【TED演讲】一位ted演讲者的噩梦"></div>
                    <div class="waterfall-imgbox waterfall-box"><img src="http://wx3.sinaimg.cn/mw690/0060lm7Tly1fy1q1fe4ukj308w08wwff.jpg" alt="#" title="【TED演讲】ted演讲3分钟"></a>
                    </div>
                </div>

            </div>
            <div class="getMore-line">
                <a href="#">加载更多</a>
            </div>
        </div>
        <footer id="footer">
            <div class="footer-copyright">
                <p>© 安徽信息工程学院<span class="divider">|</span>
                    <a href="#">*******号</a>
                    <span class="divider"> </span>
                     <a href="<%=basePath%>start/backstage/login">后台</a>
                </p>
            </div>
        </footer>

        <div class="user" id="user">
            <div class="user-inner">
                <img src="<%=basePath%>assets/graceful/images/login_logo.png" alt="#" class="login-logo">
                <div class="register">
                    <div class="holder">
                        <div class="mail-login">
                            <form class="layui-form" id="regist" action="a.do" method="post" >
                                <input type="text" name="name" class="text" placeholder="用户名" required="required">
                                <input type="text" name="password"class="password" placeholder="密码" required="required">
                                <input type="text" name="email"class="text" placeholder="邮箱" required="required">
                                <input class="login-up" value="注册" lay-submit="" lay-filter="demo1" style="width:100%;" type="submit" onclick="test()">
                            </form>

                        </div>
                    </div>
                    <div class="switch-login">已有帐号？
                        <a href="#">登录到小白</a>
                    </div>
                </div>
                <div class="login">
                    <div class="holder">
                        <div class="mail-login">
                            <form id="login" action="" method="post" class="layui-form">
                                <input type="text" name="account" class="text" placeholder="账号" required="required">
                                <input type="text"  name="password" class="password" placeholder="密码" required="required">
                                <input type="button" value="登录" onclick="login()" class="login-up">
                            </form>
                        </div>
                        <div class="switch-register clearfix">
                            <a href="#" class="forget">忘记密码»</a>
                            <p class="go-register">还没有小白帐号？
                                <a href="#">点击注册»</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="close"><span></span></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=basePath%>assets/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/graceful/js/script.js"></script>
<script>
</script>
