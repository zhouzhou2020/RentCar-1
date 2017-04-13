<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Car"
    %>
    <%
    Car c=new Car();
    
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
    <li><a href="#">车辆信息修改</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">车辆修改</a></li> 
    <li><a href="#tab2">自定义</a></li> 
  	</ul>
    </div> 
    <%
    String id=request.getParameter("id");
    %>
  	<div id="tab1" class="tabson">
    <form name="frm" method="post">
    <ul class="forminfo">
    <li><label>车辆状态<b>*</b></label>  

    <div class="vocation">
    <select class="select1" name="flag">
		<option value="0">待用</option>
		<option value="1">已出租</option>
		<option value="2">已出售</option>    	
    </select>
    <li><label>修改车牌号<b>*</b></label><input name="cid" type="text" class="dfinput" placeholder="请填写车牌号" value="<%=id%>"  style="width:518px;"/></li>
   	
   
    </div>
    </li>
    </div>
   
    <p><label>&nbsp;</label><input name="" type="button" class="btn" value="马上修改" onclick="fun()"/></p>
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
		document.frm.action="CarUpdateServlet";
		document.frm.submit();
	}
</script>
