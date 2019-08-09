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
<html>
  <head>
 
  
    <base href="<%=basePath%>">
    
    <title>My JSP 'Test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
<link rel="stylesheet" type="text/css" href="styles.css">-->

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
  </head>
  
  <body>
  	 入住时间:<input name="livetime" id="liveTime" type="text"/>* <br><br>			
          退房时间:<input name="outtime" id="outTime" type="text"/>* <br><br>

  </body>
</html>
