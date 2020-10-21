
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
        $(function(){
            $("#deptForm").submit(function(){
                var money = $("#money");
                var password = $("#password");
                var msg = "";
                if (!/^\d{1,}$/.test($.trim(money.val()))){
                    msg = "余额必须为数字";
                    money.focus();
                }
                else if (!/^.{6,18}$/.test($.trim(password.val()))){
                    msg = "密码必须为6-18位";
                    password.focus();
                }
                if (msg != ""){
                    layer.alert(msg)

                    return false;
                }else{
                    return true;
                    $("#deptForm").submit();
                }
            });
        });

    </script>
</head>
<body class="layui-layout-body">
        <div class="x-body">
            <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/vip/updatevip">
                <input type="hidden" name="id" id="id" value="${Vip.id}" >
                <input type="hidden" name="id" id="id" value="${Vip.createtime}" >
                <%-- <input type="hidden" name="email" id="email" value="${user.email }" > --%>
                <div class="layui-form-item">
                    <label for="idnumber" class="layui-form-label">
                        <span class="x-red">*</span>卡号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="idnumber" name="idnumber" readonly="readonly" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.idnumber}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="money" class="layui-form-label">
                        <span class="x-red">*</span>余额
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="money" name="money" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.money}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="password" class="layui-form-label">
                        <span class="x-red">*</span>密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="password" name="password" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.password }">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="realname" class="layui-form-label">
                        <span class="x-red">*</span>真实姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="realname" name="realname" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.realname }">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="sex" class="layui-form-label">
                        <span class="x-red">*</span>性别
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="sex" name="sex" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.sex }">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="age" class="layui-form-label">
                        <span class="x-red">*</span>年龄
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="age" name="age" required="number" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.age}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="address" class="layui-form-label">
                        <span class="x-red">*</span>地址
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="address" name="address" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.address }">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="phonenumber" class="layui-form-label">
                        <span class="x-red">*</span>手机号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="phonenumber" name="phonenumber" required="phone" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${Vip.phonenumber }">
                    </div>
                </div>


                <div class="layui-form-item">
                    <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>
                    <div style="color:red">${message}</div>
                </div>
            </form>
        </div>

        <!-- 内容主体区域 -->
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>

    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;
    });

    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }
</script>
<script>
    //监听提交
    form.on('submit(add)', function(data){
        console.log(data);
        //发异步，把数据提交给php
        layer.alert("修改成功", {icon: 6},function () {
            document.getElementById('deptForm').submit();
        });
        return false;
    });
</script>
</body>
</html>
