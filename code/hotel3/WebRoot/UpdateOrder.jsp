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
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">

    <!-- ========== SEO ========== -->
    <title>Rooms List View</title>
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
                    <li><i class="fa fa-phone"></i><a href="tel:18475555555"> 1-888-123-4567 </a></li>
                    <li class="email hidden-xxs"><i class="fa fa-envelope-o "></i> <a href="mailto:contact@site.com">contact@site.com</a></li>
                    <li class="language-switcher">
                        <nav class="dropdown">                          
                                <i class="famfamfam-flag-gb "></i>English<b class="caret"></b>                         
                        </nav>
                    </li>
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
            </div>
        </header>
        
        <!-- =========== PAGE TITLE ========== -->
        <div class="page_title gradient_overlay" style="background: url(images/page_title_bg.jpg);">
            <div class="container">
                <div class="inner">
                    <h1>Rooms Order View</h1>
                    <ol class="breadcrumb">
                        <li>Rooms Order View</li>
                    </ol>
                </div>
            </div>
        </div>
        
        <!-- =========== MAIN ========== -->
        <main id="rooms_list">
           <!-- <div class="container"> -->
           <div>
              <!-- ITEM -->
             <!--  <article class="room_list"> -->
                 <article>
                 <div class="row row-flex">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>                         
                          <img src="images/rooms/single.jpg" class="img-responsive" alt="Image">                         
                       </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                       <div class="room_details row-flex">
                         <div class="col-md-9 col-sm-9 col-xs-12 room_desc">                             
                           <form action="UpdateServlet" method="post" name="form1"> 
    <c:forEach var="tro" items="${roomList}" varStatus="t">
    <form name="form1" method="post" action="UpdateServlet">   
	        房间类型:<input name="rtypeid" type="text" value="${tro['roomtype']}" size=20 readonly="readonly"/><br/><br>
		房间价格:<input name="rprice" type="text" value="${tro['rprice']}" size=20 readonly="readonly"/><br/><br>
		入住时间:<input name="livetime" type="text" id="datepicker" value="${tro['livetime']" size=20 "/><br/><br>
		退房时间:<input name="outtime" type="text" id="datepicker1" value="${tro['outtime']" /><br/><br>
		预定数目:<input name="num" type="text" value="${tro['num']}" size=20 "/>间<br/><br>
		联系电话:<input name="tel" type="text" value="${tro['tel']}" size=20 /><br/><br>					
  		订单编号:<input name="rtypeid" type="text" value="${tro['orderid']}" size=20 readonly="readonly"/><br/><br>
  		<input type="submit" name="sure" id="sure" value="修改">
  	</form>
  	</c:forEach>
                          </div>                     
                       </div>
                    </div>
                 </div>
              </article>
              <!-- ITEM -->
              <article class="room_list">
                 <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>
                          <div class="room_list_slider owl-carousel">
                             <div class="item">
                                <a href="room.html" class="hover_effect h_link h_blue"><img src="images/rooms/double1.jpg" alt="Image"></a>
                             </div>
                             
                          </div>
                       </figure>
                    </div>                      
                    </div>                
              </article>
              <!-- ITEM -->
              <article class="room_list">
                 <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>
                          <a href="room.html" class="hover_effect h_link h_blue">
                          <img src="images/rooms/delux.jpg" class="img-responsive" alt="Image">
                          </a>
                       </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                       <div class="room_details">
                          <div class="col-md-9 col-sm-9 col-xs-12 room_desc">
                             <h3><a href="room.html"> Delux Room </a></h3>
                             <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam.</p>
                             
                          </div>       
                       </div>
                    </div>
                 </div>
              </article>
              <!-- ITEM -->
              <article class="room_list">
                 <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>
                          <a href="room.html" class="hover_effect h_link h_blue">
                          <img src="images/rooms/king.jpg" class="img-responsive" alt="Image">
                          </a>
                       </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                       <div class="room_details">
                          <div class="col-md-9 col-sm-9 col-xs-12 room_desc">
                             <h3><a href="room.html"> King Room </a></h3>
                             <p> Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam.</p>
                             
                          </div>
                          
                       </div>
                    </div>
                 </div>
              </article>
              <!-- ITEM -->
              <article class="room_list">
                 <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>
                        
                          <img src="images/rooms/honeymoon.jpg" class="img-responsive" alt="Image">
                       
                       </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                       <div class="room_details">
                          <div class="col-md-9 col-sm-9 col-xs-12 room_desc">
                             <h3>Honeymoon Room </h3>
                             <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam.</p>
                             
                          </div>
                          
                       </div>
                    </div>
                 </div>
              </article>
              <!-- ITEM -->
              <article class="room_list">
                 <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>
                         
                          <img src="images/rooms/family.jpg" class="img-responsive" alt="Image">
                         
                       </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                       <div class="room_details">
                          <div class="col-md-9 col-sm-9 col-xs-12 room_desc">
                             <h3><a href="room.html"> Family Room </a></h3>
                             <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam.</p>
                             
                          </div>
                          
                       </div>
                    </div>
                 </div>
              </article>        
           </div>
        </main>

       

    </div>

    <!-- ========== BACK TO TOP ========== -->
    <div id="back_to_top">
        <i class="fa fa-angle-up" aria-hidden="true"></i>
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
