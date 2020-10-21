<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <script type="text/javascript">
        $(function (){

            var n1 ="${sessionScope.user1}";
           if(n1=="1"){
               $('#userinfo').css("display","none");
           }else {
               $('#root').css("display","none");
               $('#managegonet').css("display","none");
               $('#managevip').css("display","none");
               $('#vipaddmoney').css("display","none");
               $('#netrecord').css("display","none");
               $('#firstpage').css("display","block");
               $('#userinfo').css("display","block");

           }
        })
    </script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <script type="text/javascript">
        $(function(){
            $("#nowTime").runTimer();
        })
    </script>
    <div class="layui-header">
        <div class="container">
        <div class="layui-logo" style="font-size:25px;margin-left: 5px">网吧管理系统</div>
            <div class="layui-show" style="margin-left:-20px">
              .
            </div>

            <div class="layui-show" style="margin-top: 7px;margin-left: 45%;color: white;font-size: 18px">
                当前时间:<span id="nowTime"></span>
            </div>
<%--        </div>--%>


        <!-- 头部区域（可配合layui有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                  <c:if test="${sessionScope.user1==1}">管理员:</c:if>
                  <c:if test="${sessionScope.user1==0}">用户:</c:if>
                  ${user}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" onclick="getusermeans()">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"style="margin-right: 5px"><a href="javascript:;" >
                <i class="layui-icon layui-icon-set-fill" style="font-size: 25px; "></i>
            </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" onclick="changeuser()">切换用户</a></dd>
                    <dd><a href="javascript:;" onclick="exit()">注销</a></dd>
                    </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">

                <li class="layui-nav-item" id="firstpage">
                    <a href="${pageContext.request.contextPath}/admin/towelcome1">
                        <div class="layui-icon layui-icon-home" style="font-size: 18px">&nbsp;&nbsp;&nbsp;首页</div>
                    </a>
                </li>
                <li class="layui-nav-item " id="root">
                    <a class="" href="javascript:;">
                        <div class="layui-icon" style="font-size: 18px">&#xe60f;&nbsp;&nbsp;&nbsp;权限管理</div>
                        </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/uservisiter/getall">
<%--                            <div class="layui-icon">&#xe60c;&nbsp;管理员访问信息</div>--%>
                                 <i class="layui-icon layui-icon-face-smile" style="font-size: 15px;">&nbsp;&nbsp;管理员访问信息</i>
                        </a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/getall">
                            <i class="layui-icon layui-icon-list" style="font-size: 15px;">&nbsp;&nbsp;管理员列表</i>
                        </a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item" id="managevip">
                    <a href="javascript:;">
                        <div class="layui-icon"style="font-size: 18px">&#xe60f;&nbsp;&nbsp;&nbsp;会员管理</div>
                        </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/vip/getall">
                            <i class="layui-icon layui-icon-list" style="font-size: 15px;">&nbsp;&nbsp;会员列表</i>
                            </a></dd>
                        <dd><a href="${pageContext.request.contextPath}/vip/toaddvip">
                            <i class="layui-icon layui-icon-add-circle" style="font-size: 15px;">&nbsp;&nbsp;添加会员</i></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item" id="vipaddmoney">
                    <a href="javascript:;">
                        <div class="layui-icon"style="font-size: 18px">&#xe60f;&nbsp;&nbsp;&nbsp;会员充值</div>
                        </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/vip/toupdatemoney">
                            <i class="layui-icon layui-icon-rmb" style="font-size: 15px;">&nbsp;&nbsp;会员卡充值</i>
                            </a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item" id="netrecord">
                    <a href="javascript:;">
                        <div class="layui-icon" style="font-size: 18px">&#xe60f;&nbsp;&nbsp;&nbsp;上网记录</div>
                        </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/record/getall">
                            <i class="layui-icon layui-icon-log" style="font-size: 15px;">&nbsp;&nbsp;查看所有记录</i>
                            </a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item" id="managegonet">
                    <a href="javascript:;">
                        <div class="layui-icon"style="font-size: 18px">&#xe60f;&nbsp;&nbsp;&nbsp;上机管理</div>
                        </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/surf/getall">
                            <i class="layui-icon layui-icon-user" style="font-size: 15px;">&nbsp;&nbsp;会员在线信息</i>
                        </a></dd>
                        <dd><a href="${pageContext.request.contextPath}/surf/togonet">
                            <i class="layui-icon layui-icon-add-1" style="font-size: 15px;">&nbsp;&nbsp;会员上机</i>
                            </a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ayui-nav-itemed" id="userinfo">
                    <a href="javascript:;">
                        <div class="layui-icon">&#xe60f;&nbsp;&nbsp;&nbsp;个人信息及操作</div>
                        </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/vip/topersonnal?id=${sessionScope.user2.id}">修改个人密码</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/vip/togonet?idnumber=${sessionScope.user2.id}">上机</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/vip/tooutnet?idnumber=${sessionScope.user3.idnumber}">下机</a></dd>
                    </dl>
                </li>


            </ul>
        </div>
    </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="iframeMain" src="${pageContext.request.contextPath}/admin/towelcome" style="width: 100%"; height="100%";></iframe>
        <!-- 内容主体区域 -->
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
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
    $(document).ready(function(){
        $("dd>a").click(function (e) {
            e.preventDefault();
            $("#iframeMain").attr("src",$(this).attr("href"));
        });
    });
</script>

<script>

    function exit(){

        layer.confirm("你确认要退出吗？",function(){

            window.location.href='/admin/exit'
        })
    }

    function changeuser(){

        layer.open({
            type: 2,
            title: '切换用户',
            maxmin: true,
            skin: 'layui-layer-lan',
            shadeClose: true, //点击遮罩关闭层
            area : ['400px' , '280px'],
            content:'${pageContext.request.contextPath}/other/changeuser'//弹框显示的url,对应的页面
        });


    }
    function getusermeans(){

        layer.open({
            type: 2,
            title: '个人资料',
            maxmin: true,
            skin: 'layui-layer-lan',
            shadeClose: true, //点击遮罩关闭层
            area : ['400px' , '280px'],
            content:'${pageContext.request.contextPath}/other/usermeans'//弹框显示的url,对应的页面
        });
    }



</script>
</body>
</html>
