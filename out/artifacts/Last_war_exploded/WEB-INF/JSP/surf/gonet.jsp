
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%--<div class="layui-layout layui-layout-admin">--%>
<%--    <div class="layui-header">--%>
<%--        <div class="layui-logo">网吧管理系统</div>--%>

<%--        <!-- 头部区域（可配合layui已有的水平导航） -->--%>
<%--        <ul class="layui-nav layui-layout-right">--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">--%>
<%--                    ${user}--%>
<%--                </a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">基本资料</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item"><a href="javascript:;" onclick="exit()">注销</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--    <div class="layui-side layui-bg-black">--%>
<%--        <div class="layui-side-scroll">--%>
<%--            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
<%--            <ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
<%--                <li class="layui-nav-item layui-nav-itemed">--%>
<%--                    <a class="" href="javascript:;">权限管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/uservisiter/getall">管理员访问信息</a></dd>--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/admin/getall">管理员列表</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">会员管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/vip/getall">会员列表</a></dd>--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/vip/toaddvip">添加会员</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item"><a href="javascript:;">会员充值</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/vip/toupdatemoney">会员卡充值</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item"><a href="javascript:;">上网记录</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/record/getall">查看所有记录</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>

<%--                <li class="layui-nav-item"><a href="javascript:;">上机管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/surf/getall">会员上机信息</a></dd>--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/record/getall">会员上机</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="layui-body">--%>
        <!-- 内容主体区域 -->
        <span class="layui-breadcrumb"> <a href="${pageContext.request.contextPath}/admin/towelcome">首页</a> <a> <cite>会员上机</cite></a></span>

        <form class="layui-form" action="javascript:;" style="margin-top: 20px" >

            <div class="layui-form-item" >
                <label class="layui-form-label">卡号</label>
                <div class="layui-input-block">
                    <input type="text" id="idnumber" autocomplete="off"
                           placeholder="请输入要充值的卡号" lay-verify="number|required"
                           class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">机号</label>
                <div class="layui-input-block">
                    <input type="text" id="computerid" autocomplete="off"
                           placeholder="请输入机号" lay-verify="number|required"
                           class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn "  lay-submit=""
                            lay-filter="add">立即提交</button>
                </div>
            </div>
        </form>
<%--    </div>--%>

<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        © layui.com - 底部固定区域--%>
<%--    </div>--%>

<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>

    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;

        form.on('submit(add)', function(data){
            var idnumber=document.getElementById("idnumber");
            var computerid=document.getElementById("computerid")
            layer.confirm("你确定要上机吗？", function() {
                $.post({
                    url:"${pageContext.request.contextPath}/ajax/gonet",
                    data:{
                        "idnumber":$("#idnumber").val(),
                        "computerid":$("#computerid").val()
                    },
                    success: function (data){
                        if(data.toString()==="ok"){
                            layer.msg("上机成功");
                            idnumber.value="";
                            computerid.value="";

                        }else if(data.toString()==="exit"){
                            layer.alert("该卡正在上机中");
                            idnumber.value="";
                            computerid.value="";
                        }
                        else if(data.toString()==="novip"){
                            layer.alert("不存在该卡号");
                            idnumber.value="";
                            computerid.value="";
                        }
                        else if(data.toString()==="fail"){
                            layer.alert("该机号已有人使用");
                            idnumber.value="";
                            computerid.value="";
                        }else if(data.toString()==="nomoney"){
                            layer.alert("该卡号余额不足，请充值");
                            idnumber.value="";
                            computerid.value="";
                        }
                        else {
                            layer.alert("信息异常，请重试");
                            idnumber.value="";
                            computerid.value="";
                        }
                    }
                })


            })

            return false; //阻止表单跳转
        });
    });

    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }


</script>
</body>
</html>
