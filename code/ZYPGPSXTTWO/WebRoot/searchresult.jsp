<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>指标管理</title>
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
<style type="text/css">
	.start{
	 	cursor: pointer;
        color: #red;
        background: #b1b0b0;
        border: none;
	}
	.end{
		 cursor: pointer;
         color: #fff;
         background: #b1b0b0;
         border: none;
	}
	</style>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>管理信息</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">指标搜索</a></li>
				</ul>
			</div>
			<div id="tab2" class="tabson">
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist">
						<thead>
							<tr>
								<th>指标编号<i class="sort"><img src="images/px.gif" /></i></th>
								<th>指标的父级指标</th>
								<th>附件名称</th>
								<th>指标内容描述</th>
								<th>评审开通</th>
								<th>操作</th>

							</tr>
						</thead>
						
						<c:forEach var="tar" items="${searchtg}" varStatus="t">
							<tbody>
								<tr>
									<td>${tar['tutargetid']}</td>
									<td>${tar['targettype']}</td>
									<td>${tar['targetname']}</td>
									<td>${tar['targettitle']}</td>
									<td>${tar['flag']}</td>
									<td><a href="DowntargetServlet?flieName=${tar['savetargetname']}&fliePath=${tar['targeturl']}" class="tablelink" name="submit" type="submit">查看</a>
									<a href="DeletetargetServlet?targetid=${tar['targetid']}" class="tablelink"> 删除</a></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
		
		<script type="text/javascript">
			
			function levelone(){
				window.location.href="TargetLevelServlet?level=1";
			}
			function leveltwo(){
				window.location.href="TargetLevelServlet?level=2";
			}
			function levelthree(){
				window.location.href="TargetLevelServlet?level=3";
			}
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		<script type="text/javascript">
      		 //点击链接的时候调用
     			function findtarget() { 
     				var idfindtargets = document.getElementById('idfindtargets').value;
					alert("000"+idfindtargets);
					window.location.href="SearchTargetServlet?searchname="+idfindtargets;
				}
     			
    		
</script>
	</div>
</body>

</html>
