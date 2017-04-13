<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">员工添加</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>员工基本信息</span></div>
   
    <form name="frm" method="post">
	    <ul class="forminfo">
	    <li><label>员工姓名：</label><input name="ename" type="text" class="dfinput" "/><i>姓名不能超过五个字符</i></li>
	    <li><label>员工密码：</label><input name="epwd" type="password" class="dfinput" "/><i>密码长度不能超过十个</i></li>
	    <li><label>员工性别：</label><cite><input name="esex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="esex" type="radio" value="女" />女</cite></li>
	    <li><label>员工年龄：</label><input name="eage" type="text" class="dfinput" /></li>
	    <li><label>员工电话：</label><input name="etel" type="text" class="dfinput" ></li>
	    <li><label>员工身份证：</label><input name="eidcard" type="text" class="dfinput" ></li>
	   	<li><label>员工等级：</label><cite><input name="elv" type="radio" value="0">管理员&nbsp;&nbsp;&nbsp;&nbsp;<input name="elv" type="radio" value="1" checked="checked"/>员工</cite></li>
	    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认修改" onclick="fun()"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
<script>
	function fun(){
		document.frm.action="EmAddServlet";
		document.frm.submit();
	}
</script>
