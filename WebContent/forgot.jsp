<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>找回密码</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="login.css" rel="stylesheet">
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

            <form method="post" class="m-t" role="form" action="UtilServlet" target="nm_iframe">
                <h4 class="no-margins">找回密码：</h4>
                    <p class="m-t-md">手机号找回密码</p>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="手机号码" name="phone" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="新的密码" name="newpassword" required>
                </div>
                <div class="form-group">
                    <input type="text" style="display: none;" name="method" value="3">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">确认修改</button>
                
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