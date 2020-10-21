
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script >
        function a (){
            $.get({
                url:"${pageContext.request.contextPath}/ajax/checkvippassword",
                data:{
                    "pwd":$("#pwd").val(),
                    "id":$("#id").val()
                },
                success: function (data){
                    if(data.toString()==="ok"){

                    }else {
                        layer.msg("error");
                        layer.msg("旧密码错误，请重新输入");
                        var pwd=document.getElementById("pwd");
                        pwd.value="";
                    }


                }



            })

        }
        function  b(){


        }
    </script>
</head>
<body class="layui-layout-body">

<!-- 内容主体区域 -->
<span class="layui-breadcrumb"> <a>首页</a> <a> <cite>修改密码</cite></a></span>

<form class="layui-form" action="javascript:;" style="margin-top: 20px" >

    <div class="layui-form-item" >
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-block">
            <input type="hidden"  id="id" value="${vip.id}">
            <input type="password" id="pwd" autocomplete="off"
                   placeholder="请输入旧密码" lay-verify="required"
                   class="layui-input" onblur="a()">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="password" id="pwd1"  required autocomplete="off"
                   lay-verify="required"   placeholder="请输入新密码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">请确认</label>
        <div class="layui-input-block">
            <input type="password"  id="pwd2" lay-verify="required" autocomplete="off"
                   placeholder="请输入新密码" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit=""
                    lay-filter="add">立即提交</button>
        </div>
    </div>
</form>



<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>

    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;

        form.on('submit(add)', function(id){
            var pwd0 =document.getElementById("pwd");
            var pwd=document.getElementById("pwd1");
            var pwd1=document.getElementById("pwd2");

            if (pwd.value!=pwd1.value)
            {
                layer.alert('两次密码不一致，请重新输入', {icon: 6});
                pwd1.value="";
                pwd.value="";
            }
            else {
                $.get({
                    url:"${pageContext.request.contextPath}/ajax/updatevippassword",
                    data:{
                        "pwd1":$("#pwd1").val(),
                        "id":$("#id").val()
                    },
                    success: function (data){
                        if(data.toString()==="ok"){
                            layer.msg("修改成功")
                            pwd0.value="";
                            pwd1.value="";
                            pwd.value="";

                        }else {
                            layer.msg("error");

                        }


                    }



                })
            }

            return false; //阻止表单跳转
        });
    });
    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }


</script>
</body>
</html>
