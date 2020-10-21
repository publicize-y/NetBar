
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
        <span class="layui-breadcrumb">
        <a href="${pageContext.request.contextPath}/admin/towelcome">首页</a>
        <a>
          <cite>上网信息</cite></a>
      </span>
        </div>
        <table class="layui-table">
            <thead>
            <tr>
                <th>卡号</th>
                <th>真实姓名</th>
                <th>上机时间</th>
                <th>下机时间</th>
                <th>余额</th>
                <th>机号</th>
                <th>状态</th>
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="surf" varStatus="stat">
                <tr>
                    <td>${surf.idnumber}</td>
                    <td>${surf.realname }</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${surf.createtime}"/></td>
                    <td><fmt:formatDate value="${surf.exittime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${surf.money}</td>
                    <td>${surf.computerid}</td>
                    <td>${surf.condition}</td>
                    <td class="td-manage">
                        <a title="充值"  href='javascript:;' onclick="addmoney(this,'${surf.id}')">
                            充值
                        </a>
                        <a title="下机" onclick="out_net(this,'${surf.id}')" href='javascript:;'>
                            下机
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

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

    function out_net(obj,id){
        layer.confirm('确认要下机吗？',function(index){
            //发异步删除数据
            //等以后再使用异步，这里先使用
            $(obj).parents("tr").remove();
            $.get({

              url : "${pageContext.request.contextPath}/ajax/outnet?id="+id,

               success :function (data){

                  if(data.toString()==="ok"){
                      layer.msg('下机成功!',{icon:1,time:1000});
                  }else if(data.toString()==="nomoney"){

                      layer.alert("你已经欠费，请缴费！")
                  }
                  else {
                      layer.alert("信息异常")
                  }

               }

            });

        });
    }
    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }

    function addmoney(obj,id){

        layer.open({
            type: 2,
            title: '充值页面',
            maxmin: true,
            skin: 'layui-layer-lan',
            shadeClose: true, //点击遮罩关闭层
            area : ['400px' , '280px'],
            content:'${pageContext.request.contextPath}/other/addmoney'//弹框显示的url,对应的页面
        });
    }

</script>
</body>
</html>
