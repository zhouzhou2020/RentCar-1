<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Employ"
    %>
    <%
    ArrayList<Employ> list=(ArrayList<Employ>)request.getAttribute("emKey");
    String p=request.getAttribute("pages").toString();
    int totalPages=Integer.parseInt(p);
    String n=request.getAttribute("now").toString();
    int nowP=Integer.parseInt(n);
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


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <a href="emAdd.jsp"><li class="click"><span><img src="images/t01.png" /></span>添加</li></a>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    <form>
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>联系电话</th>
        <th>身份证号</th>
        <th>等级</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        
        <%for(int i=0;i<list.size();i++){ %>
        <tr>
        	<td><%=list.get(i).getId() %></td>
	        <td><%=list.get(i).getName() %></td>
	        <td><%=list.get(i).getSex() %></td>
	        <td><%=list.get(i).getAge() %></td>
	        <td><%=list.get(i).getTel()%></td>
	        <td><%=list.get(i).getIdcard()%></td>
	        <td><%=list.get(i).getLeval()%></td>
	        <td><a href="emUpdate.jsp?eid=<%=list.get(i).getId()%>&ename=<%=list.get(i).getName()%>&epwd=<%=list.get(i).getPassword()%>
	        	&eage=<%=list.get(i).getAge()%>&etel=<%=list.get(i).getTel()%>&eidcard=<%=list.get(i).getIdcard()%>
	        	" class="tablelink">编辑</a>
	        	<a href="EmDelServlet?eid=<%=list.get(i).getId()%>" class="tablelink">删除</a></td>
        </tr>
        
        <%}%>
        </tbody>
        
    </table>
    </form>
   
 <div class="pagin">
    	<%if(nowP==1){%>
    		<ul class="paginList">
	        <li class="paginItem"><a href="EmployListServlet?nowPage=1">首页</a></li>
	        <li class="paginItem"><a href="">上页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=nowP+1%>">下页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=totalPages%>">尾页</a></li>
	        </ul>
    	<%}else if(nowP==totalPages){%>
    		<ul class="paginList">
	        <li class="paginItem"><a href="EmployListServlet?nowPage=1">首页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=nowP-1%>">上页</a></li>
	        <li class="paginItem"><a href="">下页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=totalPages%>">尾页</a></li>
	        </ul>
    	<%}else{%>
    		<ul class="paginList">
	        <li class="paginItem"><a href="EmployListServlet?nowPage=1">首页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=nowP-1%>">上页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=nowP+1%>">下页</a></li>
	        <li class="paginItem"><a href="EmployListServlet?nowPage=<%=totalPages%>">尾页</a></li>
	        </ul>
    	<%}%>
        
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
