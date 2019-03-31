let path = (window.location+'').split('/');
let basePath = path[0]+'//'+path[2]+'/'+path[3];

let imaUrl=" http://localhost:8080/EnglishSystem/assets/images/2018/12/";


layui.use(['layer','upload','form'], function() {
    let layer = layui.layer,
        form = layui.form,
        upload = layui.upload,
        laydate = layui.laydate;

     /*
     *修改-日历加载
     * */
    laydate.render({
        elem: '#time'
        ,theme: 'molv'
        ,type: 'datetime'
    });



    /**表单验证* */
    form.verify({
        name: function (value) {
            if (value.length < 3) {
                return '请输入至少3位的用户名';
            }
            if (value.length > 7) {
                return '请输入少于7位的用户名';
            }
            if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                return '用户名不能有特殊字符';
            }
            if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                return '用户名首尾不能出现下划线\'_\'';
            }
            if (/^\d+\d+\d$/.test(value)) {
                return '用户名不能全为数字';
            }
        },
        pwd: [/^[\S]{6,12}$/
            , '密码必须6到12位，且不能出现空格']
    });


     /*
     * 保存-上传照片
     * */
    let uploadInst = upload.render({
        elem: '#upload1' //绑定元素
        ,url: basePath+'/admin/upload/img' //上传接口
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
      * 保存数据
      * */
    form.on('submit(demo1)', function (data) {
        $.ajax({
            type: 'POST',
            url:basePath+'/admin/submit/data',
            dataType:"json",
            data: $(data.form).serialize(),
            // beforeSend:function(XMLHttpRequest)
            // {
            //     layer.load(1,{
            //         icon: 1, // 0~2 ,0比较好看
            //         // 黑色透明度0.5背景
            //     });
            // },
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
                    layer.close();
                }
                if(decide===2)
                {
                    layer.msg('邮箱已存在', {icon: 2, time: 3000});
                    layer.close();
                }
                if(decide===1)
                {
                    layer.msg('保存成功', {icon: 1, time: 3000});
                    setTimeout(function () {
                        let index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    },3000);
                }
            },
            error: function () {
                layer.msg('保存失败！', {icon: 2, time: 1000});
            }
        });
        return false;
    });

});