<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String path=request.getAttribute("getAdd").toString();
String name=request.getAttribute("name").toString();
%>
<body>
	<center>
		<p>姓名：<input type="text" name="user" value="<%=name%>"></p>
		<p>头像：<img src="<%=path%>"></p>
	</center>
</body>
</html>