
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
</head>
<body class="layui-layout-body">

        <!-- 内容主体区域 -->

        <div class="x-nav">
		<span class="layui-breadcrumb"> <a href="${pageContext.request.contextPath}/admin/towelcome">首页</a> <a> <cite>会员列表</cite></a>
		</span> <a class="layui-btn layui-btn-small"
                   style="line-height: 1.6em; margin-top: 3px; float: right"
                   href="${pageContext.request.contextPath}/vip/getall" title="刷新">
            <i class="layui-icon" style="line-height: 30px">ဂ</i>
        </a>
        </div>
        <div class="x-body">
            <div class="layui-row  "  style="" align="center">
                <form class="layui-form layui-col-md12 x-so  form-inline "  method="get"
                      action="${pageContext.request.contextPath}/vip/querylist">
                    <div class="layui-input-inline" style="width: 50%">
                    <input type="text" name="realname" style="width: 100%;"
                           placeholder="请输入用户名查找" autocomplete="off" class="layui-input">
                        </div>
                    <button class="layui-btn">
                        <i class="layui-icon">&#xe615;</i>
                    </button>
                    <span style="color: #ff1d11">${msg}</span>
                </form>
            </div>
        <table class="layui-table">
            <thead>
            <tr>
                <th>
                    <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
                </th>
                <!-- <th>ID</th> -->
                <th>序号</th>
                <th>卡号</th>
                <th>余额</th>
                <th>真实姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>地址</th>
                <th>手机号</th>
                <th>创建时间</th>
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="vip" varStatus="stat">
                <tr>
                    <td>
                        <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                    </td>
                    <td>${stat.index+1}</td>
                    <td>${vip.idnumber}</td>
                    <td>${vip.money}</td>
                    <td>${vip.realname }</td>
                    <td>${vip.sex }</td>
                    <td>${vip.age}</td>
                    <td>${vip.address}</td>
                    <td>${vip.phonenumber}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vip.createtime}"/></td>
                    <td class="td-manage">
                            <%--  <a title="编辑"  onclick="x_admin_show('编辑用户信息','${pageContext.request.contextPath}/user/edit?id=${user.id}');" href="javascript:;"> --%>
                        <a title="编辑"  href='${pageContext.request.contextPath}/vip/toupdate?id=${vip.id}'>
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="member_del(this,'${vip.id}')" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

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
<script type="text/javascript">

    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            //等以后再使用异步，这里先使用
            $.get("${pageContext.request.contextPath}/vip/delete?id="+id);
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }

    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }

</script>
</body>
</html>
