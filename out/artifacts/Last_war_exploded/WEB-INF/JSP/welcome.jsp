<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 14456
  Date: 2020/8/23
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body class="layui-layout-body">
            <script type="text/javascript">
                $(function(){
                    $("#nowTime").runTimer();
                })
            </script>

        <div class="x-body layui-anim layui-anim-up">
            <blockquote class="layui-elem-quote">欢迎
                <c:choose>
                <c:when test="${sessionScope.user1==1}"><font color="red">管理员:</font></c:when>
                <c:otherwise><font color="green">用户:</font> </c:otherwise>
                </c:choose>
                <span class="x-red">${sessionScope.user}</span>登录系统！当前时间:<span id="nowTime"></span></blockquote>

            <fieldset class="layui-elem-field">
                <legend>系统通知</legend>
                <div class="layui-field-box">
                    <table class="layui-table" lay-skin="line">
                        <tbody>
                        <tr>
                            <td >
                                <a class="x-a" href="/loginform.jsp" target="_blank">网吧管理平台上线了!!!</a>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field">
                <legend>系统信息</legend>
                <div class="layui-field-box">
                    <table class="layui-table">
                        <tbody>

                        <tr>
                            <th>系统版本</th>
                            <td>2019-03.0.1</td></tr>
                        <tr>
                            <th>服务器地址</th>
                            <td>本机服务</td></tr>
                        <tr>
                            <th>操作系统</th>
                            <td>WINDOWS10</td></tr>
                        <tr>
                            <th>运行环境</th>
                            <td>Apache/Tomcat v8.5 (Win64) JDK1.8.0_131</td></tr>

                        <tr>
                            <th>MYSQL版本</th>
                            <td>5.7.21</td></tr>

                        <tr>
                            <th>上传附件限制</th>
                            <td>2M</td></tr>
                        <tr>
                            <th>执行时间限制</th>
                            <td>30s</td></tr>
                        <tr>
                            <th>剩余空间</th>
                            <td>86015.2M</td></tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field">
                <legend>开发团队</legend>
                <div class="layui-field-box">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>卡卡西</td>
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td>卡卡西</td></tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <blockquote class="layui-elem-quote layui-quote-nm">感谢XXX老师的指导！</blockquote>
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

<script>

    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }

</script>
</body>
</html>
