<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
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
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script language="javascript">  
  
 		function fun(){
 			var str1=document.getElementById('booking-checkin').value;
 			var str2=document.getElementById('booking-checkout').value;
 			window.location.href="SearchServlet?booking-checkin="+str1+"&&booking-checkout="+str2;
 			//document.thisform.submit();
		}
		function fun1(){
 			var str1=document.getElementById('checkin').value;
 			var str2=document.getElementById('checkout').value;
 			window.location.href="SearchServlet?checkin="+str1+"&&checkout="+str2;
 			//document.thisform.submit();
		}  
  
	</script>
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
                    <li class="email hidden-xxs"><i class="fa fa-envelope-o "></i> <a href="#">contact@site.com</a></li>
                    <!-- <li class="language-switcher">
                        <nav class="dropdown">
                            <a href="#" class="dropdown-toggle select" data-hover="dropdown" data-toggle="dropdown">
                                <i class="famfamfam-flag-gb "></i>English<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="famfamfam-flag-gr"></i>Ελληνικά</a></li>
                                <li><a href="#"><i class="famfamfam-flag-it"></i>Italiano</a></li>
                                <li><a href="#"><i class="famfamfam-flag-de"></i>Deutsch</a></li>
                                <li><a href="#"><i class="famfamfam-flag-fr"></i>Français</a></li>
                                <li><a href="#"><i class="famfamfam-flag-es"></i>Español</a></li>
                            </ul>
                        </nav>
                    </li> -->
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
						<li><a href="RtypeServlet">房间类型</a></li>
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
                    <h1>房间类型</h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">主页</a></li>
                        <li>房间类型</li>
                    </ol>
                </div>
            </div>
        </div>
        
        
        <section><!-- class="lightgrey_bg" id="features"-->
        	<div class="vbf">
                            <h2 class="form_title"><i class="fa fa-calendar"></i> 网上预订</h2>
                            
                            <form id="booking-form" action="SearchServlet" method="get" class="inner">
                                <div class="form-group col-md-6 col-sm-6 col-xs-12 nopadding">
                                    <div class="input-group">
                                        <div class="form_date">
                                            <input type="text" id="checkin" name="checkin" class="datepicker form-control md_noborder_right"  placeholder="入住时间" readonly/> <!-- class="datepicker form-control md_noborder_right" -->
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-sm-6 col-xs-12 nopadding">
                                    <div class="input-group">
                                        <div class="form_date">
                                            <input type="text" id="checkout" name="checkout" class="datepicker form-control"  placeholder="离开时间" readonly/><!-- class="datepicker form-control" -->
                                        </div>
                                    </div>
                                </div>
                                
                                <input onclick="fun1()" class="button btn_lg btn_blue btn_full" type="button" value="搜索" />
                               
                            </form>
                        </div>
         </section>
        
        
        
        
        <!-- =========== MAIN ========== -->
        <main id="rooms_list">
           <div class="container">
              <!-- ITEM -->
              <c:forEach var="rtlist" items="${searchList}" varStatus="rt">
              <article class="room_list">
                 <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                       <figure>
                          <!-- <a href="room.html" class="hover_effect h_link h_blue"> -->
                          <img src="photos/${rtlist['rphoto']}" class="img-responsive" alt="Image">
                          </a>
                       </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                       <div class="room_details">
                          <div class="col-md-9 col-sm-9 col-xs-12 room_desc">
                             <h3><a href="room.html"> ${rtlist['rtype']} </a></h3>
                             <p>${rtlist.rdescription}</p>
                             <!-- <div class="room_services">
                                <i class="fa fa-coffee" data-toggle="popover" data-placement="top" data-trigger="hover" data-content="免费提供早餐" data-original-title="早餐"></i>
                                <i class="fa fa-wifi" data-toggle="popover" data-placement="top" data-trigger="hover" data-content="免费无线上网" data-original-title="无线"></i>
                                <i class="fa fa-cutlery" data-toggle="popover" data-placement="top" data-trigger="hover" data-content="提供免费早餐" data-original-title="酒店用餐"></i>
                                <i class="fa fa-television" data-toggle="popover" data-placement="top" data-trigger="hover" data-content="提供等离子电视" data-original-title="等离子电视"></i>
                             </div> -->
                          </div>
                          <div class="col-md-3 col-sm-3 col-xs-12 room_price">
                             <div class="room_price_inner">
                                <span class="room_price_number"> ¥${rtlist.rprice}  </span>
                                
                                <!-- 判断是否有折扣 -->
                                <c:choose>
                                	<c:when test="${Float.parseFloat(rtlist.discount)<10.0}">
                                		<small class="upper"> 会员折扣：${rtlist['discount']} 折</small>
                                	</c:when>
                                </c:choose>
                                <a href="user-order.jsp?rtype=${rtlist['rtype']}&rprice=${rtlist.rprice}&rtypeid=${rtlist.typeid}" class="button  btn_blue btn_full upper">立即预定</a>
                                
                             </div>
                          </div>
                       </div>
                    </div>
                 </div>
              </article>
              </c:forEach>
              
            
              <!-- <nav class="a_center">
                    <ul class="pagination mt50 mb0">
                        <li class="prev_pagination"><a href="#"><i class="fa fa-angle-left"></i></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li class="next_pagination"><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
              </nav> -->
               
           </div>
        </main>

        <!-- ========== FOOTER ========== -->
        <footer>
            <div class="inner">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 widget">
                            <div class="about">
                                <a href="index.html"><img class="logo" src="images/logo.svg" height="32" alt="Logo"></a>
                                <p>置身于我们301间精心设计、精美布置的客房和套房中，享受休闲放松、悠然自得的惬意夜晚。</p>
                                <p>酒店竭诚为您服务，让住宿成为您的享受！</p>
                            </div>
                        </div>
                       <!--  <div class="col-md-3 col-sm-6 widget">
                            <h5>Latest News</h5>
                            <ul class="blog_posts">
                                <li><a href="blog-post.html">Live your myth in Greece</a> <small>AUGUST 13, 2017</small></li>
                                <li><a href="blog-post.html">Zante Hotel in pictures</a> <small>AUGUST 16, 2017</small></li>
                                <li><a href="blog-post.html">Zante Hotel family party</a> <small>SEPTEMBER 15, 2017</small></li>
                            </ul>
                        </div> -->
                        <div class="col-md-3 col-sm-6 widget">
                            <h5>相关信息</h5>
                            <ul class="useful_links">
                                <li><a href="about-us.jsp">酒店概况</a></li>
                                <li><a href="#">服务与设施</a></li>
                                <li><a href="#">酒店位置</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 col-sm-6 widget">
                            <h5>联系我们</h5>
                            <address>
								<ul class="address_details">
									<!-- <li><i class="glyphicon glyphicon-map-marker"></i> 25, Navagio Zakynthos, Greece</li> -->
									<li><i class="glyphicon glyphicon-phone-alt"></i> 电话: 800 123 3456 </li>
									<li><i class="fa fa-fax"></i> 传真: 800 123 3456</li>
									<li><i class="fa fa-envelope"></i> 邮箱: contact@site.com</li>
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
                            <div class="copyrights">
                                 Copyright &copy; 2017.Company name All rights reserved.
                            </div>
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

