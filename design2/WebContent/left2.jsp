<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Employ"
    %>
   <%String name=request.getAttribute("left").toString();
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>

</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>功能列表</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="HeadServlet?name=<%=name%>" target="rightFrame">个人信息</a><i></i></li>
        <li><cite></cite><a href="MimaServlet?name=<%=name%>" target="rightFrame">密码修改</a><i></i></li>
        <li><cite></cite><a href="HeadUpServlet?name=<%=name%>" target="rightFrame">头像上传</a><i></i></li>
        <li><cite></cite><a href="RentCarServlet?name=<%=name%>" target="rightFrame">租车历史纪录</a><i></i></li>
        <li><cite></cite><a href="BuyCarServlet?name=<%=name%>" target="rightFrame">买车历史纪录</a><i></i></li>
        <li><cite></cite><a href="BackServlet?name=<%=name%>" target="blank">回到首页</a><i></i></li>
        </ul>    
    </dd>
    </dl>
</body>
</html>
