
let path = (window.location+'').split('/');
let basePath = path[0]+'//'+path[2]+'/'+path[3];
let url;
let imaUrl=" http://localhost:8080/StudyPlatform/assets/images/avatar/";
/*url=basePath+"/start/backstage/getAdmin";*/
url=basePath+"/admin/getAdmin";

let sign ="${sessionScope.sign}";

/*获取管理员详细信息*/
function getAdmin()
{
    $.ajax({
        url:url,
        dataType:"json",
        type:"get",
        success:function (data) {
            let name = data['name'];
            let role = data['role'];
            let time = data['time'];
            let path =imaUrl+data['image'];
            let email     = data['email'];
            let authorize = data['state'];
            let account   = data['account'];

             if(role==="1001"){
                 $('#role').text("超级管理员");
             }
            if(role==="1002"){
                $('#role').text("系统管理员");
            }
            if(role==="1003"){
                $('#role').text("小白管理员");
            }

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
            $('#update input[name="role"]').each(function(){
                if($(this).val()===role)
                {
                    $(this).prop("checked",true);

                }
            });

        },
        error:function () {
            layer.msg("发生错误",{icon:5,time:3000});
        }
    })
}


$(document).ready(function () {


    layui.use(['layer','upload','form','laydate','element'], function(){
        let layer = layui.layer,
            form = layui.form,
            upload = layui.upload,
            laydate = layui.laydate,
            element = layui.element;

        getAdmin();

        form.render();
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
            ,url: 'upload/img' //上传接口
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
            ,url: 'upload/img' //上传接口
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
                url:'submit/data',
                /*dataType: 'json',
                data: data.field,//往后台发送的是data.field，即一个{name：value}的数据结构*/
                data: $(data.form).serialize(),
                success: function (result) {
                    let decide = result.code;
                    if(decide===0)
                    {
                        layer.msg('账号已存在', {icon: 2, time: 3000});
                        layer.close();
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
                url:'submit/update',
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
});