<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.TargettoUserDao"%>
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
<title>指标自定义</title>
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
			<li>专家评分</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">专家评分</a></li>
				</ul>
			</div>

			<div id="tab2" class="tabson">
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist">
						<thead>
							<tr>
								<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
								<th>指标等级</th>
								<th>指标所属类型</th>
								<th>附件名称</th>
								<th>指标内容描述</th>
								<th>评审开通</th>
								<th>操作</th>
							</tr>
						</thead>
						<%
							//HttpSession session=request.getSession();
							
							String loginusid = request.getParameter("loginusid");
 							System.out.println("usergrade-jsp-loginusid=="+loginusid);
							TargettoUserDao dao = new TargettoUserDao();
							ArrayList targettouserList = dao.FindTargettouserByloginId(loginusid);
							session.setAttribute("asList", targettouserList);
						%>

						<c:forEach var="ts" items="${asList}" varStatus="t">
							<tbody class="s2">
								<tr>
									<td id="ids" class="d1">${ts['targetuserid']}</td>
									<td>${ts['targetlevel']} 级</td>
									<td>${ts['targettype']}</td>
									<td>${ts['targetname']}</td>
									<td>${ts['targettitle']}</td>
									<td>${ts['flag']}</td>
									<td>
										<a href="SearchsoreServlet?index=${ts['targetuserid']}&loginuname=${ts['username']}&loginusid=${ts['tuserid']}" class="tablelink" name="submit" type="submit">打分</a>
										<a href="DowntargetServlet?flieName=${ts['savetargetname']}&fliePath=${ts['targeturl']}" class="tablelink" name="submit" type="submit">查看</a>
									</td>
								</tr>
							</tbody>
						</c:forEach>

					</table>
				</form>
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
