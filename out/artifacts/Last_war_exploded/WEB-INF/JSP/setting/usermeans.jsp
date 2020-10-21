<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 14456
  Date: 2020/8/23
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fkjava_timer.js"></script>

</head>
<body>

<div class="x-body layui-anim layui-anim-up">
    <fieldset class="layui-elem-field">
        <legend>${sessionScope.user}的信息</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>个人名称</th>
                    <td>${sessionScope.user2.realname}</td></tr>
                <tr>
                    <th>性别</th>
                    <td>${sessionScope.user2.sex}</td></tr>
                <tr>
                    <th>年龄</th>
                    <td>${sessionScope.user2.age}</td></tr>
                <c:if test="${sessionScope.user1==0}">
                    <tr>
                        <th>地址</th>
                        <td>${sessionScope.user2.address}</td></tr>
                    <tr>
                        <th>余额</th>
                        <td>${sessionScope.user2.money}</td></tr>
                    <tr>
                        <th>预留电话号</th>
                        <td>${sessionScope.user2.phonenumber}</td></tr>
                </c:if>
                <tr>
                    <th>注册时间</th>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sessionScope.user2.createtime}"/></td></tr>
                </tbody>
            </table>
        </div>
    </fieldset>

</div>
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;


    });
</script>

</body>
</html>
