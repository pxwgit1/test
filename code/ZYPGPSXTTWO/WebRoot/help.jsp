<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.TargetDao"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看忘记密码申请</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>帮助</li>
			<li style="float:right;"><a href="adminmain.jsp">返回</a></li>
		</ul>
	</div>

	<div class="formbody">
		您好！欢迎您使用该系统，下面是一些常用的指南，希望对您有帮助：<span/>
		1.管理员具有管理专家，管理指标，自定义指标，分配指标，重置提交忘记密码专家的密码，查看评审结果等功能<span/>
		2.专家具有对指标评分，查看催评信息等功能。<span/>
	  </div>
</body>

</html>
