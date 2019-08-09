<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Sign up</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="login/css/bootstrap.min.css">
	<link rel="stylesheet" href="login/css/animate.css">
	<link rel="stylesheet" href="login/css/style.css">

	<!-- Modernizr JS -->
	<script src="login/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="login/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body class="style-3">

		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center"></div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form action="SignUpServlet" class="fh5co-form animate-box" data-animate-effect="fadeIn" method="get" name="form">
						<h2>注册</h2>
						<div class="form-group">
							<label for="uname" class="sr-only">用户名</label>
							<input type="text" class="form-control" id="uname" name="uname" placeholder="用户名" autocomplete="off">
						</div>
					
						<div class="form-group">
							<label for="upwd" class="sr-only">密码</label>
							<input type="password" class="form-control" id="upwd" name="upwd" placeholder="密码" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="re-pwd" class="sr-only">确认密码</label>
							<input type="password" class="form-control" id="re-pwd" name="re-pwd"  placeholder="确认密码" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="relname" class="sr-only">真实姓名</label>
							<input type="text" class="form-control" id="relname" name="relName" placeholder="真实姓名" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="telNum" class="sr-only">联系电话</label>
							<input type="text" class="form-control" id="telNum" name="telNum" placeholder="联系电话" autocomplete="off">
						</div>
						<div class="form-group">
							性别：<select data-am-selected="{btnSize: 'sm'}" name="gender" id="gender">
				              <option value="男">男</option>
				              <option value="女">女</option>  
				            </select>
							<!-- <input type="text" class="form-control" id="gender" name="gender" placeholder="性别" autocomplete="off"> -->
						</div>
			
						<div class="form-group">
							<label for="email" class="sr-only">邮箱</label>
							<input type="text" class="form-control" id="email" name="email" placeholder="邮箱" autocomplete="off">
						</div>
						<div class="form-group">
							<p>已注册? <a href="signIn.jsp">登录</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="Sign Up" class="btn btn-primary">
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
			<div class="row" style="padding-top: 60px; clear: both;">
				<div class="col-md-12 text-center"></div>
			</div>
		</div>
	
	<!-- jQuery -->
	<script src="login/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="login/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="login/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="login/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="login/js/main.js"></script>

	</body>
</html>

