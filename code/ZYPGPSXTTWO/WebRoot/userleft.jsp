<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.TargettoUserDao"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	})
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop">
		<span></span>管理项目
	</div>
	<dl class="leftmenu">
		<dd>
			<div class="title">
				<span><img src="images/leftico01.png" /></span>管理信息
			</div>
			<c:forEach var="us" items="${acList3}" varStatus="t">
			<ul class="menuson">
				<li><cite></cite><a href="index.jsp" target="rightFrame">系统首页</a><i></i></li>
				<li class="active"><cite></cite><a href="usergrade.jsp?loginusid=${us['userid']}" target="rightFrame">专家评分</a><i></i></li>
				<li><cite></cite><a href="userckcpxx.jsp?loginusid=${us['userid']}" target="rightFrame">查看信息</a><i></i></li>
			</ul>
			</c:forEach>
		</dd>
		
	</dl>

</body>
</html>