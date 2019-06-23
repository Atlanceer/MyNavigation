<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>请先登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/login.css" rel="stylesheet">
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">

            <form method="post" class="m-t" role="form" action="UserRegister" target="nm_iframe">
                <h4 class="no-margins">账号注册：</h4>
                    <p class="m-t-md">欢迎注册</p>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名" name="username" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" name="password" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="手机号(用于找回密码)" name="phone" required>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">提交注册</button>
                
                <p class="text-muted text-center"><a href="#"><small>忘记密码了？</small></a> | <a href="login.jsp">去登陆</a>
                </p>

            </form>
            <iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe> 
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 侧耳
            </div>
        </div>
    </div>
</body>

</html>