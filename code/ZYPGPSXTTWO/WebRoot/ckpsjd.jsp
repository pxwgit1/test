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
<title>查看评审结果</title>
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
			<li>首页</li>
			<li>查看评审结果</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">管理员催评</a></li>
				</ul>
			</div>
			<div>
				<ul>
					<li>
						<button name="levelone" id="levelone" type="submit" onclick="levelone()">计算机学院</button>
						<button name="leveltwo" id="leveltwo" type="submit" onclick="leveltwo()">二级指标</button>
						<button name="levelthree" id="levelthree" type="submit" onclick="levelthree()">三级指标</button>
					</li>
				</ul>
			</div>
			<div id="tab2" class="tabson">
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist">
						<thead>
							<tr>
								<th>指标编号<i class="sort"><img src="images/px.gif" /></i></th>
								<th>指标等级</th>
								<th>指标父级指标</th>
								<th>附件名称</th>
								<th>指标内容描述</th>
								<th>总分</th>
								<th style="display: none;">负责专家ID</th>
								<th style="display: none;">负责专家姓名</th>
								
							</tr>
						</thead>

						<c:forEach var="ts" items="${targetListpsjg}" varStatus="t">
							<tbody class="s2">
								<tr>
									<td id="ids" class="d1">${ts['targetid']}</td>
									<td>${ts['targetlevel']} 级</td>
									<td>${ts['targettype']}</td>
									<td>${ts['targetname']}</td>
									<td>${ts['targettitle']}</td>
									<td>${ts['sum']}</td>
									<td style="display: none;">${ts['tuserid']}</td>
									<td style="display: none;">${ts['username']}</td>
								  </tr>
							</tbody>
						</c:forEach>

					</table>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			function levelone(){
				window.location.href="TargetPsjgServlet?level=1";
			}
			function leveltwo(){
				window.location.href="TargetPsjgServlet?level=2";
			}
			function levelthree(){
				window.location.href="TargetPsjgServlet?level=3";
			}
			$("#usual1 ul").idTabs();
		</script>
		
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		 
	</div>
</body>

</html>
