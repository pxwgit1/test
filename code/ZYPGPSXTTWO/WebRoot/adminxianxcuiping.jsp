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
			<li>线下催评</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">管理员线下催评</a></li>
				</ul>
			</div>

			<div id="tab2" class="tabson">
				管理员你好，未参加评审的专家联系方式如下，您可以线下联系！
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist">
						<thead>
							<tr>
								<th>专家姓名</th>
								<th>email</th>
							</tr>
						</thead>
						
						<c:forEach var="ts" items="${xianxcuipingList}" varStatus="t">
							<tbody class="s2">
								<tr>
									<td>${ts['username']}</td>
									<td>${ts['email']}</td>
								  </tr>
							</tbody>
						</c:forEach>

					</table>
				</form>
			</div>
		</div>
	  </div>
</body>

</html>
