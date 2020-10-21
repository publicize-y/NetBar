
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script type="text/javascript">
        $(function (){
            let constraints = {
                video: {width: 500, height: 500},
                audio: true
            };
            /*
            这里介绍新的方法:H5新媒体接口 navigator.mediaDevices.getUserMedia()
            这个方法会提示用户是否允许媒体输入,(媒体输入主要包括相机,视频采集设备,屏幕共享服务,麦克风,A/D转换器等)
            返回的是一个Promise对象。
            如果用户同意使用权限,则会将 MediaStream对象作为resolve()的参数传给then()
            如果用户拒绝使用权限,或者请求的媒体资源不可用,则会将 PermissionDeniedError作为reject()的参数传给catch()
            */
            let promise = navigator.mediaDevices.getUserMedia(constraints);
            promise.then(function (MediaStream) {
                video.srcObject = MediaStream;
                video.play();
            }).catch(function (PermissionDeniedError) {
                console.log(PermissionDeniedError);
            })

        })
    </script>

</head>
<body >
        <span class="layui-breadcrumb"> <a href="${pageContext.request.contextPath}/admin/towelcome">首页</a> <a> <cite>添加会员</cite></a></span>
        <!-- 内容主体区域 -->
        <form class="layui-form" method="post" id="deptForm" action="javascript:;" style="margin-top: 20px" >
<%--            <input type="button" title="开启摄像头" value="开启摄像头" onclick="getMedia()" />--%>
            <video id="video" width="500px" height="500px" autoplay="autoplay"></video>
            <canvas id="canvas" width="500px" height="500px" style="width:200px;height:200px;position:absolute;left:100%"></canvas>
<%--            <button id="snap" onclick="takePhoto()">拍照</button>--%>

            <div class="layui-form-item" >
                <label class="layui-form-label">卡号</label>
                <div class="layui-input-block">

                    <input type="text"  id="idnumber" name="idnumber"  autocomplete="off"
                           placeholder="请输入卡号"  lay-verify="required"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password"  id="password" name="password" autocomplete="off"
                           placeholder="请输入密码" lay-verify="required" lay-reqtext="没密码你怎么登录"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" id="realname" name="realname" autocomplete="off"
                           placeholder="请输入真实姓名" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex"  value="男" title="男" checked>
                    <input type="radio" name="sex"  value="女" title="女" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-block">
                    <input type="text"  id="age" name="age" autocomplete="off"
                           placeholder="请输入年龄" lay-verify="required" lay-reqtext="贵庚？"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">家庭地址</label>
                <div class="layui-input-block">
                    <input type="text" id="address" name="address" autocomplete="off"
                           placeholder="请输入家庭地址" lay-verify="required"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-block">
                    <input type="text"  name="phonenumber" id="phonenumber" required autocomplete="off"
                           lay-verify="required|phone"   placeholder="请输入联系方式" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn "  lay-submit=""
                            lay-filter="add">立即提交</button>
                </div>
            </div>
        </form>
        <!-- 内容主体区域 -->
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;
        form.on('submit(add)', function(){
            let canvas = document.getElementById("canvas");
            let ctx = canvas.getContext('2d');
             ctx.drawImage(video, 0, 0, 500, 500);
            var saveImg=canvas.toDataURL("image/png");
            var sex = document.getElementsByName("sex");
            for(var i=0;i<sex.length;i++) {
                if (sex[i].checked) {
                    sex = sex[i].value
                }
            }
            var vip={
                "idnumber" : $("#idnumber").val(),
                "password" : $("#password").val(),
                "realname" : $("#realname").val(),
                "age" : $("#age").val(),
                "sex" : sex,
                "address" : $("#address").val(),
                "phonenumber" : $("#phonenumber").val(),
                "facecode" : saveImg
            }
            layer.confirm("你确定要添加会员吗？", function() {
                $.post({
                    async: false,
                    dataType:'text',
                    url:"${pageContext.request.contextPath}/ajax/addvip",
                    data:{
                        vip:JSON.stringify(vip)
                    },
                    success: function (data){
                        console.log(data)
                        if(data.toString()==="ok"){
                            layer.msg("添加成功");
                        }else if(data.toString()==="re"){
                            layer.alert("人脸重复，请重新尝试");
                        }
                        else if(data.toString()==="same"){
                            layer.alert("账号重复，添加失败");
                        }else {
                            layer.alert("信息异常，添加失败");
                        }
                    }
                })


            })
            return false; //阻止表单跳转
        });

    });

    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }



    //获得video摄像头区域
    let video = document.getElementById("video");
    function getMedia() {
        let constraints = {
            video: {width: 500, height: 500},
            audio: true
        };
        /*
        这里介绍新的方法:H5新媒体接口 navigator.mediaDevices.getUserMedia()
        这个方法会提示用户是否允许媒体输入,(媒体输入主要包括相机,视频采集设备,屏幕共享服务,麦克风,A/D转换器等)
        返回的是一个Promise对象。
        如果用户同意使用权限,则会将 MediaStream对象作为resolve()的参数传给then()
        如果用户拒绝使用权限,或者请求的媒体资源不可用,则会将 PermissionDeniedError作为reject()的参数传给catch()
        */
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then(function (MediaStream) {
            video.srcObject = MediaStream;
            video.play();
        }).catch(function (PermissionDeniedError) {
            console.log(PermissionDeniedError);
        })
    }
    function takePhoto() {
        //获得Canvas对象
        let canvas = document.getElementById("canvas");
        let ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0, 500, 500);
        var saveImg=canvas.toDataURL("image/png");
        document.write("<form action=${pageContext.request.contextPath}/other/addface method=post name=form1 style='display:none'>");
        document.write("<input type=hidden name=img value='"+saveImg+"'");
        document.write("</from>")
        document.form1.submit();
    }



</script>


</body>
</html>
