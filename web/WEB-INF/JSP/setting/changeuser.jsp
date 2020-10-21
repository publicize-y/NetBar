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
<body>
<form class="layui-form" action="javascript:;" style="margin-top: 20px">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入账号" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="changeuser">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">取消</button>
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>

    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;

        form.on('submit(changeuser)', function(){


        })
    })

</script>
</body>
</html>