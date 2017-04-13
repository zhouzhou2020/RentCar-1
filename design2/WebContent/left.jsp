<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Employ"
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
<%
String name=request.getParameter("name");
%>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>功能列表</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="CarListServlet" target="rightFrame">汽车管理</a>
            <i></i>
            </div>                
            <ul class="sub-menus">
            <li><a href="PinpaiSelectServlet" target="rightFrame">品牌操作</a></li>
            <li><a href="XinghaoSelectServlet" target="rightFrame">型号操作</a></li>
            </ul>
        </li>
        
         <li>
            <div class="header">
            <cite></cite>
            <a href="CustomListServlet"target="rightFrame">客户管理</a>
            <i></i>
            </div>                
            
        </li>
        
         <li>
            <div class="header">
            <cite></cite>
            <a href="EmployListServlet" target="rightFrame">员工管理</a>
            <i></i>
            </div>                
            
        </li>
        
         <li>
            <div class="header">
            <cite></cite>
            <a href="yingxiao.jsp" target="rightFrame">营销活动管理</a>
            <i></i>
            </div>                
            
        </li>
        
         <li>
            <div class="header">
            <cite></cite>
            <a href="welcome.jsp" target="rightFrame">订单管理</a>
            <i></i>
            </div>                
            <ul class="sub-menus">
            <li><a href="RentServlet" target="rightFrame">租赁订单</a></li>
            <li><a href="BuyServlet" target="rightFrame">购买订单</a></li>
            </ul>
        </li>
        
        </ul>    
    </dd>
    
    </dl>
    
</body>
</html>
