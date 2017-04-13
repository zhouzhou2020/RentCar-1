<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">型号修改</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>型号信息</span></div>
    <%
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    
    %>
    <form name="frm" method="post">
	    <ul class="forminfo">
	    <input type="hidden" name="id" value="<%=id %>">
	    <li><label>型号名称：</label><input name="name" type="text" class="dfinput" value="<%=name%>"/></li>
	    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认修改" onclick="fun()"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
<script>
	function fun(){
		document.frm.action="XinghaoUpServlet";
		document.frm.submit();
	}
</script>
