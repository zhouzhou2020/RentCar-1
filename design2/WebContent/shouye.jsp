<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="首页" />
<title>首页</title>
<link type="text/css" rel="stylesheet" href="a/css/global.css" />
<script src="a/js/jquery-1.7.min.js"></script>
<!--[if lt IE 7]>
<script type="text/javascript" src="a/js/unitpngfix.js"></script>
<![endif]-->
<script>
$(document).ready(function()
{ 
 $(".slvh").each(function(){ 
 var maxwidth=28; 
 if($(this).text().length>maxwidth){ 
 $(this).text($(this).text().substring(0,maxwidth)); 
 $(this).html($(this).html()+' ...'); 
 } }); });
 
$(document).ready(function()
{ 
 $(".ywzsdes").each(function(){ 
 var maxwidth=140; 
 if($(this).text().length>maxwidth){ 
 $(this).text($(this).text().substring(0,maxwidth)); 
 $(this).html($(this).html()+' ...'); 
 } }); }); 
 

</script>
</head>
<%Object name=request.getAttribute("name"); 
  String a="登陆";
  if(name!=null){
	  session.setAttribute("key", name);
  }
%>
<body>
 
<div class="headbg">
  <div class="header">
    <ul class="logareg">
   		
      <li><a href="qiantai.jsp"><%if(name==null){%>
    	<%=a %>
      <%}else{%><%=name%><%}%>
      </a></li>
      <li class="lineli">|</li>
      <li><a href="login.jsp">后台</a></li>
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
<div class="bannbg">
  <div class="banner">
    <div class="quicknav"> <span class="quktit">品牌展示</span>
      <div class="quklogo"> <a href="#"><img src="a/images/b1.png" alt="" title="" /></a> <a href="#"><img src="a/images/b2.png" alt="" title="" /></a> <a href="#"><img src="a/images/b3.png" alt="" title="" /></a> <a href="#"><img src="a/images/b4.png" alt="" title="" /></a> <a href="#"><img src="a/images/b5.png" alt="" title="" /></a> <a href="#"><img src="a/images/b6.png" alt="" title="" /></a> <a href="#"><img src="a/images/b7.png" alt="" title="" /></a> </div>
      <span class="qukmore"><a href="#">MORE &gt;&gt;</a></span>
      <div class="clear"></div>
    </div>
    <div class="quilink"> <a class="a1" href="#"></a> <a class="a2" href="#"></a> <a class="a3" href="#"></a> </div>
    <div class="quilink_sec"> <a href="#"></a> </div>
  </div>
</div>
<div class="container">
  <div class="conlinone">
    <div class="zncompan">
      <h1>租赁公司</h1>
      <ul>
        <li><a href="#">富安达运输有限公富安达运输有限公司富安达运输有限公司司</a></li>
        <li><a href="#">福特嘉年华两厢</a></li>
        <li><a href="#">广州星海益达运输有限责任公司</a></li>
        <li><a href="#">富安达运输有限公司</a></li>
      </ul>
      <span class="qukmore_sec"><a href="#">More &gt;&gt;</a></span> </div>
    <div class="zncompan">
      <h1>二手车</h1>
      <ul>
        <li><a href="#">富安达运输有限公司</a></li>
        <li><a href="#">福特嘉年华两厢</a></li>
        <li><a href="#">广州星海益达运输有限责任公司</a></li>
        <li><a href="#">宝马530豪华配置带天窗530S宝马530豪华配置带天窗530S</a></li>
      </ul>
      <span class="qukmore_sec"><a href="#">More &gt;&gt;</a></span> </div>
    <div class="zncompan_thr">
      <h1>业务展示</h1>
      <div class="ywzs"> <img src="a/images/abimg.jpg" alt="" title="" />
        <p class="ywzsdes">汽车服务网站平台提供各种汽车保养和维修套餐及服务网站汽车服务网站平台提供各种汽车保养和维修套餐及服务网站会员可通过平台定制自己需要的服务。同时，网站平台定期推出各种优惠活动，敬请广大用户关会员可通过平台定制自己需要的服务。同时，网站平台定期推出各种优惠活的服务。同时，网站平台定期推出各种优惠活动，敬请广大用户关注的服务。同时，网站平台定期推出各种优惠活动，敬请广大用户关注动，敬请广大用户关注</p>
        <span class="qukmore_sec"><a href="#">More &gt;&gt;</a></span> </div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="copyrights">Collect from <a href="http://www.mycodes.net/"  title="网站模板">网站模板</a></div>
  <div class="conlintwo">
    <div class="contwotit">
      <h3>热门推荐 <a class="rmtjmore" href="#">More &gt;&gt;</a></h3>
    </div>
    <div class="contwonr">
      <ul>
        <li><a href="#"><img src="a/images/pro1.jpg" alt="" title="" /></a> <a href="#">
          <h3 class="slvh">2013款正品美国龟牌极限镀膜蜡T-32 汽车蜡新车腊镀膜</h3>
          </a> </li>
        <li><a href="#"><img src="a/images/pro1.jpg" alt="" title="" /></a> <a href="#">
          <h3 class="slvh">2013款正品美国龟牌极限镀膜蜡T-32 汽车蜡新车腊镀膜</h3>
          </a> </li>
        <li><a href="#"><img src="a/images/pro1.jpg" alt="" title="" /></a> <a href="#">
          <h3 class="slvh">2013款正品美国龟牌极限镀膜蜡T-32 汽车蜡新车腊镀膜</h3>
          </a> </li>
        <li><a href="#"><img src="a/images/pro1.jpg" alt="" title="" /></a> <a href="#">
          <h3 class="slvh">2013款正品美国龟牌极限镀膜蜡T-32 汽车蜡新车腊镀膜</h3>
          </a> </li>
        <li><a href="#"><img src="a/images/pro1.jpg" alt="" title="" /></a> <a href="#">
          <h3 class="slvh">2013款正品美国龟牌极限镀膜蜡T-32 汽车蜡新车腊镀膜</h3>
          </a> </li>
        <li><a href="#"><img src="a/images/pro1.jpg" alt="" title="" /></a> <a href="#">
          <h3 class="slvh">2013款正品美国龟牌极限镀膜蜡T-32 汽车蜡新车腊镀膜</h3>
          </a> </li>
      </ul>
    </div>
  </div>
  <div class="conlinthre">
    <div class="friendlink">
      <ul>
        <li><a href="#"><img src="a/images/fridlingk1.jpg" alt="" title="" />苏州新海宜通信科技</a></li>
        <li><a href="#"><img src="a/images/fridlingk2.jpg" alt="" title="" />中大集团</a></li>
        <li><a href="#"><img src="a/images/fridlingk3.jpg" alt="" title="" />壳牌喜力爱车保养中心</a></li>
      </ul>
      <span class="qukmore_four"><a href="#">MORE &gt;&gt;</a></span> </div>
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