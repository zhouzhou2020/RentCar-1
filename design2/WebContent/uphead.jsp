<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String name=request.getAttribute("headup").toString();
%>
<body>
	<center>
		<form action="UploadServlet" method="post" enctype="multipart/form-data">
		<p>姓名：<input type="text" name="user" value="<%=name%>"></p>
		<p><input type="file" name="desc"></p>
		<p><input type="submit" value="上传头像"></p>
		</form>
	</center>
</body>
</html>