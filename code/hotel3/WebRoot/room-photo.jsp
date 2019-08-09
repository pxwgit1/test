<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="head" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Amaze UI Admin index Examples</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="assets/css/admin.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/app.js"></script>
<script type="text/javascript" src="js/function.js"></script>
</head>
<body>
<head:tagOne></head:tagOne>


         <div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="manager.jsp">管理员首页 </a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="Exit">退出登录</a></button></li>	
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="index.jsp">主页</a></button></li>			
			</ul>	
         </div>

 <!-- 添加图片start --> 
    <div class="am-popup am-popup-inner" id="up-photo">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">新增图片</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
            
      <div class="am-popup-bd">     
        <form  class="am-form tjlanmu" action="upPhotoServlet" method="post" enctype="multipart/form-data" name="pform">  
             <div style="height: 20%"> </div> 
               <input type="hidden" name="aid1"/>  
             <div style="float: left;margin-left: 60px"><input type="file" name="photo" class="am-btn am-btn-success"/> </div> 
             <div style="float: left;margin-left: 5px"><input type="submit" value="确认上传" class="am-btn am-btn-secondary am-radius"/></div>  
        </form>
      
      </div>
    </div>
 <!-- 添加图片end --> 
	
	
<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">   
	   <ul class="am-icon-flag on"> <c:out value="${a.getA_name() }"></c:out></ul>  
	    <dl class="am-icon-home" style="float: right;">  当前位置： <a href="manager.jsp">管理员首页</a> > <a href="">房间管理</a> > <a href="room-album.jsp">房间相册</a> > 相册展示 </dl>   
        <dl>
           <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" onclick="upPhoto(${a.getA_id()})" data-am-modal="{target: '#up-photo'}">新增图片</button>
        </dl>   
    </div>   
  
    
    <form class="am-form am-g" action="" method="get" name="form2">   
        <c:forEach var="plist" items="${plist }" varStatus="pl">
          <div style="float: left;margin-left: 20px;margin-top: 30px">      
          <p>图片ID：${plist.p_id }</p>
          <p>图片名称：${plist.p_name }</p>       
           <img src="photos/${plist.p_name }" width="200px" height="200px" class="am-btn-default am-btn-xs am-text-secondary" title="${plist.p_name }"  ><br>
            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round" onclick="delPhoto(${plist.p_id })"><span class="am-icon-trash-o"></span> 删除</button>        
         </div>
        </c:forEach>   
          
    </form> 
      
    <div class="foods">
      <dl>
       <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
      </dl>
    </div>
    
</div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->

</body>
</html>