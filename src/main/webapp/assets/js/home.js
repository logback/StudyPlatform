let tab;

let $ul = $("#loop");
//获得ul长度
let ulWidth = $("#loop").width();


//给li定位 起始位置
function positionLi()
{
    $ul.find("li").each(function () {
        let index = $(this).index();
        let left = index * ulWidth ;
        $(this).css({left: left});
    });
}


//轮播
function carousel()
{
    $ul.find("li").each(function () {
        let liIndex = $(this).index();
        let lastLeft = -($ul.find("li").length - liIndex) * ulWidth;
        $(this).animate({left: lastLeft}, 20000, 'linear', function () {
            positionLi();
            carousel();
        });
    });
}


/*
* 获得管理员的身份信息，更换管理员的头像昵称
* */
let imaUrl=" http://localhost:8080/StudyPlatform/assets/images/avatar/";

function getAdmin(){
    $.ajax({
        url:'getAdmin',
        type:"get",
        dataType:"json",
        success:function (data) {
            let info;
            let title;
            let path=data['image'];
            let name=data['name'];
            let url=imaUrl+path;
            info="您好！"+name+"欢迎登录系统!!!";
            title="请叫我"+name.substring(0, 1)+"哥";
             if(name==="aldrich"){
                 info="欢迎意哥登录学习平台!!!";
                 title="请叫我意哥";
             }
            $(".layui-circle").attr("src",url);
            $('#title').text(title);
            $("#photo").attr("src",url);
            $(".li_sty").text(info);
        },
        error:function (data) {
            console.log(data);
            layer.msg("登录失败",{icon:5,time:1000});
        }
    });
}


$(document).ready(function () {

    /*轮播*/
    carousel();

    /*获取管理员信息*/
    getAdmin();

    /*锁屏*/
    function lockPage(){
        layer.open({
            title : false,
            type : 1,
            content : $("#lock-box"),
            closeBtn : 0,
            shade : 0.9
        })
    }

    $(".lockcms").on("click",function(){
        window.sessionStorage.setItem("lockcms",true);
        lockPage();
    });

    // 判断是否显示锁屏
    if(window.sessionStorage.getItem("lockcms") === "true"){
        lockPage();
    }


    // 解锁
    $("#unlock").on("click",function(){
        if($(this).siblings(".admin-header-lock-input").val() === ''){
            layer.msg("请输入解锁密码！");
        }else{
            if($(this).siblings(".admin-header-lock-input").val() === "123456"){
                window.sessionStorage.setItem("lockcms",false);
                $(this).siblings(".admin-header-lock-input").val('');
                layer.closeAll("page");
            }else{
                layer.msg("密码错误，请重新输入！");
            }
        }
    });

    $(document).on('keydown', function() {
        if(event.keyCode === 13) {
            $("#unlock").click();
        }
    });


    //手机设备的简单适配
    let treeMobile = $('.site-tree-mobile'),
        shadeMobile = $('.site-mobile-shade');

    treeMobile.on('click', function(){
        $('body').addClass('site-mobile');
    });

    shadeMobile.on('click', function(){
        $('body').removeClass('site-mobile');
    });

    // 添加新窗口
    $(".layui-nav .layui-nav-item a").on("click",function(){
        addTab($(this));
        $(this).parent("li").siblings().removeClass("layui-nav-itemed");
    });

    //判断是否处于锁屏状态(如果关闭以后则未关闭浏览器之前不再显示)
    if(window.sessionStorage.getItem("lockcms") !== "true" && window.sessionStorage.getItem("showNotice") !== "true"){
        showNotice();
    }




    //刷新后还原打开的窗口
    if(window.sessionStorage.getItem("menu") != null){
        menu = JSON.parse(window.sessionStorage.getItem("menu"));
        curmenu = window.sessionStorage.getItem("curmenu");
        let openTitle = '';
        for(let i=0;i<menu.length;i++){
            openTitle = '';
            if(menu[i].icon.split("-")[0] === 'icon'){
                openTitle += '<i class="iconfont '+menu[i].icon+'"></i>';
            }else{
                openTitle += '<i class="layui-icon">'+menu[i].icon+'</i>';
            }
            openTitle += '<cite>'+menu[i].title+'</cite>';
            openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="'+menu[i].layId+'">&#x1006;</i>';
            element.tabAdd("bodyTab",{
                title : openTitle,
                content :"<iframe src='"+menu[i].href+"' data-id='"+menu[i].layId+"'></frame>",
                id : menu[i].layId
            });
            //定位到刷新前的窗口
            if(curmenu !== "undefined"){
                if(curmenu === '' || curmenu === "null"){  //定位到后台首页
                    element.tabChange("bodyTab",'');
                }else if(JSON.parse(curmenu).title === menu[i].title){  //定位到刷新前的页面
                    element.tabChange("bodyTab",menu[i].layId);
                }
            }else{
                element.tabChange("bodyTab",menu[menu.length-1].layId);
            }
        }
    }
});


(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))

tpwidget("init", {
    "flavor": "slim",
    "location": "WX4FBXXFKE4F",
    "geolocation": "disabled",
    "language": "zh-chs",
    "unit": "c",
    "theme": "chameleon",
    "container": "tp-weather-widget",
    "bubble": "disabled",
    "alarmType": "badge",
    "color": "#FFFFFF",
    "uid": "U9EC08A15F",
    "hash": "14dff75e7253d3a8b9727522759f3455"
});
tpwidget("show");

$(".showNotice").on("click",function(){
    showNotice();
});


//公告层
function showNotice()
{
  layer.open({
            type: 1,
            skin: 'demo-class',
            title: "系统公告", //不显示标题栏
            closeBtn: false,
            area: '330px',
            btnAlign: 'c',
            shade: 0.3,
            id: 'LAY_layuipro', //设定一个id，防止重复弹出
            btn: ['火速围观','残忍拒绝'],
            moveType: 1, //拖拽模式，0或者1
            content: '<div style="padding:15px 20px; text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;background-color: #393D49;" ><p style="color: floralwhite;font-size: 16px">\n'
                +'小白四立级英语学习平台在2018年12月12日正式立项。项目成员主要有五人，组长：Aldrich，组员：；Bond、Alice、Jack、Mark，项目主要作用是为大学生提供学习四，六级的辅助。传统的课程功能不全面，只有较为单一的功能。我们项目的优势在于具用学习、练习以及提高自身英语素质的综合功能，可以为用户提供更舒适和全面的体验。'+
                '</p></div>',
            success: function(layero){
                let btn = layero.find('.layui-layer-btn0');
                btn.css('text-align', 'center');
                btn.on("click",function(){
                    window.sessionStorage.setItem("showNotice","true");
                });

                let btnRefuse = layero.find('.layui-layer-btn1');
                btnRefuse.css('text-align', 'center');
                btnRefuse.on('click',function () {
                    layer.msg("heart break");
                });

                if($(window).width() > 432){  //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
                    btn.on("click",function(){
                        layer.tips('系统公告躲在了这里', '#showNotice', {
                            tips: 3
                        });
                    })
                }
            }
        });
}


//捐赠弹窗
function donation(){
    layer.tab({
        area : ['260px', '367px'],
        tab : [{
            title : "微信",
            content : "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='../images/wechat.jpg'></div>"
        },{
            title : "支付宝",
            content : "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='../images/alipay.jpg'></div>"
        }]
    })
}
