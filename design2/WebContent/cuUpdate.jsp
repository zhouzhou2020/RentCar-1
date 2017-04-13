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
    <li><a href="#">客户修改</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>客户信息</span></div>
    <%
    String id=request.getParameter("cid");
    String name=request.getParameter("cname");
    String age=request.getParameter("cage");
    String tel=request.getParameter("ctel");
    String idcard=request.getParameter("cidcard");
    
    %>
    <form name="frm" method="post">
	    <ul class="forminfo">
	    <input type="hidden" name="cid" value="<%=id%>">
	    <li><label>客户姓名：</label><input name="cname" type="text" class="dfinput" value="<%=name%>"/><i>姓名不能超过五个字符</i></li>
	    <li><label>客户性别：</label><cite><input name="csex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="csex" type="radio" value="女" />女</cite></li>
	    <li><label>客户年龄：</label><input name="cage" type="text" class="dfinput" value="<%=age%>" /></li>
	    <li><label>客户电话：</label><input name="ctel" type="text" class="dfinput" value="<%=tel%>"></li>
	    <li><label>客户身份证：</label><input name="cidcard" type="text" class="dfinput" value="<%=idcard%>"></li>
	   	<li><label>客户等级：</label>
	   		<select name="clv">
	   			<option value="0">普通客户</option>
	   			<option value="1">VIP</option>
	   			<option value="2">黑名单</option>						
			</select></li>
	    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认修改" onclick="fun()"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
<script>
	function fun(){
		document.frm.action="CuUpdateServlet";
		document.frm.submit();
	}
</script>
