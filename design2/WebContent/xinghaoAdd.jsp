<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Car"
    %>
    <%
    Car c=new Car();
  
    ArrayList<Car> list=c.getAllPinpai2();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>

    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index">首页</a></li>
    <li><a href="#">型号添加</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">发布型号</a></li> 
    <li><a href="#tab2">自定义</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    <form name="frm" method="post">
    <ul class="forminfo">
    <li><label>品牌<b>*</b></label>  

    <div class="vocation">
    <select class="select1" name="pinpai">
    	<%for(int i=0;i<list.size();i++){%>
    		<option value="<%=list.get(i).getPid()%>"><%=list.get(i).getPinpai() %></option>
    	<%}%>
    </select>
    <li><label>型号名称<b>*</b></label><input name="xinghao" type="text" class="dfinput" placeholder="填写型号名称"  style="width:518px;"/></li>
   	<li><label>设定进价<b>*</b></label><input name="jinjia" type="text" class="dfinput" placeholder="请填写进价"  style="width:518px;"/></li>
   	<li><label>设定售价<b>*</b></label><input name="shoujia" type="text" class="dfinput" placeholder="请填写售价"  style="width:518px;"/></li>
   	<li><label>设定租金<b>*</b></label><input name="zujin" type="text" class="dfinput" placeholder="请填写日租金"  style="width:518px;"/></li>
   	<li><label>设定押金<b>*</b></label><input name="yajin" type="text" class="dfinput" placeholder="请填写押金"  style="width:518px;"/></li>
   	
   
    </div>
    </li>
    </div>
   
    <p><label>&nbsp;</label><input name="" type="button" class="btn" value="马上添加" onclick="fun()"/></p>
    </ul>
    </form>
    </div> 
    	</div>
    
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    </div>


</body>

</html>
<script>
	function fun(){
		document.frm.action="XinghaoAddServlet";
		document.frm.submit();
	}
</script>
