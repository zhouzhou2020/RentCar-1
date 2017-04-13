<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="bean.Buy,java.util.ArrayList"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
ArrayList<Buy> list=(ArrayList<Buy>)request.getAttribute("buylist");
%>
<body>
	<center>
		<table border="1">
			<thead>
				<tr>
					<th>车牌号</th>
					<th>售价</th>
					<th>买车时间</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i=0;i<list.size();i++){ %>
					<tr>
						<td><%=list.get(i).getScid() %></td>
						<td><%=list.get(i).getSpay() %></td>
						<td><%=list.get(i).getSelltime() %></td>
						<td><%=list.get(i).getSflag() %></td>
						
					</tr>
				<%}%>
			</tbody>
		</table>
	</center>
</body>
</html>