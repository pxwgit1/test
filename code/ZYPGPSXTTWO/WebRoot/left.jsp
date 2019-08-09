<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.UserDao"%>
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
			<%
				//HttpSession session=request.getSession();
				UserDao dao = new UserDao();
				ArrayList userList = dao.findUsers();
				session.setAttribute("acList", userList);
			%>
	<dl class="leftmenu">

		<dd>
			<div class="title">
				<span><img src="images/leftico01.png" /></span>管理信息
			</div>
			<ul class="menuson">
			
				<li><cite></cite><a href="index.jsp" target="rightFrame">系统首页</a><i></i></li>
				<li class="active"><cite></cite><a href="user.jsp" target="rightFrame">专家管理</a><i></i></li>
				<li><cite></cite><a href="target.jsp" target="rightFrame">指标管理</a><i></i></li>
				<li><cite></cite><a href="targetdistribbute.jsp" target="rightFrame">分配指标</a><i></i></li>
				<li><cite></cite><a href="admincuiping.jsp" target="rightFrame">管理员催评</a><i></i></li>
				<li><cite></cite><a href="ckpsjd.jsp" target="rightFrame">查看评审结果</a><i></i></li>
				<li><cite></cite><a href="ckwjmmsq.jsp" target="rightFrame">查看忘记密码申请</a><i></i></li>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="images/leftico03.png" /></span>编辑器
			</div>
			<ul class="menuson">
			<li class="active"><cite></cite><a href="targetedit.jsp" target="rightFrame">自定义指标</a><i></i></li>

			</ul>
		</dd>
	</dl>

</body>
</html>