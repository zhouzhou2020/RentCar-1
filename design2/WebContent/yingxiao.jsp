<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%
String path=getServletContext().getContextPath();
%>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path %>/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path %>/ueditor/ueditor.all.js"></script>

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
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">营销活动</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">发布活动</a></li> 
    
  	</ul>
    </div> 
    <form action="YingxiaoServlet" method="post">
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">
    <li><label>结束时间<b>*</b></label><input name="etime" type="text" class="dfinput" placeholder="年-月-日 时:分:秒"  style="width:518px;"/></li>
    <li><label>活动内容<b>*</b></label>
    

    <textarea id="container" name="container" style="width: 800px; height: 400px; margin: 0 auto;">
	</textarea>
	<script type="text/javascript">
		var ue = UE.getEditor("container");
	</script>
    
    </li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="马上发布"/></li>
    </ul>
    
    </div> 
    </form>
    
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    </div>

</body>

</html>
