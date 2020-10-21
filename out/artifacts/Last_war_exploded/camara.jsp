<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="zh">
<html lang="en">
<head>
    <title>GET VIDEO</title>
    <meta charset="utf-8">
</head>
<body>
<input type="button" title="开启摄像头" value="开启摄像头" onclick="getMedia()" />
<video id="video" width="500px" height="500px" autoplay="autoplay"></video>
<canvas id="canvas" width="500px" height="500px"></canvas>
<button id="snap" onclick="takePhoto()">拍照</button>
<script>
    //获得video摄像头区域
    let video = document.getElementById("video");
    function getMedia() {
        let constraints = {
            video: {width: 500, height: 500},
            audio: true
        };
        /*
        这里介绍新的方法:H5新媒体接口 navigator.mediaDevices.getUserMedia()
        这个方法会提示用户是否允许媒体输入,(媒体输入主要包括相机,视频采集设备,屏幕共享服务,麦克风,A/D转换器等)
        返回的是一个Promise对象。
        如果用户同意使用权限,则会将 MediaStream对象作为resolve()的参数传给then()
        如果用户拒绝使用权限,或者请求的媒体资源不可用,则会将 PermissionDeniedError作为reject()的参数传给catch()
        */
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then(function (MediaStream) {
            video.srcObject = MediaStream;
            video.play();
        }).catch(function (PermissionDeniedError) {
            console.log(PermissionDeniedError);
        })
    }
    function takePhoto() {
        //获得Canvas对象
        let canvas = document.getElementById("canvas");
        let ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0, 500, 500);
        var saveImg=canvas.toDataURL("image/png");
        document.write("<form action=${pageContext.request.contextPath}/other/addface method=post name=form1 style='display:none'>");
        document.write("<input type=hidden name=img value='"+saveImg+"'");
        document.write("</from>")
        document.form1.submit();
    }
</script>
</body>
</html>