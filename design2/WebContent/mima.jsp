<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name=request.getAttribute("haha").toString();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="CuMimaServlet" method="post">
	<center>
		您的姓名：<input type="text" name="uname" value="<%=name%>" readonly="readonly" ><br/>
		请输入新的密码：<input type="password" name="upwd"><br/>
		请再次输入：<input type="password" ><br/>
		<input type="submit" value="修改">
	</center>
	</form>
</body>
</html>