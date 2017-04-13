<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="bean.Rent,java.util.ArrayList"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
ArrayList<Rent> list=(ArrayList<Rent>)request.getAttribute("rentlist");
%>
<body>
	<center>
		<table border="1">
			<thead>
				<tr>
					<th>车牌号</th>
					<th>押金</th>
					<th>租车时间</th>
					<th>应还时间</th>
					<th>实际归还时间</th>
					<th>实际支付</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i=0;i<list.size();i++){ %>
					<tr>
						<td><%=list.get(i).getRcid() %></td>
						<td><%=list.get(i).getRyajin() %></td>
						<td><%=list.get(i).getRenttime() %></td>
						<td><%=list.get(i).getBacktime() %></td>
						<td><%=list.get(i).getRealtime() %></td>
						<td><%=list.get(i).getRealpay() %></td>
						<td><%=list.get(i).getRflag() %></td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</center>
</body>
</html>