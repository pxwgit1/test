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
			<li>查看忘记密码申请</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">查看忘记密码申请</a></li>
				</ul>
			</div>
			<div id="tab2" class="tabson">
				<form action="DowntargetServlet" method="post"
					enctype="multipart/form-data">
					<table class="tablelist">
						<thead>
							<tr>
								<th>申请专家姓名</th>
								<th>专家Email</th>
								<th>密码设定</th>
								<th>操作</th>
								<th style="display: none;">负责专家ID</th>
								
							</tr>
						</thead>
						<%
							//HttpSession session=request.getSession();
							
							//String loginusid = request.getParameter("loginusid");
 							//System.out.println("usergrade-jsp-loginusid=="+loginusid);
							UserDao dao = new UserDao();
							ArrayList forgetpasswordList = dao.FindForgetpassword();
							session.setAttribute("forgetpswdList", forgetpasswordList);
						%>

						<c:forEach var="us" items="${forgetpswdList}" varStatus="t">
							<tbody class="s2">
								<tr>
									<td>${us['username']}</td>
									<td>${us['email']}</td>
									<td><input type="text" name="newpassword"
										style="height: 25px;" class="newpasswords"></input>
									</td>
									<td>
										<a href="" class="linkToChongzhimm">重置密码</a>
									</td>
									<td id="ids" class="d1" style="display: none;">${us['userid']}</td>
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
				//document.getElementById("levelone").style.backgroundColor=red;
				//document.getElementById("bt1").style.backgroundColor=yellow;
// 				var times = 0;
// 				btn1.style.background = times % 2 == 0 ? 'red' : 'yellow';
//             	times++;
// 				if(document.getElementById("levelone").style.backgroundColor =="red"){
// 					document.getElementById("levelone").style.backgroundColor = "black";
// 				}else{
// 					document.getElementById("levelone").style.backgroundColor = "red";
// 				}
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
    		$(document).ready(function(){
      		 //点击链接的时候调用
     			$(".linkToChongzhimm").click(function(){
          		//得到input的值
	         		var ids = document.getElementById('ids');
	         		var newpsw = $(".newpasswords").val();
	         		$(".linkToChongzhimm").attr("href","ChongzhimmServlet?ids="+ids.innerText+"&newpsw="+newpsw);
     			});
     			
    		});
</script>
	  </div>
</body>

</html>
