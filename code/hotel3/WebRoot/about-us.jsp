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
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">

    <!-- ========== SEO ========== -->
    <title>About Us</title>
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
                     <li><i class="fa  fa-phone"></i><a href="tel:18475555555"> 1-888-123-4567 </a></li>
                    <li class="email"><i class="fa  fa-envelope-o "></i> <a href="#">contact@site.com</a></li>  
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
						<li><a href="ShowRtypeServlet">房间类型</a></li>
						<li><a href="album.jsp">相册</a></li>
                        <li><a href="contact.jsp">联系我们</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- ========== PAGE TITLE ========== -->
        <div class="page_title gradient_overlay" style="background: url(images/page_title_bg.jpg);">
            <div class="container">
                <div class="inner">
                    <h1>酒店概况</h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">首页</a></li>
                        <li>酒店概况</li>
                    </ol>
                </div>
            </div>
        </div>

        <!-- ========== MAIN SECTION ========== -->
        <main id="about_us_page">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <!-- <h1 class="mb30">Since 1989</h1> -->
                        <p>酒店位于上海市徐汇区桂林路近钦州北路。酒店步行10分钟可辐射上海交通大学附属第六人民医院、博库书城、田林商圈，漕河泾高薪技术开发区。距光大会展中心、上海万人体育馆，徐家汇、光启城及新宜街约3公里，步行至9号线桂林路站仅8分钟，交通四通八达。汉庭2.0版更是风格清新，设备完善，舒适宜人。酒店引进意大利进口现磨咖啡供宾客休息品尝，无线全覆盖且大堂商务区设有苹果一体机供免费使用。酒店竭诚为您服务，让住宿成为您的享受！</p>

                        <p>置身于我们 301间精心设计、精美布置的客房和套房中，享受休闲放松、悠然自得的惬意夜晚。酒店外观焕然一新，可令您倍感舒适。此外，您还将享受到独立控制的中央空调系统和高速上网等便利设施。忙绿的一天之后，我们舒适无比的喜来登特色睡眠体验之床定将保证一夜好眠。</p>
                        <p>酒店共有 7 层行政楼层，设有行政酒廊，可供您举办商务和社交活动，是独具慧眼的商务旅客的理想之选。</p>
                        <p>总统套房的设计融合了时尚感以及四川文化的精髓，宛如一个精彩绝伦的艺术品。双层的总统套房位于第 35 和 36 层上，占地 350 平米，在这里您可以饱览绝美的城市全景。套房装饰采用柔和色调并突出了中国艺术的魅力，内部设有大客厅、可容纳多达 12 人的餐厅、设施齐全（如大酒窖和雪茄盒）的休息区、食品储藏室、两间卧室、一个起居室、步入式衣橱、设施齐全的浴室（带有按摩池、桑拿室、独立淋浴间）、液晶电视、特殊设施，并提供 24 小时管家服务。</p>
                    </div>
                    <div class="col-md-5">
                        <div class="about_img">
                            <img src="images/about.jpg" class="img1 img-responsive" alt="Image">
                            <img src="images/about.jpg" class="img2 img-responsive" alt="Image">
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <div class="countup_box">
                                    <div class="inner">
                                        <div class="countup number" data-count="301"></div>
                                        <div class="text">rooms</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <div class="countup_box">
                                    <div class="inner">
                                        <div class="countup number" data-count="150"></div>
                                        <div class="text">staffs</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <div class="countup_box">
                                    <div class="inner">
                                        <div class="countup number" data-count="6"></div>
                                        <div class="text">restaurant</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <div class="countup_box">
                                    <div class="inner">
                                        <div class="countup number" data-count="7"></div>
                                        <div class="text">pools</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row image-gallery">
                    <div class="col-md-3 col-sm-6 mt20 mb20 br2">
                        <a href="images/restaurant.jpg" class="hover_effect h_lightbox h_blue">
                            <img src="images/restaurant.jpg" class="img-responsive full_width br2" alt="Image">
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 mt20 mb20 br2">
                        <a href="images/spa.jpg" class="hover_effect h_lightbox h_blue">
                            <img src="images/spa.jpg" class="img-responsive full_width br2" alt="Image">
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 mt20 mb20 br2">
                        <a href="images/conference.jpg" class="hover_effect h_lightbox h_blue">
                            <img src="images/conference.jpg" class="img-responsive full_width br2" alt="Image">
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 mt20 mb20 br2">
                        <a href="images/swimming.jpg" class="hover_effect h_lightbox h_blue">
                            <img src="images/swimming.jpg" class="img-responsive full_width br2" alt="Image">
                        </a>
                    </div>
                </div>
                <!-- <p>酒店共有 7 层行政楼层，设有行政酒廊，可供您举办商务和社交活动，是独具慧眼的商务旅客的理想之选。 </p>
                <ul class="list_menu">
                    <li>24小时热水</li>
                    <li>免费瓶装水</li>
                    <li>免费洗漱用品</li>
                    <li> 客房Wifi覆盖</li>
                    <li> 独立卫生间</li>
                </ul>
                <p>酒店通常在14：00后开始办理入住，如果早到可能需要等待 </p> -->
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
                                        <li><i class="fa fa-envelope"></i> 邮箱 ：<a href="#">contact@site.com</a></li>
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
