/*let location = (window.location+'').split('/');
let basePath = location[0]+'//'+location[2]+'/'+location[3];
let url = basePath + '/assets/js/';*/
/*
* 注册事件
* */
$('#register').click(function () {
    parent.layer.open({
        title:'注册个人信息',
        skin:'layui-layer-molv',
        type: 2,
        area: ['550px', '650px'],
        content: 'http://localhost:8080/StudyPlatform/start/backstage/register'
    });
});

/*
* form表单登录
* */
layui.use(['layer','laydate','form'],function() {
    let layer = layui.layer,
        form = layui.form;

    /**
     * 通用表单验证
     */
    form.verify({
        account: function(value, item){ //value：表单的值、item：表单的DOM对象
            if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                return '账号不能有特殊字符';
            }
            if(/(^\_)|(\__)|(\_+$)/.test(value)){
                return '账号首尾不能出现下划线\'_\'';
            }
            if(/[\u4E00-\u9FA5]/g.test(value)){
                return '账号不能有中文';
            }
            if(value.length!==11)
            {
                return '账号必须11位，只能是数字！';
            }
        },
        pwd:[ /^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']
    });


    /*
    * form表单登录
    * */
    layui.use(['layer','laydate','form'],function() {
        let layer = layui.layer,
            form = layui.form;

        /**
         * 通用表单验证
         */
        form.verify({
            account: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '账号不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '账号首尾不能出现下划线\'_\'';
                }
                if(/[\u4E00-\u9FA5]/g.test(value)){
                    return '账号不能有中文';
                }
                if(value.length!==11)
                {
                    return '账号必须11位，只能是数字！';
                }
            },
            pwd:[ /^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            $.ajax({
                url:'enter',
                type: data.form.method,
                data: $(data.form).serialize(),
                beforeSend:function(XMLHttpRequest)
                {
                    layer.load(1,{
                        icon: 1, // 0~2 ,0比较好看
                        // 黑色透明度0.5背景
                    });
                },
                success: function (result) {
                    if(result.code===0)
                    {
                        layer.closeAll();
                        layer.msg("登录成功！",{icon:6,time:4000});
                        window.location.href="main";
                    }else if(result.code===1)
                    {
                        layer.closeAll();
                        layer.msg('用户名或密码错误',{icon:5,time: 3000});
                        $("#account").val("");
                        $("#pwd").val("");
                    }
                },
                error:function () {
                    layer.msg('发生错误',{icon:5,time: 1000});
                    $("#account").val("");
                    $("#pwd").val("");
                }
            });
            return false;
        });
    });

});

