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
<title>专家管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>专家管理</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="rightinfo">
		<table class="imgtable" method="post" action="DeleteServlet">
			<thead>
				<tr>
					<th>用户名</th>
					<th>邮箱</th>
					<th>角色</th>
					<th width="170px;">操作</th>
				</tr>
			</thead>
			<%
				UserDao dao = new UserDao();
				ArrayList userList = dao.findUsers();
				session.setAttribute("acList", userList);
			%>
			<c:forEach var="us" items="${acList}" varStatus="t">
				<tbody>
					<tr>
						<td>${us['username']}</td>
						<td>${us['email']}</td>
						<td>专家</td>
						<td>
							<ul class="toolbar">
								<li type="submit">
									<a href="DeleteServlet?userid=${us['userid']}">
									<span>
									<img src="images/t03.png" /></span>删除 </a>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>

		<table class="imgtable">
			<ul class="toolbar">
				<li><a href="adminadduser.jsp"> <span>
				<img src="images/t01.png" /></span>添加</a>
				</li>
			</ul>
		</table>
		<font color="red">温馨提示：当您添加专家成功后可以线下通知专家！</font>
</body>

</html>
