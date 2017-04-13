<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Car"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>
<%
ArrayList<Car> list=(ArrayList<Car>)request.getAttribute("carlist");
%>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">汽车表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
        
        <ul class="toolbar1">
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>车牌号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>品牌名</th>
        <th>型号</th>
        <th>状态</th>
        </tr>
        </thead>
        
        <tbody>
        <%for(int i=0;i<list.size();i++){ %>
        	<tr>
        		<td><%=list.get(i).getCid()%></td>
        		<td><%=list.get(i).getPinpai()%></td>
        		<td><%=list.get(i).getXname()%></td>
        		<td><%=list.get(i).getCflag()%></td>
        	</tr>
        <%}%>
        </tbody>
        
    </table>
    <div class="pagin">
 <ul class="paginList">
	        <li class="paginItem"><a href="">首页</a></li>
	        <li class="paginItem"><a href="">上页</a></li>
	        <li class="paginItem"><a href="">下页</a></li>
	        <li class="paginItem"><a href="">尾页</a></li>
	        </ul>
</div>
   
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
