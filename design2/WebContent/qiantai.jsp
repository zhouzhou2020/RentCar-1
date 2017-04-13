<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<script src="js/jquery-2.2.4.min.js"></script>
		<script>
			$(document).ready(function() {
				
				$(".form").slideDown(500);
				
				$("#landing").addClass("border-btn");

				$("#registered").click(function() {
					$("#landing").removeClass("border-btn");
					$("#landing-content").hide(500);
					$(this).addClass("border-btn");
					$("#registered-content").show(500);
					
				})

				$("#landing").click(function() {
					$("#registered").removeClass("border-btn");
					$(this).addClass("border-btn");
					
					$("#landing-content").show(500);
					$("#registered-content").hide(500);
				})
			});
		</script>
		<style>
			* {
				margin: 0;
				padding: 0;
				font-family: "微软雅黑";
			}
			
			body {
				background: #F7F7F7;
			}
			
			.form {
				position: absolute;
				top: 50%;
				left: 50%;
				margin-left: -185px;
				margin-top: -210px;
				height: 420px;
				width: 340px;
				font-size: 18px;
				-webkit-box-shadow: 0px 0px 10px #A6A6A6;
				background: #fff;
			}
			
			.border-btn {
				border-bottom: 1px solid #ccc;
			}
			
			#landing,
			#registered {
				float: left;
				text-align: center;
				width: 170px;
				padding: 15px 0;
				color: #545454;
			}
			
			#landing-content {
				clear: both;
			}
			
			.inp {
				height: 30px;
				margin: 0 auto;
				margin-bottom: 30px;
				width: 200px;
			}
			
			.inp>input {
				text-align: center;
				height: 30px;
				width: 200px;
				margin: 0 auto;
				transition: all 0.3s ease-in-out;
			}
			
			.login {
				border: 1px solid #A6A6A6;
				color: #a6a6a6;
				height: 30px;
				width: 202px;
				text-align: center;
				font-size: 13.333333px;
				margin-left: 70px;
				line-height: 30px;
				margin-top: 30px;
				transition: all 0.3s ease-in-out;
			}
			
			.login:hover {
				background: #A6A6A6;
				color: #fff;
			}
			
			#bottom {
				margin-top: 30px;
				font-size: 13.333333px;
				color: #a6a6a6;
			}
			
			#registeredtxt {
				float: left;
				margin-left: 80px;
			}
			
			#forgotpassword {
				float: right;
				margin-right: 80px;
			}
			
			#photo {
				border-radius: 80px;
				border: 1px solid #ccc;
				height: 80px;
				width: 80px;
				margin: 0 auto;
				overflow: hidden;
				clear: both;
				margin-top: 30px;
				margin-bottom: 30px;
			}
			
			#photo>img:hover {
				-webkit-transform: rotateZ(360deg);
				-moz-transform: rotateZ(360deg);
				-o-transform: rotateZ(360deg);
				-ms-transform: rotateZ(360deg);
				transform: rotateZ(360deg);
			}
			
			#photo>img {
				height: 80px;
				width: 80px;
				-webkit-background-size: 220px 220px;
				border-radius: 60px;
				-webkit-transition: -webkit-transform 1s linear;
				-moz-transition: -moz-transform 1s linear;
				-o-transition: -o-transform 1s linear;
				-ms-transition: -ms-transform 1s linear;
			}
			
			
			#registered-content {
				margin-top: 40px;
				display: none;
			}
			
			.fix {
				clear: both;
			}
			.form{
				display: none;
			}
		</style>
	</head>
	<body>
		<div class="form">
			<div id="landing">登录</div>
			<div id="registered">注册</div>
			<div class="fix"></div>
			<form name="frm" method="post">
			<div id="landing-content">
				<div id="photo"><img src="img/20160509091933.jpg" /></div>
				<div class="inp"><input name="cuName" type="text" placeholder="用户名" id="user" onblur="use()"/><span id="u1"></span></div>
				<div class="inp"><input name="cuPwd" type="password" placeholder="密码" id="pwd" onblur="pwd()"/><span id="u2"></span></div>
				<div class="login"><input type="button" value="登陆" onclick="fun()"></div>
			</div>
			</form>
			<form name="frm1" method="post" >
			<div id="registered-content">
				<div class="inp"><input name="cname" type="text" placeholder="请输入用户名" id="uid" onblur="check()"/><span id="spanid"></span></div>
				<div class="inp"><input name="cpwd" type="password" placeholder="请输入密码" id="pid" onblur="plength()"/><span id="sid2"></span></div>
				<div class="inp"><input type="password" placeholder="请再次输入密码" id="pid2" onblur="checkPW()"/><span id="sid"></span></div>
				<div class="login"><input type="button" value="立即注册" onclick="fun1()"></div>
			</div>
			</form>
		</div>
		<div style="text-align:center;">
</div>
	</body>
	
	<script>
		function use(){
			var a=document.getElementById("user").value;
			if(a.length==0){
				document.getElementById("u1").innerHTML="姓名不能为空"
			}
		}
		
		function pwd(){
			var a=document.getElementById("pwd").value;
			if(a.length!=0 && a.length<=10){
				return true;
			}else{
				document.getElementById("u2").innerHTML="长度不可超过十位"
			}
		}
	
		function plength(){
			var a=document.getElementById("pid").value;
			if(a.length!=0 && a.length<=10){
				document.getElementById("sid2").innerHTML="长度可用"
				return true;
			}else{
				document.getElementById("sid2").innerHTML="长度应在十位以下"
			}
		}	
	
		function checkPW(){
			var a=document.getElementById("pid").value;
			var b=document.getElementById("pid2").value;
			if(a==b && a.length!=0 && b.length!=0){
				document.getElementById("sid").innerHTML="该密码可以使用"
				return true;
			}else{
				document.getElementById("sid").innerHTML="两次输入的密码不相同"
				return false;
			}
		}
	
		
		function check(){
			var xmlHttpReq=new XMLHttpRequest();
			
			var username=document.getElementById("uid").value;
			
			var url="TestNameServlet?name="+username;
			
			xmlHttpReq.open("get",encodeURI(encodeURI(url)),true);    	
			xmlHttpReq.onreadystatechange=function(){
				if(xmlHttpReq.status==200 && xmlHttpReq.readyState==4){
					document.getElementById("spanid").innerHTML=xmlHttpReq.responseText;
				}
			}
			
			//发送请求
			xmlHttpReq.send(null);
		}
	
		function fun(){
			document.frm.action="CuLoginServlet";
			document.frm.submit();
		}
		
		function fun1(){
			document.frm1.action="CuAddServlet";
			document.frm1.submit();
		}
		
	</script>

</html>