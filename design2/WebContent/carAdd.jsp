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
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">汽车添加</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">发布汽车</a></li> 
    <li><a href="#tab2">自定义</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    <form name="frm" method="post">
    <ul class="forminfo">
    <li><label>品牌<b>*</b></label></li>  

    <div class="vocation">
    <select class="select1" name="pinpai" onchange="getSelected(this)">
    	<%for(int i=0;i<list.size();i++){%>
    		<option value="<%=list.get(i).getPid()%>"><%=list.get(i).getPinpai() %></option>
    	<%}%>
    </select>
    </div>
    <li><label>型号<b>*</b></label></li>
    <div class="vocation">
    	<select class="select1" name="xinghao" id="xinghao">
    	</select>
    </div>
    <li><label>汽车车牌号<b>*</b></label><input name="chepai" type="text" class="dfinput" placeholder="填写型号名称"  style="width:518px;"/></li>
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
 
<script>
	function getSelected(temp){
		
		var xmlHttpReq=new XMLHttpRequest();
		var url="ShowXinghaoServlet?pindex="+temp.value;
		xmlHttpReq.open("get",url,true);
		xmlHttpReq.onreadystatechange=function(){
			if(xmlHttpReq.status==200 && xmlHttpReq.readyState==4){
				
				$("#xinghao").html("全部");
				var obj=eval('('+xmlHttpReq.responseText+')');	//通过eval函数把json数据转换为javascript对象
				
				for(i=0;i<obj.length;i++){
					
					$("#xinghao").append("<option value="+obj[i].xid+">"+obj[i].xname+"</option>");
				}
				
			}
		}
		xmlHttpReq.send(null);
	}
	function showXinghao(temp){
		alert(temp.value);
	}
	</script>


</body>
	
</html>
<script>
	function fun(){
		document.frm.action="CarAddServlet";
		document.frm.submit();
	}
</script>
