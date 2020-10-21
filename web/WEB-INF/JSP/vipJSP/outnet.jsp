
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
    <style>

        body{

            background-image:url('/resources/image/1.png');
        }


    </style>
</head>
<body class="layui-layout-body">
<!-- 内容主体区域 -->
<%--                <a title="下机" onclick="out_net(this,'${surfInfo.idnumber}')" href='javascript:;'>--%>
<%--                    下机--%>
<%--                </a>--%>


    <div style="float:right ;">
        <button type="button" style="margin-top: 300%" class="layui-btn" onclick="out_net(this,'${surfInfo.idnumber}')">一键下机</button>
<%--            <select name="QueryType" onChange="doSelect()">--%>
<%--            <option value="ByCustomer">根据客户信息查询</option>--%>
<%--            <option value="ByCompanyCustomer"> 根据公司信息查询</option>--%>
<%--            <option value="ByBusiness">根据业务信息查询</option>--%>
<%--            </select>--%>

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

    function out_net(obj,idnumber){
        layer.confirm('确认要下机吗？',function(index){
            //发异步删除数据
            //等以后再使用异步，这里先使用
            $(obj).parents("tr").remove();
            $.get({

                url : "${pageContext.request.contextPath}/ajax/outnetbyvip?idnumber="+idnumber,

                success :function (data){

                    if(data.toString()==="ok"){
                        layer.msg('下机成功!',{icon:1,time:1000});
                    }else if(data.toString()==="nomoney"){

                        layer.alert("你已经欠费，请去前台结账！")
                    }
                    else {
                        layer.alert("你尚未上机！不能下机")
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

</script>
</body>
</html>
