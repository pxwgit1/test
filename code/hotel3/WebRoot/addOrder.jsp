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
<html>
<head>
 <link href="calendar\jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"/>
 <script src="calendar\jquery.min.js"></script> 
 <script src="calendar\jquery-ui-1.8.16.custom.min.js"></script>   
<script type="text/javascript"> 
$(function() { 
	$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
	$("#liveTime").datepicker(); 
	$("#liveTime").datepicker('option', $.datepicker.regional['zh-CN']); 
	$("#liveTime").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
//$("#datepicker").datepicker(...);//代表带着...属性直接执行创建datepicker() 
//必须先init datepicker才能再设置datepicker的option 
//$("#datepicker").datepicker('option',...,...);//代表设置datepicker的...的属性值为...,但不执行创建datepicker(); 
//$.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
//$("#datepicker").datepicker($.datepicker.regional['zh-CN']);//该句执行失效，因为之前有$("#datepicker").datepicker();了 
//var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );//get dateFormat 
//$("#datepicker").datepicker('option', {dateFormat: 'yy-mm-dd'});//set dateFormat 
}); 
</script> 

<script type="text/javascript"> 
$(function() { 
	$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
	$("#outTime").datepicker(); 
	$("#outTime").datepicker('option', $.datepicker.regional['zh-CN']); 
	$("#outTime").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
//$("#datepicker").datepicker(...);//代表带着...属性直接执行创建datepicker() 
//必须先init datepicker才能再设置datepicker的option 
//$("#datepicker").datepicker('option',...,...);//代表设置datepicker的...的属性值为...,但不执行创建datepicker(); 
//$.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
//$("#datepicker").datepicker($.datepicker.regional['zh-CN']);//该句执行失效，因为之前有$("#datepicker").datepicker();了 
//var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );//get dateFormat 
//$("#datepicker").datepicker('option', {dateFormat: 'yy-mm-dd'});//set dateFormat 
}); 
</script>
 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>add order</title>
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="assets/css/admin.css">
<!-- <script src="assets/js/jquery.min.js"></script> -->
<script src="assets/js/app.js"></script>
</head>
<body> 
<head:tagOne></head:tagOne>


<div class=" admin-content">
	
	  <div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="manager.html">管理员首页 </a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">奖金管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">产品管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				
				
			</ul>
     </div>
	
	


<div class="admin-biaogelist">
	<!--  入住时间:<input name="livetime" id="liveTime" type="text"/>* <br><br>			
          退房时间:<input name="outtime" id="outTime" type="text"/>* <br><br> -->
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 添加订单</ul>      
      <dl class="am-icon-home" style="float: right;"> 当前位置： <a herf="manager.html">管理员首页</a> > <a herf="">订单管理</a> >添加订单</dl>    
    </div>
	
    <div class="fbneirong">
      <form class="am-form" action="AddOrderServlet" method="post">
       
       <div class="xitong">  
          <div class="am-form-group">
          <div class="zuo">用户名：</div>
          <div class="you" style="max-width: 300px;">
            <input type="text" class="am-input-sm" id="uname" name="uname" placeholder="请输入用户名">
          </div>
        </div>
        

        <div class="am-form-group am-cf">
          <div class="zuo">房间类型：</div>
          <div class="you">
             <select style="max-width: 300px;" class="am-input-sm" name="roomtype">              
                <c:forEach var="tp" items="${type}" varStatus="t">
         			<option value="${tp.key}" >${tp.value}</option>	         
        	    </c:forEach>
            </select>
          </div>
        </div>        

        <div class="am-form-group">
          <div class="zuo">房间数：</div>
          <div class="you" style="max-width: 300px;">
            <input type="text" class="am-input-sm" id="num" name="num" placeholder="请输入房间数">
          </div>
        </div>
               
         <div class="am-form-group">
          <div class="zuo">预留电话：</div>
          <div class="you" style="max-width: 300px;">
            <input type="text" class="am-input-sm" id="tel" name="tel" placeholder="请输入预留电话">
          </div>
        </div>  
      
   
          <div class="am-form-group">
             <div class="zuo">入住时间：</div>
             <div>
               <div class="you" style="max-width: 300px;"> 
                <div class="am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input type="text" class="am-form-field am-input-sm" name="liveTime" id="liveTime" placeholder="入住时间">
                </div>
               </div>
             </div>
          </div>
           
            <div class="am-form-group">
             <div class="zuo">离开时间：</div>
             <div>
               <div class="you" style="max-width: 300px;"> 
                <div class="am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input type="text" class="am-form-field am-input-sm" name="outTime" id="outTime" placeholder="离开时间">
                </div>
               </div>
             </div>
          </div>

      <div class="am-form-group">
       <button type="submit" class="am-btn am-btn-success am-radius">提交保存</button>
       <button type="button" class="am-btn am-btn-primary am-radius">放弃保存</button>
      </div>               
    </div> 
    </form>
  </div> 
       
     
  
 
 <div class="foods">
  <dl>
    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
  </dl>
 </div>
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