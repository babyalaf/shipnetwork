<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>船联网</title>
    <link href="resource/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/hplus/css/font-awesome.min.css" rel="stylesheet">
    <link href="resource/hplus/css/animate.min.css" rel="stylesheet">
    <link href="resource/hplus/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="resource/hplus/js/jquery.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/bootstrap.min.js"></script>
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
  <body class="gray-bg">
    <div class="text-center animated fadeInDown" style="width: 450px;padding-top: 120px;margin: 0 auto;">
        <div>
            <div>
                <h1 class="logo-name" style="font-size: 150px;">船联网</h1>
            </div>
            <form class="m-t" role="form" action="login" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名" name="loginName">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" name="password">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            </form>
        </div>
    </div>
  </body>
</html>