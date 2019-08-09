<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>

</head>

<body
	style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox">
			<form action="LoginServlet" method="get">
				<ul>
					<li><input name="loginuser" id="loginuser" type="text"
						class="loginuser" value="admin" /></li>
					<li><input name="loginpwd" id="loginpwd" type="password"
						class="loginpwd" value="密码" /></li>
					<li><input name="submit" type="submit" class="loginbtn"
						value="登录" /><label>未注册? <a href="regist.jsp">去注册   </a><span style="display:inline-block;width: 5px;"></span><a href="" class="tablelink" id="forgetpassword">忘记密码？</a></label></li>
				  </ul>
			</form>
		</div>
		 <script type="text/javascript">
		 	$(document).ready(function(){
		 		$("#forgetpassword").click(function(){
 
          		//得到input的值
	         		var usname = $(".loginuser").val();
	          		//设置linkToCart的href的值
          	  		$("#forgetpassword").attr("href","ForgetpswServlet?usname="+usname);
     			});
		 	});
		 </script>
	</div>
</body>

</html>
