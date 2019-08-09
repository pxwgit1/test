<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="head" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Amaze UI Admin index Examples</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="assets/css/admin.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/app.js"></script>
</head>
<body>
<head:tagOne></head:tagOne>
 <div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="manager.jsp">管理员首页 </a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="Exit">退出登录</a></button></li>	
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="index.jsp">主页</a></button></li>			
			</ul>	
         </div>
         
      <div class="admin">
      
		  <div class="admin-index">
		     <dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
		        <dt class="qs"><i class="am-icon-users"></i></dt>
		        <dd><c:out value="${u }"></c:out></dd>
		        <dd class="f12">注册人数</dd>
		      </dl>
		      <dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
		        <dt class="cs"><i class="am-icon-area-chart"></i></dt>
		        <dd><c:out value="${v }"></c:out></dd>
		        <dd class="f12">会员人数</dd>
		      </dl>
		      <dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
		        <dt class="hs"><i class="am-icon-shopping-cart"></i></dt>
		        <dd><c:out value="${r }"></c:out></dd>
		        <dd class="f12">房间数量</dd>
		      </dl>
		      <dl data-am-scrollspy="{animation: 'slide-right', delay: 900}">
		        <dt class="ls"><i class="am-icon-cny"></i></dt>
		        <dd><c:out value="${o }"></c:out></dd>
		        <dd class="f12">订单总数</dd>
		      </dl>
           </div>
	    <div class="admin-biaoge">
	      <div class="xinxitj">信息概况</div>
	      <table class="am-table">
	        <thead>
	          <tr>
	            <th>团队统计</th>
	            <th>全部会员</th>
	            <th>全部未激活</th>
	            <th>今日新增</th>
	            <th>今日未激活</th>
	            <th>今日新增</th>
	            <th>今日未激活</th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>普卡</td>
	            <td>普卡</td>
	            <td><a href="#">4534</a></td>
	            <td>+20</td>
	            <td> 4534 </td>
	          </tr>
	          <tr>
	            <td>银卡</td>
	            <td>银卡</td>
	            <td>4534</td>
	            <td>+2</td>
	            <td> 4534 </td>
	          </tr>
	          <tr>
	            <td>金卡</td>
	            <td>金卡</td>
	            <td>4534</td>
	            <td>+10</td>
	            <td> 4534 </td>
	          </tr>
	          <tr>
	            <td>钻卡</td>
	            <td>钻卡</td>
	            <td>4534</td>
	            <td>+50</td>
	            <td> 4534 </td>
	          </tr>
	          <tr>
	            <td>合计</td>
	            <td>合计</td>
	            <td>4534</td>
	            <td>+50</td>
	            <td> 4534 </td>
	          </tr>
	        </tbody>
	      </table>    
	    </div>
   
      <script type="text/javascript">jQuery(".slideTxtBox").slide();</script> 
    </div>
    
    <div class="foods">
    	<ul>版权所有@2015 .模板收集自 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> -  More Templates<a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></ul>
    	<dl><a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a></dl> 	
    </div>
    
</div>


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>
</html>