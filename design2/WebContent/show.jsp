<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,bean.Youhui"
    %>
    <%
    if(session.getAttribute("key")==null){
    	response.sendRedirect("shouye.jsp");
    }
    Object name=session.getAttribute("key");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="我要买车-汽车详情" />
<title>我要买车-汽车详情</title>
<link type="text/css" rel="stylesheet" href="a/css/global.css" />
<script src="a/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="a/js/slide.js"></script>
<!--[if lt IE 7]>
<script type="text/javascript" src="js/unitpngfix.js"></script>
<![endif]-->
</head>
<%
ArrayList<Youhui> list=(ArrayList<Youhui>)request.getAttribute("yh");
%>
<body>
<div class="headbg">
  <div class="header">
    <ul class="logareg">
      <li><a href="#"><%=name %></a></li>
      <li class="lineli">|</li>
      <li><a href="#">注册</a></li>
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
<div class="container">
  <div class="nav"><a href="index.html">首页</a> &gt; 我要买车 &gt; 汽车详情</div>
  <div class="con_car">
    <div class="title"></div>
    <div class="detail">
      <div class="top_car">
        <div class="news_flash">
          <div id="featured"> 
            <!--标签开始 -->
            <div class="slideshowItem" id="image_xixi-01" style="opacity: 1; display: block;"> <a href="#" class="open" > <img src="a/images/tp_flash.jpg"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <!--标签结束 -->
            <div class="slideshowItem" id="image_xixi-02" style="opacity: 0; display: none;"><a href="#"> <img src="a/images/tp_flash2.jpg"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <div class="slideshowItem" id="image_xixi-03" style="opacity: 0; display: none;"><a  href="#" ><img src="a/images/tp_flash3.jpg"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <div class="slideshowItem" id="image_xixi-04" style="opacity: 0; display: none;"> <a href="#"> <img src="a/images/tp_flash.jpg"> </a> <
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <div class="slideshowItem" id="image_xixi-05" style="opacity: 0; display: none;"> <a href="#"> <img src="a/images/tp_flash2.jpg"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
          </div>
          <div id="thumbs">
            <ul>
              <li class="first btnPrev"><img id="play_prev" src="a/images/button_l.jpg"></li>
              <li class="slideshowItem"><a id="thumb_xixi-01" href="#image_xixi-01" class="current"><img src="a/images/li.jpg"> </a></li>
              <li class="slideshowItem"><a id="thumb_xixi-02" href="#image_xixi-02"><img src="a/images/li1.jpg"></a></li>
              <li class="slideshowItem"><a id="thumb_xixi-03" href="#image_xixi-03"><img src="a/images/li2.jpg"></a></li>
              <li class="slideshowItem"><a id="thumb_xixi-04" href="#image_xixi-04"><img src="a/images/li3.jpg"></a></li>
              <li class="slideshowItem"><a id="thumb_xixi-05" href="#image_xixi-05"><img src="a/images/li4.jpg"></a></li>
              <li class="last btnNext"><img id="play_next" src="a/images/button_r.jpg"></li>
            </ul>
          </div>
          <script type="text/javascript">
			var target = ["xixi-01","xixi-02","xixi-03","xixi-04","xixi-05"];
		</script> 
        </div>
        <div class="top_car_detail">
          <%for(int i=0;i<list.size();i++){%>
          		开始时间：<%=list.get(i).getStartTime()%>&nbsp;结束时间：<%=list.get(i).getEndTime()%><br/>
          		<%=list.get(i).getContent()%>
          <%}%>
        </div>
      </div>
      <div class="jingxs">
        <div class="title_jx">相关经销商</div>
        <div class="detail_jx">
          <ul>
            <li><img src="a/images/tp2.jpg" width="117" height="117">
              <div class="con_jx">
                <p class="name">南京大有4S店</p>
                <p>南京大有4S汽车保养快修店</p>
                <p>地址：南京市江宁区双龙大道180号    221400</p>
                <p>电话：025-8666666666</p>
                <p><a href="#" class="green_a">了解详情>></a></p>
              </div>
            </li>
            <li><img src="a/images/tp2.jpg" width="117" height="117">
              <div class="con_jx">
                <p class="name">南京大有4S店</p>
                <p>南京大有4S汽车保养快修店</p>
                <p>地址：南京市江宁区双龙大道180号    221400</p>
                <p>电话：025-8666666666</p>
                <p><a href="#" class="green_a">了解详情>></a></p>
              </div>
            </li>
          </ul>
          <ul>
            <li><img src="a/images/tp2.jpg" width="117" height="117">
              <div class="con_jx">
                <p class="name">南京大有4S店</p>
                <p>南京大有4S汽车保养快修店</p>
                <p>地址：南京市江宁区双龙大道180号    221400</p>
                <p>电话：025-8666666666</p>
                <p><a href="#" class="green_a">了解详情>></a></p>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
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