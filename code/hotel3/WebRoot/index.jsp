<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>

<%@page import="dao.RoomDao"%>
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
    <title>Home</title>
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
  		function func(){
  			window.location.href="activityServlet";
  		}
</script>
</head>

<body>
    
    <!-- ========== PRELOADER ========== -->
   <!--  <div id="loading">
        <div class="inner">
            <div class="loading_effect">
                <div class="object" id="object_one"></div>
                <div class="object" id="object_two"></div>
                <div class="object" id="object_three"></div>
            </div>
        </div>
    </div>
     -->
    <div class="wrapper">
        
        <!-- ========== TOP MENU ========== -->
        <div class="top_menu transparent hidden-xs">
            <div class="container">
                <ul class="top_menu_right">
                    <li><i class="fa  fa-phone"></i><a href="tel:18475555555"> 1-888-123-4567 </a></li>
                    <li class="email"><i class="fa  fa-envelope-o "></i> <a href="mailto:contact@site.com">contact@site.com</a></li>  
                    <li><a href="signIn.jsp">登录</a></li>
                    <li><a href="signUp.jsp">注册</a></li>            
                </ul>
            </div>
        </div>
        
        <!-- ========== HEADER ========== -->
        <header class="fixed transparent">
            <div class="container">
                <div class="navbar-header">
                   <!--  <button type="button" class="navbar-toggle mobile_menu_btn" data-toggle="collapse" data-target=".mobile_menu" aria-expanded="false">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->
                    <a class="navbar-brand light" href="index.jsp">
                        <img src="images/logo_light.svg" height="32" alt="Logo">
                    </a>
                    <a class="navbar-brand dark nodisplay" href="index.jsp">
                        <img src="images/logo.svg" height="32" alt="Logo">
                    </a>
                </div>
                <nav id="main_menu" class="mobile_menu navbar-collapse">
                    <ul class="nav navbar-nav">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="about-us.jsp">酒店概况</a></li>
						<li><a href="ShowRtypeServlet">房间类型</a></li>
						<li><a href="album.jsp">相册</a></li>
                        <li><a href="contact.jsp">联系我们</a></li>
                        <li><a href="Checkmessage">留言</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- ========== REVOLUTION SLIDER ========== -->
        <div id="hero" class="rev_slider gradient_slider" style="display:none">
            <ul>
                
                <li data-index="rs-214" 
                    data-delay="1000" 
                    data-transition="fade" 
                    data-slotamount="7" 
                    data-easein="default" 
                    data-easeout="default" 
                    data-masterspeed="100" 
                    data-rotate="0" 
                    data-saveperformance="off" 
                    data-title="Slide" 
                    data-description="">
                    <!-- IMAGE -->
                    <img src="images/slider/hero.jpg" alt="Image" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>
                    <!-- LAYER NR. 1 --> 
                     <div class="tp-caption"
                         data-x="['left','left','left','center']" 
                         data-hoffset="['15','15','15','0']" 
                         data-y="['190','200','200','200']"
                         data-responsive_offset="on" 
                         data-fontsize="['40','28','28','22']" 
                         data-lineheight="['40','28','28','22']"
                         data-whitespace="nowrap"
                         data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                         style="color: #fff; font-weight: 700; font-family: 'Raleway', sans-serif;; ">欢迎您的到来, <span id="text_rotating">超值的享受, 舒适的房间, 难忘之旅</span>
                    </div>
                    <!-- LAYER NR. 2 --> 
                    <div class="tp-caption tp_m_title"
                         data-visibility="['on','on','off','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['15','15','15','15']" 
                         data-y="['280','middle','middle','middle']" 
                         data-voffset="['-60','-60','-60','-60']" 
                         data-fontsize="['28','28','23','23']" 
                         data-lineheight="['28','28','23','23']" 
                         data-frames='[{"delay":1000,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-star-o"></i>
                    </div>
                    <!-- LAYER NR. 3 --> 
                    <div class="tp-caption tp_m_title" 
                         data-visibility="['on','on','off','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['55','45','45','45']" 
                         data-y="['280','middle','middle','middle']" 
                         data-voffset="['-60','-60','-60','-60']" 
                         data-responsive_offset="on" 
                         data-fontsize="['28','28','23','23']" 
                         data-lineheight="['28','28','23','23']" 
                         data-frames='[{"delay":1150,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-star-o"></i>
                    </div>
                    <!-- LAYER NR. 4 --> 
                    <div class="tp-caption tp_m_title"
                         data-visibility="['on','on','off','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['95','75','75','75']" 
                         data-y="['280','middle','middle','middle']" 
                         data-voffset="['-60','-60','-60','-60']" 
                         data-responsive_offset="on" 
                         data-fontsize="['28','28','23','23']" 
                         data-lineheight="['28','28','23','23']"
                         data-frames='[{"delay":1300,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-star-o"></i>
                    </div>
                    <!-- LAYER NR. 5 --> 
                    <div class="tp-caption tp_m_title"
                         data-visibility="['on','on','off','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['135','105','105','105']" 
                         data-y="['280','middle','middle','middle']"
                         data-voffset="['-60','-60','-60','-60']" 
                         data-responsive_offset="on" 
                         data-fontsize="['28','28','23','23']" 
                         data-lineheight="['28','28','23','23']"
                         data-frames='[{"delay":1450,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-star-o"></i>
                    </div>
                    <!-- LAYER NR. 6 --> 
                    <div class="tp-caption tp_m_title" 
                         data-visibility="['on','on','off','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['175','135','135','135']" 
                         data-y="['280','middle','middle','middle']"
                         data-voffset="['-60','-60','-60','-60']" 
                         data-responsive_offset="on" 
                         data-fontsize="['28','28','23','23']"
                         data-lineheight="['28','28','23','23']"
                         data-frames='[{"delay":1600,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-star-o"></i>
                    </div>
                    <!-- LAYER NR. 7 --> 
                    <div class="tp-caption tp_m_title"
                         data-visibility="['on','on','off','off']"
                         data-x="left" 
                         data-hoffset="['215','175','175','175']" 
                         data-y="['280','middle','middle','middle']"
                         data-voffset="['-60','-60','-60','-60']" 
                         data-responsive_offset="on" 
                         data-fontsize="['30','30','25','25']" 
                         data-lineheight="['30','30','25','25']"
                         data-frames='[{"delay":1750,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'>
                    </div>
                    <!-- LAYER NR. 8 --> 
                    <div class="tp-caption tp_s_title"
                         data-visibility="['on','on','on','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['15','15','15','15']" 
                         data-y="['350','middle','top','top']"
                         data-voffset="['50','50','300','300']" 
                         data-responsive_offset="on" 
                         data-fontsize="['20','20','20','15']"
                         data-lineheight="['20','20','20','15']"
                         data-frames='[{"delay":2000,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-check-square-o"></i> 现代化设计的房间 &宽敞的套房
                    </div>
                    <!-- LAYER NR. 9 --> 
                    <div class="tp-caption tp_s_title"
                         data-visibility="['on','on','on','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['15','15','15','15']" 
                         data-y="['400','middle','top','top']"
                         data-voffset="['80','100','350','350']" 
                         data-responsive_offset="on" 
                         data-fontsize="['20','20','20','15']"
                         data-lineheight="['20','20','20','15']" 
                         data-frames='[{"delay":2200,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-check-square-o"></i> 一场美食餐饮体验
                    </div>
                    <!-- LAYER NR. 10 --> 
                    <div class="tp-caption tp_s_title"
                         data-visibility="['on','on','on','off']"
                         data-x="['left','left','left','left']" 
                         data-hoffset="['15','15','15','15']" 
                         data-y="['450','middle','top','top']"
                         data-voffset="['110','150','400','400']" 
                         data-responsive_offset="on" 
                         data-fontsize="['20','20','20','15']" 
                         data-lineheight="['20','20','20','15']"
                         data-frames='[{"delay":2400,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]'><i class="fa fa-check-square-o"></i> 便利交通，超值居住体验
                    </div>                
                     <!-- LAYER NR. 14 --> 
                    <div class="tp-caption"
                    	 data-x="['right','right','center','center']" 
                         data-hoffset="['15','15','0','0']" 
                         data-y="['200','middle','bottom','bottom']"
                         data-voffset="['','50','50','']"
                         data-width="[368, 368, 768, 480]" 
                         data-height="[auto, auto, auto, auto]"
                         data-frames='[{"delay":3000,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"}]' 
                         style="z-index: 99;"><!-- class="tp-caption" --> 
                         
                        <!-- ========== BOOKING FORM ========== -->
                        <div class="vbf">
                            <h2 class="form_title"><i class="fa fa-calendar"></i> 网上预订</h2>
                            
                            <form id="booking-form" action="SearchServlet" method="get" class="inner">
                                <div class="form-group col-md-6 col-sm-6 col-xs-12 nopadding">
                                    <div class="input-group">
                                        <div class="form_date">
                                            <input type="text" id="checkin" name="checkin" class="datepicker form-control md_noborder_right"  placeholder="入住时间" readonly/> <!-- class="datepicker form-control md_noborder_right" -->
                                        	<!-- <input type="text" name="booking-checkin"/> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-sm-6 col-xs-12 nopadding">
                                    <div class="input-group">
                                        <div class="form_date">
                                            <input type="text" id="checkout" name="checkout" class="datepicker form-control"  placeholder="离开时间" readonly/><!-- class="datepicker form-control" -->
                                        	<!-- <input type="text" name="booking-checkout"/> -->
                                        </div>
                                    </div>
                                </div>
                                
                                <input onclick="fun1()" class="button btn_lg btn_blue btn_full" type="button" value="搜索" />
                               
                            </form>
                        </div>
                    </div>
                    <!-- LAYER NR. 15  -->
                    <!-- <div class="tp-caption"
                         data-visibility="['on','on','off','off']"
                         data-x="['center','center','center','center']" 
                         data-hoffset="['0','0','0','0']" 
                         data-y="['bottom','bottom','bottom','bottom']" 
                         data-voffset="['20','20','20','20']" 
                         data-width="none" 
                         data-height="none" 
                         data-whitespace="nowrap" 
                         data-transform_idle="o:1;" 
                         data-transform_in="opacity:0;s:500;e:Power2.easeInOut;" 
                         data-transform_out="opacity:0;s:300;s:300;" 
                         data-start="8000" 
                         data-splitin="none" 
                         data-splitout="none" 
                         data-actions='[{"event":"click","action":"scrollbelow","offset":"px"}]' 
                         data-responsive_offset="on" 
                         data-startslide="0" 
                         data-endslide="2" 
                         style="z-index: 11; white-space: nowrap; font-size: 22px; line-height: 30px; font-weight: 400; color: rgba(245, 245, 245, 1.00);text-transform:left;cursor:pointer;">
                        <div class="rs-looped rs-slideloop" data-easing="Power2.easeInOut" data-speed="1" data-xs="0" data-xe="0" data-ys="-5" data-ye="5"><i class="fa fa-angle-down"></i></div>
                    </div> -->
                </li>
                
            </ul>
        </div> 
  
  		 <%
  		 	//HttpSession session=request.getSession();
			RoomDao dao=new RoomDao();
			ArrayList rtypeList=dao.findActivity();
			session.setAttribute("acList", rtypeList); 
  		 %>             
        <!-- ========== FEATURES ========== -->
        <section class="lightgrey_bg" id="features">
            <div class="container">
                <div class="main_title mt_wave a_center">
                    <h2>特惠活动，超值服务</h2>
                </div>
                <p class="main_description a_center">天天有惊喜！！</p>
                
                <div class="row">
                    <div class="col-md-7">
                        <div data-slider-id="features" id="features_slider" class="owl-carousel">
                        	<c:forEach var="rtlist" items="${acList}" varStatus="rt">
                            <div><img src="photos/${rtlist['rphoto']}" class="img-responsive" alt="Image"></div>
                            </c:forEach>
                            
                            
                           <!--  <div><img src="images/spa.jpg" class="img-responsive" alt="Image"></div>
                            <div><img src="images/conference.jpg" class="img-responsive" alt="Image"></div>
                            <div><img src="images/swimming.jpg" class="img-responsive" alt="Image"></div> -->
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="owl-thumbs" data-slider-id="features">
                        
                        	<c:forEach var="rtlist" items="${acList}" varStatus="rt">
                        	
                            	<div class="owl-thumb-item">
                                	<span class="media-left"><i class="flaticon-food"></i></span>
                                	<div class="media-body">
                                    	<h5>${rtlist['rtype']}</h5>
                                    	<p>${rtlist['discount']}折</p>
                                	</div>
                            	</div>
                            </c:forEach>
                            
                            
                            
                            <!-- <div class="owl-thumb-item">
                                <span class="media-left"><i class="flaticon-person"></i></span>
                                <div class="media-body">
                                    <h5>单人标间</h5>
                                    <p>8.9折，活动时间2017.6.4-2017.7.4</p>
                                </div>
                            </div>
                            <div class="owl-thumb-item">
                                <span class="media-left"><i class="flaticon-business"></i></span>
                                <div class="media-body">
                                    <h5>双人标间</h5>
                                    <p>8.9折，活动时间2017.6.4-2017.7.4</p>
                                </div>
                            </div>
                            <div class="owl-thumb-item">
                                <span class="media-left"><i class="flaticon-beach"></i></span>
                                <div class="media-body">
                                    <h5>家庭房</h5>
                                    <p>8.9折，活动时间2017.6.4-2017.7.4</p>
                                </div>
                            </div> -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
 
        
            <!-- ========== FOOTER ========== -->
            <footer>
                <div class="inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 col-sm-6 widget">
                                <div class="about">
                                    <a href="index.jsp"><img class="logo" src="images/logo.svg" height="32" alt="Logo"></a>
                                	<p>置身于我们301间精心设计、精美布置的客房和套房中，享受休闲放松、悠然自得的惬意夜晚。</p>
                                	<p>酒店竭诚为您服务，让住宿成为您的享受！</p>
                                </div>
                            </div>
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
                                        <li><i class="fa fa-envelope"></i> 邮箱: <a href="mailto:info@site.com">contact@site.com</a></li>
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

    <!-- ========== REVOLUTION SLIDER ========== -->
    <script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>

</body>
</html>
