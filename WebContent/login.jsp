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
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        function usePhone(){
        	var xmlhttp;
        	if(window.XMLHttpRequest){
        		xmlhttp=new XMLHttpRequest();
        	}else{
        		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        	}
        	xmlhttp.onreadystatechange=function(){
        		if (xmlhttp.readyState==4 && xmlhttp.status==200){
	        		document.getElementById("change").innerHTML=xmlhttp.responseText;
	        		document.getElementById("whichway").innerHTML="<button class='small button' onclick='useUsername()'>用户名登录</button>";
        		}
        	}
        	xmlhttp.open("GET","file/usePhone.txt",true);
        	xmlhttp.send();
        }
        function useUsername(){
        	var xmlhttp;
        	if(window.XMLHttpRequest){
        		xmlhttp=new XMLHttpRequest();
        	}else{
        		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        	}
        	xmlhttp.onreadystatechange=function(){
        		if (xmlhttp.readyState==4 && xmlhttp.status==200){
	        		document.getElementById("change").innerHTML=xmlhttp.responseText;
	        		document.getElementById("whichway").innerHTML="<button class='small button' onclick='usePhone()''>手机号登录</button>";
        		}
        	}
        	xmlhttp.open("GET","file/useUsername.txt",true);
        	xmlhttp.send();
        }
        function success(){
        	window.location.href="test.jsp";
        }
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">

            <form method="post" class="m-t" role="form" action="UserLogin" ><!-- target="nm_iframe" -->
                <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">欢迎登录</p>
                <div id="change">
	                <div class="form-group">
	                    <input type="text" class="form-control" placeholder="用户名" name="username" required>
	                </div>
	                <div class="form-group">
	                    <input type="text" style="display: none;" name="phone" >
	                </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" name="password" required>
                </div>
                <!-- <button type="submit" style="float: left;" class="btn btn-primary block full-width m-b">登 录</button> -->
                <!-- <div id="whichway" class="btn btn-primary block full-width m-b">
                	<button type="button" onclick="usePhone()"><small>手机号登录</small></button>
                </div> -->
                <ul class="button-group">
				<li><button type="submit" class="small button">登录</button></li>
				<li><div id="whichway"><button class="small button" onclick="usePhone()">手机号登录</button></div></li>
				</ul>


                <p class="text-muted text-center"> <a href="forgot.jsp"><small>忘记密码了？</small></a> | <a href="register.jsp">注册一个新账号</a>
                </p>

            </form>
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