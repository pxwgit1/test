<%@ page language="java" import="java.util.*,java.sql.*"  pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
<!-- <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>  

  -->

 <link href="calendar\jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"/>
 <script src="calendar\jquery.min.js"></script> 
 <script src="calendar\jquery-ui-1.8.16.custom.min.js"></script>
 
     
<script type="text/javascript"> 
$(function() { 
	$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
	$("#datepicker").datepicker(); 
	$("#datepicker").datepicker('option', $.datepicker.regional['zh-CN']); 
	$("#datepicker").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
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
	$("#datepicker1").datepicker(); 
	$("#datepicker1").datepicker('option', $.datepicker.regional['zh-CN']); 
	$("#datepicker1").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
//$("#datepicker").datepicker(...);//代表带着...属性直接执行创建datepicker() 
//必须先init datepicker才能再设置datepicker的option 
//$("#datepicker").datepicker('option',...,...);//代表设置datepicker的...的属性值为...,但不执行创建datepicker(); 
//$.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
//$("#datepicker").datepicker($.datepicker.regional['zh-CN']);//该句执行失效，因为之前有$("#datepicker").datepicker();了 
//var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );//get dateFormat 
//$("#datepicker").datepicker('option', {dateFormat: 'yy-mm-dd'});//set dateFormat 
}); 
</script>

    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowRoomInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.roomshow{
	width:50%;
	background-color:#CCF; 
	}
	</style>
  </head>
  
  <body>
  <div class="roomshow">
  <h1>请填写订单信息</h1>
    <form name="form1" method="get" action="AddOrderServlet">
<% 
	String rtype1=new String(request.getParameter("rtype").getBytes("ISO-8859-1"),"UTF-8");
	String rprice1=new String(request.getParameter("rprice").getBytes("ISO-8859-1"),"UTF-8");
	String rtypeid=new String(request.getParameter("rtypeid").getBytes("ISO-8859-1"),"UTF-8");
	 
	 /*  out.println("名称: " + rtype1); */
  	%>
  	<BR>填写您的订单，带*号项必须填写<br><br>
  	    <input name="roomtype" type="hidden" value="<%=rtypeid %>" size=20/>
   		房间类型:<input name="rtype" type="text" value="<%=rtype1%>" size=20 readonly="readonly"/>*<br/><br>
  		房间价格:<input name="rprice" type="text" value="<%=rprice1%>" size=20 readonly="readonly"/>*<br/><br>
  		入住时间:<input name="liveTime" id="datepicker" type="text"/>* <br><br>			
		退房时间:<input name="outTime" id="datepicker1" type="text"/>* <br><br>
			<!-- 预定数目:<input name="num" type="text" size=20 /><br/><br> -->
		预定数目:<select name="num" width="200">
 					 <option value ="1">1</option>
  					<option value ="2">2</option>
  					<option value="3">3</option>
  					<option value="4">4</option>
			</select>间 *<br><br>
		联系电话:<input name="tel" type="text" size=20 />*<br/><br>
  	<input type="submit" name="sure" id="sure" value="马上预订">
  	</form>                   
  </div>
  </body>
</html>
