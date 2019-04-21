

$(document).ready(function () {
    //获取管理员信息
    getAdmin();

    /*轮播*/
    carousel();

});
//图片网址
let imaUrl="https://aldrich.oss-cn-beijing.aliyuncs.com/image/StudyPlatform/avatar/";
//管理员姓名
let userName=$(".li_sty");
let $ul = $("#loop");
//获得ul长度
let ulWidth = $("#loop").width();


//获取管理员信息
function getAdmin(){
    $.ajax({
        url:'getAdmin',
        type:"get",
        dataType:"json",
        success:function (data) {
            console.log(data);
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
            $(".layui-nav-img userAvatar").attr("src",url);
            $('.adminName').text(title);
            $(".userAvatar").attr("src",url);
            userName.empty();
            userName.text(info);
        },
        error:function (data) {
            console.log(data);
            layer.msg("登录失败",{icon:5,time:1000});
        }
    });
}

//给li定位 起始位置
function positionLi()
{
    $ul.find(".li_sty").each(function () {
        let index = $(this).index();
        let left = index * ulWidth ;
        $(this).css({left: left});
    });
}

//轮播
function carousel()
{
    $ul.find(".li_sty").each(function () {
        let liIndex = $(this).index();
        let lastLeft = -($ul.find("li").length - liIndex) * ulWidth;
        $(this).animate({left: lastLeft}, 20000, 'linear', function () {
            positionLi();
            carousel();
        });
    });
}

//捐赠弹窗
function donation(){
    layer.tab({
        area : ['260px', '367px'],
        tab : [{
            title : "微信",
            content : "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='images/wechat.jpg'></div>"
        },{
            title : "支付宝",
            content : "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='images/alipay.jpg'></div>"
        }]
    })
}

//图片管理弹窗
function showImg(){
    $.getJSON('json/images.json', function(json){
        var res = json;
        layer.photos({
            photos: res,
            anim: 5
        });
    });
}

//
function loginOut()
{
        layer.confirm('真的退出么?',
            {btn: ['确定', '取消'],
                title:"提示",skin: 'layui-layer-molv',btnAlign: 'c'},
            function(index) {
                layer.close(index);
                window.location.href="login";
            });

}

//通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
function getData(json){
    $.getJSON(tab.tabConfig.url,function(data){
        if(json === "memberCenter"){
            dataStr = data.memberCenter;
            //重新渲染左侧菜单
            tab.render();
        }else if(json === "authorityManagement"){
            dataStr = data.authorityManagement;
            //重新渲染左侧菜单
            tab.render();
        }else if(json === "ThesaurusManagement"){
            dataStr = data.ThesaurusManagement;
            //重新渲染左侧菜单
            tab.render();
        }else if(json === "OtherBusiness"){
            dataStr = data.OtherBusiness;
            //重新渲染左侧菜单
            tab.render();
        }
    })
}


//清除缓存
$(".clearCache").click(function(){
    window.sessionStorage.clear();
    window.localStorage.clear();
    var index = layer.msg('清除缓存中，请稍候',{icon: 16,time:false,shade:0.8});
    setTimeout(function(){
        layer.close(index);
        layer.msg("缓存清除成功！");
    },1000);
});

//刷新后还原打开的窗口
if(cacheStr == "true") {
    if (window.sessionStorage.getItem("menu") != null) {
        menu = JSON.parse(window.sessionStorage.getItem("menu"));
        curmenu = window.sessionStorage.getItem("curmenu");
        var openTitle = '';
        for (var i = 0; i < menu.length; i++) {
            openTitle = '';
            if (menu[i].icon) {
                if (menu[i].icon.split("-")[0] == 'icon') {
                    openTitle += '<i class="seraph ' + menu[i].icon + '"></i>';
                } else {
                    openTitle += '<i class="layui-icon">' + menu[i].icon + '</i>';
                }
            }
            openTitle += '<cite>' + menu[i].title + '</cite>';
            openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
            element.tabAdd("bodyTab", {
                title: openTitle,
                content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "'></frame>",
                id: menu[i].layId
            })
            //定位到刷新前的窗口
            if (curmenu != "undefined") {
                if (curmenu == '' || curmenu == "null") {  //定位到后台首页
                    element.tabChange("bodyTab", '');
                } else if (JSON.parse(curmenu).title == menu[i].title) {  //定位到刷新前的页面
                    element.tabChange("bodyTab", menu[i].layId);
                }
            } else {
                element.tabChange("bodyTab", menu[menu.length - 1].layId);
            }
        }
        //渲染顶部窗口
        tab.tabMove();
    }
}else{
    window.sessionStorage.removeItem("menu");
    window.sessionStorage.removeItem("curmenu");
}

//手机设备的简单适配
$('.site-tree-mobile').on('click', function(){
    $('body').addClass('site-mobile');
});
$('.site-mobile-shade').on('click', function(){
    $('body').removeClass('site-mobile');
});

//隐藏左侧导航
$(".hideMenu").click(function(){
    if($(".topLevelMenus li.layui-this a").data("url")){
        layer.msg("此栏目状态下左侧菜单不可展开");  //主要为了避免左侧显示的内容与顶部菜单不匹配
        return false;
    }
    $(".layui-layout-admin").toggleClass("showMenu");
    //渲染顶部窗口
    tab.tabMove();
});

