<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>网吧管理系统</title>
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <link
            href="${pageContext.request.contextPath}/resources/js/metronic/css/style.css"
            rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/js/metronic/css/base.css"
          rel="stylesheet" type="text/css" />
    <link
            href="${pageContext.request.contextPath}/resources/js/metronic/css/login.css"
            rel="stylesheet" type="text/css" />
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/js/metronic/css/jquery.slider.css"
          type="text/css" />




    <script type="text/javascript">
        setTimeout(function(){document.getElementById("password_message").style.display="none";},5000);
        setTimeout(function(){document.getElementById("new_message").style.display="none";},10000);

    </script>

    <style type="text/css">
        body {
            overflow: scroll;
            overflow-x: hidden;
        }
    </style>


</head>
<!-- oncontextmenu="self.event.returnValue=false"  屏蔽右键
 onselectstart="return false"   防止选择复制-->
<body oncontextmenu="self.event.returnValue=false"
      onselectstart="return false">
<div
        style="width: 2100px; height: 100px; background-color: RGB(43, 48, 59)">
    <ul style="margin-left: 40px; padding-top: 30px">
        <li style="display: inline-block;"><h1>
            <a  style="color: white; font-size: 40px;">欢迎来到网吧管理系统</a>
        </h1></li>
        <li style="display: inline-block; margin-left: 120px;"><a
                style="font-size: 14px; color: rgb(130, 130, 130);">用户登陆</a></li>
        <li style="display: inline-block; margin-left: 60px;"><a
                href="javascript:alert('登陆后即可使用本系统');"
                style="font-size: 14px; color: rgb(130, 130, 130);">首页</a></li>
        <li style="display: inline-block; margin-left: 80px;"><a
                href="javascript:alert('本系统只提供管理员和公司管理人员登录系统！！！如若注册此系统，请联系部门负责人下发注册码 ！！！');"
                style="font-size: 14px; color: rgb(130, 130, 130);">帮助与文档</a></li>
        <li style="display: inline-block; margin-left: 64px;"><p
                style="font-size: 14px; color: rgb(130, 130, 130);">客服电话：4008864211</p></li>
    </ul>
</div>
<div id="main" style="width: 2100px; height: 800px; float: left;">

    <div class="container"
         style="background-color: rgb(73, 74, 95); width: 2100px; height: 800px; float: left;">

        <div id="register" class="register"
             style="height: 380px; margin-top: 150px; margin-left: 205px; opacity: 0.9;">
            <div class="title">
                <span style="color: rgb(32, 35, 64);">重新设置密码</span>
                <div style="height: 10px; margin-top: 15px;">
                    <input id="span_id" disabled="disabled" value=""
                           style="background-color: transparent; border: 0; color: red"
                           size="45" />
                </div>
            </div>
            <!--  -->
            <form class="layui-form" action="javascript:;" name="check-form"
                  id="toLoginForm">

                <div class="default" style="margin-top: 40px;">
                    <input data-form="uname" type="text"  lay-verify="required"  class="layui-input"
                           placeholder="请输入账号"
                           id="loginname"
                    />
                </div>
                <div style="height: 10px; margin-top: -10px;">
                    <input id="test" disabled="disabled"
                           style="background-color: transparent; border: 0; color: red" />
                </div>
                <div class="default">
                    <input id="registercode" lay-verify="required" class="layui-input"
                           data-form="upwd" type="password" placeholder="请输入注册码" />
                </div>
                <div style="height: 10px; margin-top: -10px;">
                    <input id="test2" disabled="disabled"
                           style="background-color: transparent; border: 0; color: red" />
                </div>

                <div class="default">
                    <input id="password" lay-verify="required" class="layui-input"
                           data-form="upwd" type="password" placeholder="请输入新密码" />
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block ">
                        <div class="layui-inline">
                        <button type="submit" class="layui-btn"  lay-submit=""
                                lay-filter="btn">立即提交</button>
                        </div>
                        <a  href="javascript:;" onclick="location.href='./loginform.jsp';">
                        <button class="layui-btn" >
                            返回
                        </button>
                        </a>
                    </div>
                </div>
            </form>


            <div id="password_message" style="color: #ff0000; margin-left: 110px;">${message}</div>
            <div id="new_message" style="color: #ff0000; margin-left: 40px;">${new_message}</div>
        </div>
    </div>
</div>
<!-- 底部开始 -->
<div
        style="width: 2100px; height: 100px; background-color: RGB(43, 48, 59); margin-top: 800px;">
    <div align="center"
         style="padding-top: 15px; color: RGB(153, 153, 153);">Copyright
        ©2019</div>
</div>
<!-- 底部结束 -->
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>


    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;

        form.on('submit(btn)', function(data){
            var registercode =document.getElementById("registercode");
            var loginname=document.getElementById("loginname");
            var password =document.getElementById("password");
                $.post({
                    url:"${pageContext.request.contextPath}/ajax/repassword",
                    data:{
                        "registercode":$("#registercode").val(),
                        "username":$("#loginname").val(),
                        "password":$("#password").val()
                    },
                    success: function (data){
                        if(data.toString()==="ok"){
                            layer.msg("修改成功");
                            loginname.value="";
                            registercode.value="";
                            password.value="";

                        }else {
                            layer.alert("输入信息有误，请仔细核对");
                        }
                    }
                })

            return false; //阻止表单跳转
        });
    });




</script>


</body>
</html>