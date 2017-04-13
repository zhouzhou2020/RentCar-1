<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>">
<title>欢迎汽车后台管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })
    
});  
	function reloadCode(){
		var time = new Date().getTime();
		document.getElementById("imagecode").src="<%=request.getContextPath() %>/ImageServlet?d="+time;
	}
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录汽车管理界面</span>    
    <ul>
    <li><a href="shouye.jsp">回前台</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox loginbox1">
    
    <ul>
    <form name="frm" method="post">
    	<li><input name="uname" type="text" class="loginuser" placeholder="请输入姓名" onblur="nameLen()" id="mingzi"/></li>
    	<li><input name="upwd" type="password" class="loginpwd" onblur="pwdLen()" id="mima"/></li>
    
    	<li class="yzm">
    	<span><input name="checkcode" type="text" value="验证码" onclick="JavaScript:this.value=''"/></span>
    	<cite><img alt="验证码" id="imagecode" src="<%=request.getContextPath() %>/ImageServlet"/></cite> 
    	</li>
    
    	<li><input name="" type="button" class="loginbtn" value="登录"  onclick="act()"  />
    		<label><a href="javascript: reloadCode();">看不清楚</a></label>
    		<label><a href="#">忘记密码？</a></label>
    	</li>
    </form>
    </ul>
    
    
    </div>
    
    </div>
    
    
    <div class="loginbm">版权所有  2014  <a href="http://www.uimaker.com">uimaker.com</a></div>
</body>
	<script>
		function nameLen(){
			var n=document.getElementById("mingzi").value;
			if(n.length>5){
				alert("姓名长度不可以超过五位")
				return false;
			}else{
				return true;
			}
		}
		function pwdLen(){
			var m=document.getElementById("mima").value;
			if(m.length>10){
				alert("密码长度不能超过十位")
				return false;
			}else{
				return true;
			}
		}
		function act(){
			if(nameLen()==true && pwdLen()==true){
				document.frm.action="LoginServlet"
				document.frm.submit();
			}
		}
	</script>
</html>
