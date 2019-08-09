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
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">奖金管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">产品管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>				
			</ul>
        </div>
	
  <div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 添加房间</ul>     
      <dl class="am-icon-home" style="float: right;"> 当前位置： <a herf="manager.jsp">管理员首页</a> > <a herf="">房间管理</a> >添加房间 </dl>    
    </div>
	
    <div class="fbneirong">
      <form class="am-form" action="AddRoomServlet" method="get">
        <div class="am-form-group am-cf">
          <div class="zuo">房间编号：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="doc-ipt-email-1" name="roomID" placeholder="请输入房间编号">
          </div>
        </div>
	<div class="am-form-group am-cf">
          <div class="zuo">房间类型：</div>
          <div class="you">
              <select name="roomType" data-am-selected="{btnSize: 'sm'}">
         		<c:forEach var="tp" items="${type}" varStatus="t">
         			<option value="${tp.key}" >${tp.value}</option>	         
        		</c:forEach>
         	 </select>
          </div>
        </div>

       <div class="am-form-group am-cf">
          <div class="zuo">房间名称：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="doc-ipt-email-1" name="roomName" placeholder="请输入房间名称">
          </div>
        </div>
              
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
          </div>
        </div>
      </form>
    </div>
    
	 <div class="foods">
	  <dl>
	    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
	  </dl>
	 </div>

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