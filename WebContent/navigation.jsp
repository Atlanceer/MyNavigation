<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>修改导航</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/navigation.css" rel="stylesheet">
    <link href="css/button.css" rel="stylesheet">
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        function loadNavigation(){
        	var xmlhttp;
        	var str="<%=session.getAttribute("username") %>";
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
  		      for(var i=0;i<json.length;i++){
  		    	  document.getElementById(json[i].id+"w").value=json[i].webName;
  		    	  document.getElementById(json[i].id+"u").value=json[i].url;
  		      }
  		    }
  		  }
  		  xmlhttp.open("POST","UtilServlet",true);
  		  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  		  xmlhttp.send("username="+str+"&method=1");
        }
    </script>
	<%
		Object username=session.getAttribute("username");
	%>
</head>

<body class="signin" onload="loadNavigation()">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">

            <form method="post" class="m-t" role="form" action="UtilServlet" target="nm_iframe">
                <h4 class="no-margins">修改导航信息,修改后请确认提交</h4>
                    <small>格式：www.baidu.com (不用添加前面的http://)</small>
        		<div>
        			<div class="form-group">
	                    <input type="text" id="10w" class="form-control" placeholder="网站10名称" name="webname10" style="float: left;">
	                    <input type="text" id="10u" class="form-control" placeholder="网站10地址" name="url10" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="11w" class="form-control" placeholder="网站11名称" name="webname11" style="float: left;">
	                    <input type="text" id="11u" class="form-control" placeholder="网站11地址" name="url11" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="12w" class="form-control" placeholder="网站12名称" name="webname12" style="float: left;">
	                    <input type="text" id="12u" class="form-control" placeholder="网站12地址" name="url12" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="13w" class="form-control" placeholder="网站13名称" name="webname13" style="float: left;">
	                    <input type="text" id="13u" class="form-control" placeholder="网站13地址" name="url13" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="14w" class="form-control" placeholder="网站14名称" name="webname14" style="float: left;">
	                    <input type="text" id="14u" class="form-control" placeholder="网站14地址" name="url14" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="15w" class="form-control" placeholder="网站15名称" name="webname15" style="float: left;">
	                    <input type="text" id="15u" class="form-control" placeholder="网站15地址" name="url15" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="16w" class="form-control" placeholder="网站16名称" name="webname16" style="float: left;">
	                    <input type="text" id="16u" class="form-control" placeholder="网站16地址" name="url16" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="17w" class="form-control" placeholder="网站17名称" name="webname17" style="float: left;">
	                    <input type="text" id="17u" class="form-control" placeholder="网站17地址" name="url17" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="18w" class="form-control" placeholder="网站18名称" name="webname18" style="float: left;">
	                    <input type="text" id="18u" class="form-control" placeholder="网站18地址" name="url18" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="19w" class="form-control" placeholder="网站19名称" name="webname19" style="float: left;">
	                    <input type="text" id="19u" class="form-control" placeholder="网站19地址" name="url19" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="20w" class="form-control" placeholder="网站20名称" name="webname20" style="float: left;">
	                    <input type="text" id="20u" class="form-control" placeholder="网站20地址" name="url20" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="1w" class="form-control" placeholder="网站1名称" name="webname1" style="float: left;">
	                    <input type="text" id="1u" class="form-control" placeholder="网站1地址" name="url1" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="2w" class="form-control" placeholder="网站2名称" name="webname2" style="float: left;">
	                    <input type="text" id="2u" class="form-control" placeholder="网站2地址" name="url2" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="3w" class="form-control" placeholder="网站3名称" name="webname3" style="float: left;">
	                    <input type="text" id="3u" class="form-control" placeholder="网站3地址" name="url3" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="4w" class="form-control" placeholder="网站4名称" name="webname4" style="float: left;">
	                    <input type="text" id="4u" class="form-control" placeholder="网站4地址" name="url4" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="5w" class="form-control" placeholder="网站5名称" name="webname5" style="float: left;">
	                    <input type="text" id="5u" class="form-control" placeholder="网站5地址" name="url5" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="6w" class="form-control" placeholder="网站6名称" name="webname6" style="float: left;">
	                    <input type="text" id="6u" class="form-control" placeholder="网站6地址" name="url6" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="7w" class="form-control" placeholder="网站7名称" name="webname7" style="float: left;">
	                    <input type="text" id="7u" class="form-control" placeholder="网站7地址" name="url7" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="8w" class="form-control" placeholder="网站8名称" name="webname8" style="float: left;">
	                    <input type="text" id="8u" class="form-control" placeholder="网站8地址" name="url8" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="9w" class="form-control" placeholder="网站9名称" name="webname9" style="float: left;">
	                    <input type="text" id="9u" class="form-control" placeholder="网站9地址" name="url9" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="21w" class="form-control" placeholder="网站21名称" name="webname21" style="float: left;">
	                    <input type="text" id="21u" class="form-control" placeholder="网站21地址" name="url21" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="22w" class="form-control" placeholder="网站22名称" name="webname22" style="float: left;">
	                    <input type="text" id="22u" class="form-control" placeholder="网站22地址" name="url22" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="23w" class="form-control" placeholder="网站23名称" name="webname23" style="float: left;">
	                    <input type="text" id="23u" class="form-control" placeholder="网站23地址" name="url23" style="float: left;">
	                </div>
	                <div class="form-group">
	                    <input type="text" id="24w" class="form-control" placeholder="网站24名称" name="webname24" style="float: left;">
	                    <input type="text" id="24u" class="form-control" placeholder="网站24地址" name="url24" style="float: left;">
	                </div>
	            </div>
	                <div class="form-group">
	                    <input type="text" style="display: none;" name="method" value="4">
	                </div>
               <!--  
                <button type="submit" class="btn btn-primary block full-width m-b" >确认修改</button>
                
                <p class="text-muted text-center"><a href="index.jsp"><button><small>去导航页</small></button></a>
                </p> -->
                </br>
                </br>
                <div style="text-align:center">
                <ul class="button-group">
				<li><button type="submit" class="small button" >确认修改</button></li>
				<li><a href="index.jsp" class="small button">去导航页</a></li>
				</ul>
				</div>
			
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