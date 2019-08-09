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
			<li>分配指标</li>
			<li>选择专家</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">指标管理</a></li>
				</ul>
			</div>

			<div id="tab2" class="tabson">
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist" id="showUserfp">
						<thead>
							<tr>
								<th><input name="chkMsgId" id="chkMsgId" type="checkbox" /></th>
								<th>用户名</th>
								<th>邮箱</th>
								<th>角色</th>
								<th>权限</th>
								<th style="display: none;">用户ID</th>
							</tr>
						</thead>
						<%
							//HttpSession session=request.getSession();
							//String targetid = request.getParameter("targetid");
							UserDao dao = new UserDao();
							ArrayList userList1 = dao.findUsers();
							session.setAttribute("acList1", userList1);
						%>
						<c:forEach var="us" items="${acList1}" varStatus="t">
							<tbody>
								<tr>
									<td><input name="checkIds" id="checkIds" type="checkbox"
										value="${us['userid']}" /></td>
									<td name="unames">${us['username']}</td>
									<td>${us['email']}</td>
									<td>专家</td>
									<td>权限</td>
									<td style="display: none;" id="ids">${us['userid']}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>

				</form>
				<div>
					<a href="" class="linktoTargetdistribute"> 确认分配</a>
				</div>
				<form action="" method="post" id="formid">
					<input type="hidden" name="sbbm" id="sbbm" /> <input type="hidden"
						name="checkedIds" id="checkedIds" />
				</form>
			</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		<script type="text/javascript">
		
			$(document).ready(function() {
				function GetQueryString(name) {
					var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
					var r = window.location.search.substr(1).match(reg);
					if (r != null) return (r[2]);
					return null;
				}
		
				var targetidone = GetQueryString("targetid");
				var targetid;
				if (targetidone != null) {
					targetid = decodeURIComponent(targetidone);
				}
		
				var targetlevelone = GetQueryString("targetlevel");
				var targetlevel;
				if (targetlevelone != null) {
					targetlevel = decodeURIComponent(targetlevelone);
				}
		
				var targettitleone = GetQueryString("targettitle");
				var targettitle;
				if (targettitleone != null) {
					targettitle = decodeURIComponent(targettitleone);
				}
		
				var targettypeone = GetQueryString("targettype");
				var targettype;
				if (targettypeone != null) {
					targettype = decodeURIComponent(targettypeone);
				}
		
				var targetflagone = GetQueryString("targetflag");
				var targetflag;
				if (targetflagone != null) {
					targetflag = decodeURIComponent(targetflagone);
				}
		
				var savetargetnameone = GetQueryString("savetargetname");
				var savetargetname;
				if (savetargetnameone != null) {
					savetargetname = decodeURIComponent(savetargetnameone);
				}
		
				var targeturlone = GetQueryString("targeturl");
				var targeturl;
				if (targeturlone != null) {
					targeturl = decodeURIComponent(targeturlone);
				}
		
				var fathertargetone = GetQueryString("fathertarget");
				var fathertarget;
				if (fathertargetone != null) {
					fathertarget = decodeURIComponent(fathertargetone);
				}
				
				//alert("fathertarget=="+fathertarget);
				$(".linktoTargetdistribute").click(function() {
					var checkIds = document.getElementsByName("checkIds");
					var usids="";
					var unames="";
					//alert(checkIds.length);
					for (var i = 0; i < checkIds.length; i++) {
						if (checkIds[i].checked) {
							usids += checkIds[i].value+",";
							unames += document.getElementsByName("unames")[i].innerText
							+",";
						}
					}
					$(".linktoTargetdistribute").attr("href", "TargetdistributeServlet?usids=" 
					+ usids + "&targetid=" + targetid);
 				});
			});
		</script>
	</div>
</body>

</html>
