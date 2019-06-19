<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>导航页</title>
<style type="text/css">
body{
min-width: 700px;
width: expression_r( document.body.clientWidth < 701 ? "700px" : "auto" );

} 
	.head{width:1024px; position:relative;top:20px; margin:auto}
	.ball{width:540px; height:540px; position:relative; top:120px; background:url(pictures/bigball.png); background-size:cover; margin: 0 auto;}
	.ball a{ display:block; position: absolute; right:20px;top:0px; opacity:1; color:#FFF;font-size:10px; background:url(pictures/littleBall.png) no-repeat center bottom;text-decoration:none; padding-bottom:25px; background-size:16px}
	.lbox{width:50px; position:fixed;top:40%; left:10px; display:block;}
	.lbox a {width: 50px;height: 50px;display: inline-block;background-color: #ddd;margin-bottom: 2px; opacity:0.5; transition: all 1s;;border-radius:10%; overflow:hidden;}
	.lbox a:hover{ opacity:1;}
	.lboc .main{width:50px; height:50px;}
	.rbox{width:80px; position:fixed;top:30%; right:10px; display:block}
	.rbox a {width: 80px;height: 80px;display: inline-block;background-color: #ddd;margin-bottom: 2px; opacity:0.5; transition: all 1s;;border-radius:10%; overflow:hidden;}
	.rbox a:hover{ opacity:1}
</style>
<script type="text/javascript" src="run.js"></script>
<script>
function loadXMLDoc(str)
{
	for(var i=1;i<=24;i++){
  	  document.getElementById("child"+i).innerHTML="";
  	  document.getElementById("child"+i).href="";
    }
		  var xmlhttp;
		  <%-- var str="<%=username%>"; --%>
		  //document.getElementById("myDiv").innerHTML=str;
		  if (window.XMLHttpRequest)
		  {
		    // IE7+, Firefox, Chrome, Opera, Safari æµè§å¨æ§è¡ä»£ç 
		    xmlhttp=new XMLHttpRequest();
		  }
		  else
		  {
		    // IE6, IE5 æµè§å¨æ§è¡ä»£ç 
		    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		  xmlhttp.onreadystatechange=function()
		  {
		    if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
		      var json=JSON.parse(xmlhttp.responseText);
		      //document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		      /* for(var temp in json){
		    	  document.getElementById("2").innerHTML=json[temp].webName;
		    	  i++;
		      } */
		      //document.getElementById("test").innerHTML=json.length;
		      for(var i=0;i<json.length;i++){
		    	  document.getElementById("child"+json[i].id).innerHTML=json[i].webName;
		    	  document.getElementById("child"+json[i].id).href="http://"+json[i].url;
		    	  //document.getElementById(json[i].id).innerHTML=json[i].webName;
		    	  //document.getElementById(json[i].id).href="http://"+json[i].url;
		      }
		    }
		  }
		  xmlhttp.open("POST","UtilServlet",true);
		  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		  xmlhttp.send("username="+str+"&method=1");
}
function logout(){
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {
	    // IE7+, Firefox, Chrome, Opera, Safari æµè§å¨æ§è¡ä»£ç 
	    xmlhttp=new XMLHttpRequest();
	  }
	  else
	  {
	    // IE6, IE5 æµè§å¨æ§è¡ä»£ç 
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
		xmlhttp.onreadystatechange=function()
	  {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    	window.location.href="index.jsp";
	    }
	  }
	  xmlhttp.open("POST","UtilServlet",true);
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xmlhttp.send("method=2");
}
</script>
</head>
<body background="pictures/season0.jpg" id="body" class="content">
<%! 
	Object username;// JSP片段中定义变量
%>
	<div id="father" class="ball">
    	<a id="child1"  href="http://www.baidu.com" onmouseover="stop(1)" onmouseout="start(1)">百度</a>
        <a id="child2"  href="" onmouseover="stop(2)" onmouseout="start(2)">富强</a>
        <a id="child3"  href="" onmouseover="stop(3)" onmouseout="start(3)">民主</a>
        <a id="child4"  onmouseover="stop(4)" onmouseout="start(4)">和谐</a>
        <a id="child5"  onmouseover="stop(5)" onmouseout="start(5)">文明</a>
        <a id="child6"  onmouseover="stop(6)" onmouseout="start(6)">自由</a>
        <a id="child7"  onmouseover="stop(7)" onmouseout="start(7)">平等</a>
        <a id="child8"   onmouseover="stop(8)" onmouseout="start(8)">公正</a>
        <a id="child9"  onmouseover="stop(9)" onmouseout="start(9)">法制</a>
        <a id="child10"  onmouseover="stop(10)" onmouseout="start(10)">富强</a>
        <a id="child11"  onmouseover="stop(11)" onmouseout="start(11)">公正</a>
        <a id="child12"  onmouseover="stop(12)" onmouseout="start(12)">文明</a>
        <a id="child13"  onmouseover="stop(13)" onmouseout="start(13)">民主</a>
        <a id="child14"  onmouseover="stop(14)" onmouseout="start(14)">自由</a>
        <a id="child15"  onmouseover="stop(15)" onmouseout="start(15)">海阔天空</a>
        <a id="child16"  onmouseover="stop(16)" onmouseout="start(16)">民主</a>
        <a id="child17"  onmouseover="stop(17)" onmouseout="start(17)">光辉岁月</a>
        <a id="child18"  onmouseover="stop(18)" onmouseout="start(18)">绅士</a>
        <a id="child19"  onmouseover="stop(19)" onmouseout="start(19)">民主</a>
        <a id="child20"  onmouseover="stop(20)" onmouseout="start(20)">怪咖</a>
        <a id="child21"  onmouseover="stop(21)" onmouseout="start(21)">你好</a>
        <a id="child22"  onmouseover="stop(22)" onmouseout="start(22)">世界</a>
        <a id="child23"  onmouseover="stop(23)" onmouseout="start(23)">核心价值</a>
        <a id="child24"  onmouseover="stop(24)" onmouseout="start(24)">社会主义</a>
    </div>
    <div class="lbox" id="lbox">
        <a class="main" onclick="season(0)" style="background:url(pictures/season0.jpg); background-size:cover"></a>
    </div>
    <div class="rbox" id="rbox">
    	<a onclick="season(1)"style="background:url(pictures/season1.jpg); background-size:cover"></a>
        <a onclick="season(2)"style="background:url(pictures/season2.jpg); background-size:cover"></a>
        <a onclick="season(3)"style="background:url(pictures/season3.jpg); background-size:cover"></a>
        <a onclick="season(4)"style="background:url(pictures/season4.jpg); background-size:cover"></a>
    </div>
    <div style="position: absolute;top: 30px;right: 30px">
		<%
			username=session.getAttribute("username");
			if(username==null){
				out.print("你好，你还没有<a href=\"login.jsp\">登陆！</a><br/>");
			}else{
				out.print("<script>loadXMLDoc("+"'"+username+"'"+");</script>");//为什么使用"'":因为调用js函数格式为loadXMLDoc('name');参数加单引号
				out.print("欢迎您"+username);
				out.print("|<a onclick=\"logout()\">注销</a><br/>");
				out.print("<a href=\"navigation.jsp\">修改导航信息</a>");
			}
			
		%>
	</div>
</body> 
</html>
