<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
<!-- <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>  

  -->

 <link href="jquery-ui  1.8\jquery ui\css\smoothness\jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"/>
 <script src="jquery/1.4/jquery.min.js"></script> 
 <script src="jquery-ui  1.8\jquery ui\js\jquery-ui-1.8.16.custom.min.js"></script>
     
<script type="text/javascript"> 
$(function() { 
//$("#datepicker").datepicker(...);//代表带着...属性直接执行创建datepicker() 
//必须先init datepicker才能再设置datepicker的option 
//$("#datepicker").datepicker('option',...,...);//代表设置datepicker的...的属性值为...,但不执行创建datepicker(); 
//$.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
$("#datepicker").datepicker(); 
$("#datepicker").datepicker('option', $.datepicker.regional['zh-CN']); 
//$("#datepicker").datepicker($.datepicker.regional['zh-CN']);//该句执行失效，因为之前有$("#datepicker").datepicker();了 
$("#datepicker").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
//var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );//get dateFormat 
//$("#datepicker").datepicker('option', {dateFormat: 'yy-mm-dd'});//set dateFormat 
}); 
</script> 
<script type="text/javascript"> 
$(function() { 
//$("#datepicker").datepicker(...);//代表带着...属性直接执行创建datepicker() 
//必须先init datepicker才能再设置datepicker的option 
//$("#datepicker").datepicker('option',...,...);//代表设置datepicker的...的属性值为...,但不执行创建datepicker(); 
//$.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
$("#datepicker1").datepicker(); 
$("#datepicker1").datepicker('option', $.datepicker.regional['zh-CN']); 
//$("#datepicker").datepicker($.datepicker.regional['zh-CN']);//该句执行失效，因为之前有$("#datepicker").datepicker();了 
$("#datepicker1").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
//var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );//get dateFormat 
//$("#datepicker").datepicker('option', {dateFormat: 'yy-mm-dd'});//set dateFormat 
}); 
</script>

    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">

    <!-- ========== SEO ========== -->
    <title>Single Room</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta content="" name="author">

    <!-- ========== FAVICON ========== -->
    <link rel="apple-touch-icon-precomposed" href="images/favicon-apple.png" />
    <link rel="icon" href="images/favicon.png">

    <!-- ========== STYLESHEETS ========== -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="revolution/css/layers.css" rel="stylesheet" type="text/css" />
    <link href="revolution/css/settings.css" rel="stylesheet" type="text/css" />
    <link href="revolution/css/navigation.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-select.min.css" rel="stylesheet" type="text/css">
    <link href="css/animate.min.css" rel="stylesheet" type="text/css">
    <link href="css/famfamfam-flags.css" rel="stylesheet" type="text/css">
    <link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
    <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/responsive.css" rel="stylesheet" type="text/css">

    <!-- ========== ICON FONTS ========== -->
    <link href="fonts/font-awesome.min.css" rel="stylesheet">
    <link href="fonts/flaticon.css" rel="stylesheet">

    <!-- ========== GOOGLE FONTS ========== -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900%7cRaleway:400,500,600,700" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
	.roomshow{
	width:100%;
	background-color:#CCF; 
	}
	</style>
</head>

