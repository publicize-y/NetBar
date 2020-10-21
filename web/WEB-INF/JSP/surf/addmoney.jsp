
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
<!-- 内容主体区域 -->
<span class="layui-breadcrumb"><a> <cite>会员卡充值</cite></a></span>

<form class="layui-form" action="javascript:;" style="margin-top: 20px" >

    <div class="layui-form-item" >
        <label class="layui-form-label">卡号</label>
        <div class="layui-input-block">
            <input type="text" id="idnumber" autocomplete="off"
                   placeholder="请输入要充值的卡号" lay-verify="number|required"
                   class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">充值金额</label>
        <div class="layui-input-block">
            <input type="text" id="money"  required autocomplete="off"
                   lay-verify="number|required"   placeholder="请输入充值金额" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn "  lay-submit=""
                    lay-filter="add">立即提交</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>

    //JavaScript代码区域
    layui.use(['element','layer','layedit', 'form'], function(){
        var element = layui.element;
        var  layer =layui.layer;
        var form =layui.form;

        form.on('submit(add)', function(data){
            var money =document.getElementById("money");
            var idnumber=document.getElementById("idnumber");
            layer.confirm("你确定要充值吗？", function() {


                $.post({
                    url:"${pageContext.request.contextPath}/ajax/updatemoney",
                    data:{
                        "money":$("#money").val(),
                        "idnumber":$("#idnumber").val()
                    },
                    success: function (data){
                        if(data.toString()==="ok"){
                            layer.msg("充值成功");
                            money.value="";
                            idnumber.value="";
                        }else {
                            layer.alert("不存在该卡号");
                            money.value="";
                            idnumber.value="";
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
