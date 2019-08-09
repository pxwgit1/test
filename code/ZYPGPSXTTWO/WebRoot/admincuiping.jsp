<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.TargettoUserDao"%>
<%@page import="dao.TargetDao"%>
<%@page import="model.TargettoUser"%>
<%@page import="model.target"%>
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
<title>管理员催评</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>管理员催评</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">管理员催评</a></li>
				</ul>
			</div>

			<div id="tab2" class="tabson">
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist">
						<thead>
							<tr>
								<th>指标等级<i class="sort"><img src="images/px.gif" /></i></th>
								<th>催评情况</th>
								<th>催评时间</th>
								<th>距上次催评</th>
								<th>专家姓名</th>
								<th>指标的父级指标</th>
								<th>指标内容</th>
								<th>评分状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<%
							TargettoUserDao dao1 = new TargettoUserDao();
							ArrayList targettouserList1 = dao1.cuipingfindTargettouser();
							session.setAttribute("cuipzhjList", targettouserList1);
						%>

						<c:forEach var="ts" items="${cuipzhjList}" varStatus="t">
							<tbody class="s2">
								<tr>
									<td id="ids" class="d1">${ts['targetlevel']} 级</td>
									<td>${ts['cpqingk']}</td>
									<td>${ts['cuipingcreatetime']}</td>
									<td>${ts['cuipingshijiancha']}</td>
									<td>${ts['username']}</td>
									<td>${ts['targettype']}</td>
									<td>${ts['targettitle']}</td>
									<td>暂未评分</td>
									<td>
									<a href="CuipingServlet?index=${ts['tuserid']}&flag=${ts['targetuserid']}" class="tablelink" name="submit" type="submit">催促评价</a>
									<a href="XianXCuipingServlet?index=${ts['tuserid']}&flag=${ts['targetuserid']}" class="tablelink" name="submit" type="submit">线下联系</a>
									</td>
								</tr>
							</tbody>
						</c:forEach>

					</table>
				</form>
				<font color="red">温馨提示：当您多次催评无效果时可以线下联系专家！</font>
			</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		 
	</div>
</body>

</html>
