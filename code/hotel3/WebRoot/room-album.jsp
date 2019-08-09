<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%@page import="service.PhotoService"%>
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
   <div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="manager.jsp">管理员首页 </a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="Exit">退出登录</a></button></li>	
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="index.jsp">主页</a></button></li>			
			</ul>	
         </div>

 <!-- 添加房间相册start --> 
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加相册</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form class="am-form tjlanmu" action="AddRoomAlbumServlet" method="get">
         <div class="am-form-group am-cf">
          <div class="zuo">相册名称：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="a_name" name="a_name" placeholder="请输入相册名称">
          </div>
        </div>	 
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
          </div>
        </div>
        </form>
        
      </div>
    </div>
 <!-- 添加房间相册end --> 

 <!-- 修改相册名称start --> 
  <div class="am-popup am-popup-inner" id="my-popups">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改相册</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
    <form class="am-form tjlanmu" action="EditRoomAlbumServlet" method="get" name="afrom">
       <div class="am-form-group am-cf">
          <div class="zuo">相册编号：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="aid" name="aid" readonly>
          </div>
        </div>
        
       <div class="am-form-group am-cf">
          <div class="zuo">相册名称：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="aname" name="aname">
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
          </div>
        </div>
        </form>
      </div>
    </div>
 <!-- 修改相册名称end --> 

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
      <ul class="am-icon-flag on"> 房间相册</ul>     
      <dl class="am-icon-home" style="float: right;"> 当前位置： <a href="manager.jsp">管理员首页</a> > <a herf="">房间管理</a> >房间相册</dl>   
      <dl>
        <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#my-popup'}">创建相册</button>
      </dl>   
    </div>
    
    <form class="am-form am-g" action="" method="get" name="form2">   
      <c:forEach var="album" items="${aList }" varStatus="a">
      
      <div class="am-btn-group am-btn-group-xs" style="margin-right: 15px;margin-top: 25px">
        <div style="width:100%">
           <input type="hidden" name="aid" value="${album.a_id }" id="aid"/> 
            <p>相册编号：${album.a_id }</p>
            <p>相册名称：${album.a_name }</p>
            <input type="hidden" name="aid" value="${album.a_name }" id="aname"/> 
           <img src="photos/${album.facebook }" width="250px" height="200px" class="am-btn-default am-btn-xs am-text-secondary" title="${album.a_name }" >
        </div>   
          
        <div class="am-btn-group am-btn-group-xs">
         <button type="button" class="am-btn am-btn-default am-btn-xs am-text-warning am-round" onclick="upPhoto(${album.a_id })" data-am-modal="{target: '#up-photo'}"><span class="am-icon-plus" ></span> 新增</button>
         <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"  onclick="editAlbum(${album.a_id })"  data-am-modal="{target: '#my-popups'}"><span class="am-icon-pencil-square-o" ></span>修改</button>
         <button type="button" class="am-btn am-btn-default am-btn-xs  am-text-success  am-round" onclick="displayPlist(${album.a_id })"><span class="am-icon-archive"></span> 查看</button>
         <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round" onclick="delAlbum(${album.a_id })"><span class="am-icon-trash-o"></span> 删除</button>
       </div>      
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