<body>

    <div id="smoothpage" class="wrapper">

        <!-- ========== TOP MENU ========== -->
        <div class="top_menu">
            <div class="container">
                <div class="welcome_mssg hidden-xs">
                    Welcome to Zante Hotel Hotel
                </div>
                <ul class="top_menu_right">
                    <li><i class="fa  fa-phone"></i><a href="tel:18475555555"> 1-888-123-4567 </a></li>
                    <li class="email"><i class="fa  fa-envelope-o "></i> <a href="mailto:contact@site.com">contact@site.com</a></li>  
                    <li><a href="signIn.jsp">登录</a></li>
                    <li><a href="signUp.jsp">注册</a></li>                   
                </ul>
            </div>
        </div>

        <!-- ========== HEADER ========== -->
        <header class="fixed">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle mobile_menu_btn" data-toggle="collapse" data-target=".mobile_menu" aria-expanded="false">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">
                        <img src="images/logo.svg" height="32" alt="Logo">
                    </a>
                </div>
                <nav id="main_menu" class="mobile_menu navbar-collapse">
                    <ul class="nav navbar-nav">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="about-us.jsp">酒店概况</a></li>
						<li><a href="RtypeServlet">房间预订</a></li>
						<li><a href="album.jsp">相册</a></li>
                        <li><a href="contact.jsp">联系我们</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- =========== PAGE TITLE ========== -->
        <div class="page_title gradient_overlay" style="background: url(images/page_title_bg.jpg);">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <h1>查看留言</h1>
                            <ol class="breadcrumb">
                                <li><a href="RtypeServlet">主页</a></li>
                                
                            </ol>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- =========== MAIN ========== -->
         <main id="room_page"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                    <div class="sidebar">
                            <aside class="widget">
                                <div class="vbf">
                 		 			<h2 class="form_title"><i class="fa fa-calendar"></i> 查看留言</h2>
                                    	<form >
											<table width="300" border="1">
  												<tr>
  													<!-- <td width="100">索引</td> -->
    												<td width="50" height="29">留言标题</td>
    												<td width="50">留言内容</td>
 												</tr>
  												<c:forEach var="lmessage" items="${leavemessageList}" varStatus="s">
  												<tr>
  													<%-- <td>${s['index']}</td> --%>
  													<td>${lmessage['rtitle']}</td>
  													<td>${lmessage['rmessage']}</td> 					
  												</tr>
  												</c:forEach>
  											</table>
  										<td><a href="Leavemassage.jsp"><input type="button" value="发表留言" /></a></td>	
  										
  										</form>
                                </div>
                            </aside>
                       </div>
                    </div>
                    <div class="col-md-8">
                        <div class="slider">
                            <div id="slider-larg" class="owl-carousel image-gallery">
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room1.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room1.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room2.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room2.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room3.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room3.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room4.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room4.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room5.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room5.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room6.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room6.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room7.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room7.jpg" alt="Image">
                                    </a>
                                </div>
                                <!-- ITEM -->
                                <div class="item  lightbox-image-icon">
                                    <a href="images/rooms/single-room/single-room8.jpg" class="hover_effect h_lightbox h_blue">
                                        <img class="img-responsive" src="images/rooms/single-room/single-room8.jpg" alt="Image">
                                    </a>
                                </div>
                            </div>
                            <div id="thumbs" class="owl-carousel">
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb1.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb2.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb3.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb4.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb5.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb6.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb7.jpg" alt="Image"></div>
                                <!-- ITEM -->
                                <div class="item"><img class="img-responsive" src="images/rooms/single-room/single-room-thumb8.jpg" alt="Image"></div>
                            </div>
                        </div>      
                    </div>
                </div>
            </div>
        </main>

        <!-- ========== FOOTER ========== -->
            <footer>
                <div class="inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 col-sm-6 widget">
                                <div class="about">
                                    <a href="index.jsp"><img class="logo" src="images/logo.svg" height="32" alt="Logo"></a>
                                </div>
                            </div>
                              <div class="col-md-3 col-sm-6 widget"></div>                         
                            <div class="col-md-3 col-sm-6 widget">
                                <h5>Contact Us</h5>
                                <address>
                                    <ul class="address_details">
                                        <li><i class="glyphicon glyphicon-map-marker"></i> 25, Navagio Zakynthos, Greece</li>
                                        <li><i class="glyphicon glyphicon-phone-alt"></i> Phone: 800 123 3456 </li>             
                                        <li><i class="fa fa-envelope"></i> Email: <a href="mailto:info@site.com">contact@site.com</a></li>
                                    </ul>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="subfooter">
                    <div class="container">
                        <div class="row">
                         <div class="col-md-6 col-sm-6">
                           </div>                 
                            <div class="col-md-6 col-sm-6">
                                <div class="social_media">
                                    <a class="facebook" data-original-title="Facebook" data-toggle="tooltip" href="#"><i class="fa fa-facebook"></i></a>
                                    <a class="twitter" data-original-title="Twitter" data-toggle="tooltip" href="#"><i class="fa fa-twitter"></i></a>
                                    <a class="googleplus" data-original-title="Google Plus" data-toggle="tooltip" href="#"><i class="fa fa-google-plus"></i></a>
                                    <a class="pinterest" data-original-title="Pinterest" data-toggle="tooltip" href="#"><i class="fa fa-pinterest"></i></a>
                                    <a class="linkedin" data-original-title="Linkedin" data-toggle="tooltip" href="#"><i class="fa fa-linkedin"></i></a>
                                    <a class="instagram" data-original-title="Instagram" data-toggle="tooltip" href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>            
        </div> 

   
    <!-- ========== JAVASCRIPT ========== -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!---<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyBDgMJEPio2qomUKV1iqlIufj4u2NVd3q4"></script>--->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="js/jquery.smoothState.js"></script>
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/morphext.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.thumbs.min.js"></script>
    <script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="js/jPushMenu.js"></script>
    <script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="js/countUp.min.js"></script>
    <script type="text/javascript" src="js/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

</body>

</html>
