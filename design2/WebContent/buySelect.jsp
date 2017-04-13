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
ArrayList<Car> list=(ArrayList<Car>)request.getAttribute("select");

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
     <li class="topseled"><a href="shouye.jsp">首页</a></li>
      <li><a href="ChooseCarServlet?name=<%=name%>">我要选车</a></li>
      <li><a href="BackCarServlet?name=<%=name%>">我要还车</a></li>
      <li><a href="ShowServlet">优惠活动</a></li>
      <li><a href="SelfServlet?name=<%=name%>">个人中心</a></li>
    </ul>
    <div class="clear"></div>
  </div>
</div>
<div class="container">
  <div class="nav"><a href="shouye.jsp">首页</a> &gt; 我要买车</div>
  <div class="con_buy">
    <div class="title"></div>
    <div class="detail">
    <form action="SelectCarServlet" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_sear">
        <tr>
          <td width="140" valign="top"><p class="title_sear">车名</p></td>
          <td><div class="sear_item">
              <ul>
                <li><span class="name_item">价格：</span>
                  <ul class="item_ul">
                    <input type="text" name="selectCar" >
                  </ul>
                </li>
              </ul>
            </div></td>
          <td align="right" valign="bottom"><input name="" type="submit" value="查询" class="button_sear"></td>
        </tr>
      </table>
      </form>
      <div class="search_list">
      	
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
        	<%for(int i=0;i<list.size();i++){%>
        		 <tr>
		         <td width="135"><%=list.get(i).getCid()%></td>
		            <td width="725"><div class="title_car"><a href="#" class="name"><%=list.get(i).getPinpai()%>&nbsp;<%=list.get(i).getXname()%></a>
		                <p class="price">价格：<span class="red">￥<%=list.get(i).getXshoujia() %></span></p><p class="price">租赁价格：<span class="red">￥<%=list.get(i).getXzujin()%>元</span></p>
		              	<p class="price">押金：<span class="red">￥<%=list.get(i).getXyajin() %></span></p>
		              </div>
		            <td align="right"><a href="rentNow.jsp?name=<%=name%>&cid=<%=list.get(i).getCid()%>&zujin=<%=list.get(i).getXzujin()%>&yajin=<%=list.get(i).getXyajin()%>" class="green_a">租赁</a>&nbsp;
		            <a href="buyNow.jsp?name=<%=name%>&cid=<%=list.get(i).getCid()%>&shoujia=<%=list.get(i).getXshoujia()%>" class="green_a">购买</a></td>
		         </tr>
        	<%}%>
        </table>
       
      </div>
    </div>
  </div>
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
</html>
