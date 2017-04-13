<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Car"
    %>
    <%
    if(session.getAttribute("key")==null){
    	response.sendRedirect("shouye.jsp");
    }
    Object name=session.getAttribute("key");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="我要买车-按车型" />
<title>我要选车</title>
<link type="text/css" rel="stylesheet" href="a/css/global.css" />
<script src="a/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="a/js/jQselect.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
		$("#c").selectbox();
		$("#c1").selectbox();
		$("#c2").selectbox(); 
	});
</script>
<!--[if lt IE 7]>
<script type="text/javascript" src="a/js/unitpngfix.js"></script>
<![endif]-->
</head>

<%
Object userName=request.getAttribute("username");
String uname=request.getParameter("name");
String cid=request.getParameter("cid");
String shoujia=request.getParameter("shoujia");
%>

<body>
<div class="headbg">
  <div class="header">
    <ul class="logareg">
      <li><a href="#"><%=name %></a></li>
      <li class="lineli">|</li>
      <li><a href="qiantai.jsp">注册</a></li>
    </ul>
    <div class="clear"></div>
    <img class="logo" src="a/images/logo.png" alt="" title="" />
    <ul class="topnav">
      <li><a href="shouye.jsp">首页</a></li>
      <li><a href="list.jsp">还车与分期</a></li>
      <li><a href="show.jsp">优惠活动</a></li>
      <li><a href="main2.jsp?name=<%=name%>">个人中心</a></li>
    </ul>
    <div class="clear"></div>
  </div>
</div>
<div class="container">
  <div class="nav"><a href="shouye.jsp">首页</a> &gt; 我要买车</div>
  	<center>
  		<form name="frm" method="post">
  			<table>
  				<tr>
  					<td>车牌号：</td><td><input type="text" name="carId" value="<%=cid%>"></td>
  				</tr>
  				<tr>
  					<td>客户姓名：</td><td><input type="text" name="uname" value="<%=uname%>"></td>
  				</tr>
  				<tr>
  					<td>汽车售价：</td><td><input type="text" name="price" value="<%=shoujia%>">元</td>
  				</tr>
  				<tr>
  					<td colspan="2" align="center"><input type="button" value="确认购买" onclick="fun()"></td>
  				</tr>
  			</table>
  		</form>
  	</center>
</div>
<div class="footbg">
  <div class="footer">
    <div class="foot_l">
      <div class="menu_foot">
        <p>关于我们</p>
        <ul>
          <li><a href="#">关于汽车服务</a></li>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">平台介绍</a></li>
          <li><a href="#">平台宗旨</a></li>
        </ul>
      </div>
      <div class="menu_foot">
        <p>关于我们</p>
        <ul>
          <li><a href="#">关于汽车服务</a></li>
          <li><a href="#">关于我们</a></li>
          <li><a href="#">平台介绍</a></li>
          <li><a href="#">平台宗旨</a></li>
        </ul>
      </div>
      <div class="clear"></div>
      <div class="copyright">Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://www.mycodes.net/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> - More Templates <a href="http://www.mycodes.net/" target="_blank" title="源码之家">源码之家</a> </div>
    </div>
    <div class="foot_r">
      <div class="title">关于我们</div>
      <div class="detail">汽车服务网站平台提供各种汽车保养和维修套餐及服务网站汽车服务网站平台提供各种汽车保养和维修套餐及服务网站会员可通过平台定制自己需要的服务。同时，网站平台定期推出各种优惠活动...</div>
    </div>
  </div>
</div>
</body>
	<script>
		function fun(){
			document.frm.action="BuyNowServlet";
			document.frm.submit();
		}
	</script>
</html>
