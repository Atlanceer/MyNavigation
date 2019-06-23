<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>导航页</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/button.css">
<script type="text/javascript" src="js/run.js"></script>
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
		    	document.getElementById("template").innerHTML="<a onclick='addtemplate()'><button class='small button'>添加模板</button></a>";
		    }
		  }
		  xmlhttp.open("POST","UtilServlet",true);
		  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		  xmlhttp.send("username="+str+"&method=1");
}
function relogin(){
	var str="<%=session.getAttribute("username") %>";
	if(str==null||str==""||str=="null"){
		//alert("没有用户"+str);
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {
			xmlhttp=new XMLHttpRequest();
		  }
		  else
		  {
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
		  xmlhttp.send("method=0");
	}else{
		//alert("用户已经登录"+str);
	}
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
function addtemplate(){
	var str="<%=session.getAttribute("username") %>";
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
	  xmlhttp.send("username="+str+"&method=5");
}
</script>
</head>
<body background="pictures/season0.jpg" id="body" class="content" onload="relogin()">
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
			if(username==null){//用户未登录
				out.print("<ul class='button-group'>");
				out.print("<li><a href='login.jsp'><button class='small button'>你好你还没有登录</button></a></li>");
				out.print("<li><a href='login.jsp'><button class='small button'>登录</button></a></li>");
				out.print("</ul>");
			}else{//用户已登录
				out.print("<script>loadXMLDoc("+"'"+username+"'"+");</script>");//为什么使用"'":因为调用js函数格式为loadXMLDoc('name');参数加单引号
				
				out.print("<ul class='button-group'>");
				out.print("<li><button class='small button'>欢迎您"+username+"</button></li>");
				out.print("<li><button onclick=\"logout()\" class='small button'>注销</button></li>");
				out.print("</ul>");
				
				out.print("</br>");
				out.print("<ul class='button-group'>");
				out.print("<li><a href='navigation.jsp'><button class='small button'>修改导航信息</button></a></li>");
				out.print("<li><div id='template'></div></li>");
				out.print("</ul>");
			}
			
		%>
		<!-- <ul class="button-group">
		<li><button class="small button">你好你还没有登录</button></li>
		<li><a href="login.jsp"><button class="small button">登录</button></a></li>
		</ul> -->
	</div>
	<div id="template"></div>
	<div class="signup-footer">
         <div class="pull-left">
             &copy; 侧耳
         </div>
    </div>
</body> 
</html>
