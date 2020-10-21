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
                href="${pageContext.request.contextPath}/admin/towelcome1"
                style="font-size: 14px; color: rgb(130, 130, 130);">首页</a></li>
        <li style="display: inline-block; margin-left: 80px;"><a
                href="javascript:alert('本系统只提供管理员和公司管理人员登录系统！！！如若注册此系统，请联系部门负责人下发注册码 ！！！');"
                style="font-size: 14px; color: rgb(130, 130, 130);">帮助与文档</a></li>
        <li style="display: inline-block; margin-left: 64px;"><p
                style="font-size: 14px; color: rgb(130, 130, 130);">客服电话：4008864211</p></li>
    </ul>
</div>
<div id="main" style="width: 1520px; height: 800px;">
    <div class="container"
         style="background-color: rgb(73, 74, 95); width: 1520px; height: 800px; ">
        <%--        <!-- <div  style="background-color:green;width: 1360px;height:610px; float:left;"> -->--%>
        <%--        <!-- 幻灯片 -->--%>
        <div class="layui-carousel" id="test1">
            <div carousel-item>
                <div><img src="/resources/image/3.png" style="width: 100%;height: 100%"></div>
                <div><img src="/resources/image/1.png" style="width: 100%;height: 100%"></div>
                <div><img src="/resources/image/9.png" style="width: 100%;height: 100%"></div>
            </div>
        </div>
        <div id="register" class="register"
             style="height: 300px; margin-top: 150px; margin-left: 305px; opacity: 0.9;">
            <div class="title">
                <span style="color: rgb(32, 35, 64);">系统登录</span>
                <div style="height: 10px; margin-top: 15px;">
                    <input id="span_id" disabled="disabled" value=""
                           style="background-color: transparent; border: 0; color: red"
                           size="45" />
                </div>
            </div>
            <!--  -->
            <form method="post" action="${pageContext.request.contextPath}/admin/login" name="check-form"
                  id="toLoginForm">

                <div class="default" style="margin-top: 40px;">
                    <input data-form="uname" type="text" placeholder="请输入账号"
                           lay-verify="required" class="layui-input"
                           onchange="tocheckLoginname()" id="loginname" name="username"
                           value="123" />
                </div>
                <div style="height: 10px; margin-top: -10px;">
                    <input id="test" disabled="disabled" value=""
                           style="background-color: transparent; border: 0; color: red" />
                </div>
                <div class="default">
                    <input id="password" name="password" value="123456"
                           lay-verify="required" class="layui-input"
                           data-form="upwd" type="password" placeholder="请输入账号密码 " />
                </div>

                <div class="submit" style="margin-top: 12px;">
                    <span class="notice"> <a
                            href="javascript:;" onclick="location.href='../repassword.jsp';">忘记密码</a>
						</span>
                    <input type="submit" id="login-submit-btn" class="s_hover"
                           value="安全登录"   ></input>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 底部开始 -->
<div
        style="width: 1520px; height: 100px; background-color: RGB(43, 48, 59);">
    <div align="center"
         style="padding-top: 15px; color: RGB(153, 153, 153);">Copyright
        ©2019</div>
</div>
<!-- 底部结束 -->
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>
</script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '1520px' //设置容器宽度
            ,height: '100%'
            ,arrow: 'always' //始终显示箭头
        });
    });
</script>


</body>
</html>