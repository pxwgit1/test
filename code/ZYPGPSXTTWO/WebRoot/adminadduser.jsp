<%@ page language="java" pageEncoding="utf-8"%>

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
<script type="text/javascript">
	window.onload = function() {
		var checkuname = false;
		var checkpassword = false;
		var checkrepassword = false;
		var checkemail = false;
		reguser.onblur = function() {
			var usernametip = document.getElementById("usernametip");
			var username = document.getElementById("reguser");
			//ajax焦点离开输入框，判断用户名是否存在
			$.post("RegistCheckServlet","reguser="+username.value,function(result){
			if(result.length>0){
			usernametip.setAttribute("class", "input_error");
			usernametip.innerHTML="用户名已经存在！";
			}
			});
			
			var length = username.value.length;
			if (length > 14 || length < 3 || username.value.trim == "") {
				usernametip.innerHTML = "长度不符合要求";
				usernametip.setAttribute("class", "input_error");
				checkuname = false;
			} else {
				usernametip.innerHTML = "";
				usernametip.setAttribute("class", "input_ok");
				checkuname = true;
			}
		};
		//校验密码
		$("#regpwd").blur(
			function() {
				if ($("#regpwd").val().length < 3
					|| $("#regpwd").val().length > 14) {
					$("#passwordtip").html("密码长度不符合要求");
					$("#passwordtip").attr("class", "input_error");
					checkpassword = false;
				} else {
					$("#passwordtip").html("");
					$("#passwordtip").attr("class", "input_ok");
					checkpassword = true;
				}
			});
		//校验邮箱格式
		$("#email").blur(function() {
			var input = $("#email").val();
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			if (reg.test(input)) {
				$("#emailtip").html("");
				$("#emailtip").attr("class", "input_ok");
				checkemail = true;
			} else {
				$("#emailtip").html("邮箱格式不正确");
				$("#emailtip").attr("class", "input_error");
				checkemail = false;
			}
		});
		//提交按钮绑定点击事件，根据校验结果判断是否提交
		$("#add").click(function() {
			if (checkemail && checkuname) {
				$("#form1").submit();
			}
		});
	};
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
  
    <div class="loginbody">
    <span class="systemlogo"></span> 
    <div class="loginbox">
    <form action="AdminadduserServlet" method="post" id="form1">
	    <ul>
	    <li>用户名:<input name="reguser" type="text" id="reguser"/><span id="usernametip"
						class="input_desc" style="display:inline-block;color: red;">不超过14个字节(中文，数字，字母和下划线)</span></li>
	    <li>密码:<input name="regpwd" type="password" id="regpwd"/><span
						id="passwordtip" class="input_desc" onblur="check_passwd()"
						style="display:inline-block;color: red;">长度3-14位，字母区分大小写</span></li>
	    <li>邮箱:
	    	<input name="email" type="text" id="email" /><span id="emailtip" class="input_desc"
						style="display:inline-block;color: red;">请输入正确的电子邮箱地址</span></li>
	    
<!-- 	   	<li>邮箱:<input name="email" type="text" id="email"/></li> -->
		<li style="width: 800px;height: 12px;"><input type="button"
						class="loginbtn" id="add" value="添加" onclick="test()" />
<!-- 	    <li><input name="submit" type="submit" class="loginbtn" value="添加"/></li> -->
	 	</ul>
    </form>
    </div>
    </div>
</body>

</html>
