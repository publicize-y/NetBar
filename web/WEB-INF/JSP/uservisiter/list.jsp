
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <script type="text/javascript"src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet"
          href="https
://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">


    <script
            src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

</head>
<body class="layui-layout-body">
        <!-- 内容主体区域 -->
        <div class="x-nav">
		<span class="layui-breadcrumb"> <a href="${pageContext.request.contextPath}/admin/towelcome">首页</a> <a> <cite>访问用户信息</cite></a></span>
        <a class="layui-btn layui-btn-small"
                   style="line-height: 1.6em; margin-top: 3px; float: right"
                   href="${pageContext.request.contextPath}/uservisiter/getall" title="刷新">
         <i class="layui-icon" style="line-height: 30px">ဂ</i>
        </a>
        </div>
        <div class="x-body">
            <div class="layui-row"  style="" align="center">

                <form class="layui-form  x-so"  method="get"
                      action="${pageContext.request.contextPath}/uservisiter/querylist">
                    <div class="layui-input-inline" style="width: 50%">
                    <input type="text" name="username" style="width: 100%;"
                           placeholder="请输入用户名查找" autocomplete="off" class="layui-input">
                    </div>
                    <button class="layui-btn">
                        <i class="layui-icon">&#xe615;</i>
                    </button>
                    <span style="color: red">${msg}</span>
                </form>
            </div>

        <table class="layui-table">
            <thead>
            <tr>
                <th>
                    <div class="layui-unselect header layui-form-checkbox"
                         lay-skin="primary">
                        <i class="layui-icon">&#xe605;</i>
                    </div>
                </th>
                <th>ID</th>
                <th>登录用户</th>
                <th>登录时间</th>
                <th>退出时间</th>
                <th>访客IP</th>
                <!-- <th>老铁地址</th> -->
                <th>用户设备</th>
                <th>浏览器</th>
                <th>操作系统</th>
                <th>版本</th>
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach var="user" items="${list}" >
                <tr>
                    <td>
                        <div class="layui-unselect layui-form-checkbox"
                             lay-skin="primary" data-id='2'>
                            <i class="layui-icon">&#xe605;</i>
                        </div>
                    </td>
                    <td>${user.id}</td>
                    <td>${user.loginname }</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.login_time}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.exit_time}"/></td>
                    <td>${user.visit_ip }</td>
                    <td>${user.iphone }</td>
                    <td>${user.browser }</td>
                    <td>${user.system }</td>
                    <td>${user.version }</td>
                    <td class="td-manage">
                    <a title="删除" onclick="member_del(this,'${user.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
            <p>当前表格共${page.pages}页、${page.total}条记录</p>
<%--            <c:if test="${page.isFirstPage==true}">--%>
<%--                <button class="btn btn-default btn-info disabled">首页</button>--%>
<%--                <button class="btn btn-default btn-info disabled">上一页</button>--%>
<%--            </c:if>--%>
<%--            <c:if test="${page.isFirstPage!=true}">--%>
<%--                <a href="<%=request.getContextPath()%>/uservisiter/getall?pageNo=${page.firstPage}" class="btn btn-default btn-info">首页</a>--%>
<%--                <a href="<%=request.getContextPath()%>uservisiter/getall?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>--%>
<%--            </c:if>--%>
<%--            <c:if test="${page.isLastPage==true}">--%>
<%--                <button class="btn btn-default btn-info disabled">下一页</button>--%>
<%--                <button class="btn btn-default btn-info disabled">尾页</button>--%>
<%--            </c:if>--%>
<%--            <c:if test="${page.isLastPage!=true}">--%>
<%--                <a href="<%=request.getContextPath()%>/uservisiter/getall?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>--%>
<%--                <a href="<%=request.getContextPath()%>/uservisiter/getall?pageNo=${page.lastPage}" class="btn btn-default btn-info">尾页</a>--%>
<%--            </c:if>--%>
            <nav aria-label="Page navigation" >
                <ul class="pagination">
                    <li>
                        <a href="<%=request.getContextPath()%>/uservisiter/getall?page=${page.firstPage}" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <c:forEach var="s" begin="1" end="${page.pages}">
                        <li><a href="<%=request.getContextPath()%>/uservisiter/getall?page=${s}">${s}</a></li>
                    </c:forEach>
                    <li>
                        <a href="<%=request.getContextPath()%>/uservisiter/getall?page=${page.lastPage}" aria-label="Next">
                            <span aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </nav>




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
            $.get("${pageContext.request.contextPath}/uservisiter/delete?id="+id);
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
