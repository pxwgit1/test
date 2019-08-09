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

 <div class=" admin-content">
	
	      <div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="manager.jsp">管理员首页 </a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="Exit">退出登录</a></button></li>	
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="index.jsp">主页</a></button></li>			
			</ul>	
         </div>

 <!-- 添加房间start --> 
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加房间</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu" action="AddRoomServlet" method="get">
         <div class="am-form-group am-cf">
          <div class="zuo">房间编号：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="roomID" name="roomID" placeholder="请输入房间编号">
          </div>
        </div>
        
	<div class="am-form-group am-cf">
          <div class="zuo">房间类型：</div>
          <div class="you">
              <select name="roomType" data-am-selected="{btnSize: 'sm'}" >
         		<c:forEach var="tp" items="${type}" varStatus="t">
         			<option value="${tp.key}" >${tp.value}</option>	         
        		</c:forEach>
         	 </select>
          </div>
        </div>

       <div class="am-form-group am-cf">
          <div class="zuo">房间名称：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="roomName" name="roomName" placeholder="请输入房间名称">
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
 <!-- 添加房间end --> 

 <!-- 编辑房间start --> 
  <div class="am-popup am-popup-inner" id="my-popups">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改房间</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
      <form class="am-form tjlanmu" name="form1" action="EditRoomServlet" method="get">
         <div class="am-form-group am-cf">
          <div class="zuo">房间编号：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="roomID" name="roomID" readonly>
          </div>
        </div>
        
	<div class="am-form-group am-cf">
          <div class="zuo">房间类型：</div>
          <div class="you">
              <select name="selectType" id="selectType" data-am-selected="{btnSize: 'sm'}">
         		<c:forEach var="tp" items="${type}" varStatus="t">
         			<option value="${tp.key}" >${tp.value}</option>	         
        		</c:forEach>
         	 </select>
          </div>
        </div>

       <div class="am-form-group am-cf">
          <div class="zuo">房间名称：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="roomName" name="roomName">
          </div>
        </div>
	   
	    <div class="am-form-group am-cf">
          <div class="zuo">房间状态：</div>
          <div class="you">
             <select name="selectStatus" id="selectStatus"  data-am-selected="{btnSize: 'sm'}">     		
         		<option value="0">未预订</option>	 
         		<option value="1" >已预订</option>        
         	 </select>
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
 <!-- 编辑房间end --> 


	
	
   <div class="admin-biaogelist">
   	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 房间管理</ul>     
      <dl class="am-icon-home" style="float: right;"> 当前位置： <a href="manager.jsp">管理员首页</a> > <a herf="">房间管理</a> >房间列表</dl>   
      <dl>
        <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#my-popup'}">添加房间</button>
      </dl>   
    </div>
	
    <div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
      <ul>
         <li>
    <!-- <input type="text" class="am-form-field am-input-sm am-input-xm" placeholder="关键词搜索" /> -->
            <select  name="selectSearch" id="selectSearch" data-am-selected="{btnSize: 'sm'}">
               <option value="all" >全部房间</option>
		    <c:forEach var="tp" items="${type}" varStatus="t">
			    <option value="${tp.key}" >${tp.value}</option>	         
	         </c:forEach>
	            <option value="Y" >已预订的房间</option>
	            <option value="N" >未预订的房间</option>
           </select>
        </li>
         <li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="search(this)">搜索</button></li>
      </ul>
   </div>


    <form class="am-form am-g" action="" method="get" name="form2">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">序号</th>
                <th class="table-id">编号</th>
                <th class="table-type">房间类别</th>
                <th class="table-title">房间名称</th>
                <th class="table-type">房间单价</th>
                <th >预订/未预定<i class="am-icon-check am-text-warning"></i> <i class="am-icon-close am-text-primary"></i></th>
                 <th class="table-title">房间描述</th>
                 <th class="table-type">vip折扣</th>
                 <th class="table-date am-hide-sm-only">开始时间</th>
                 <th class="table-date am-hide-sm-only">结束时间</th>
                 <th class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="room" items="${pm.getRList() }" varStatus="r"> 
              <tr>
                <td><input type="checkbox" value="ture"/></td>
                <td>${r['index']}</td>
                <td>${room.roomID}</td>
                <td>${room.roomType}</td>
                <td>${room.roomName}</td>
                <td>${room.roomPrice}</td>  
                            
                <c:choose>
                <c:when test="${room.roomStatus=='0'}">              
                <td ><i class="am-icon-close am-text-primary"></i> <input type="hidden" value="0" name="roomStatus" id="roomStatus"/></td>
                </c:when>
                <c:otherwise>            
                <td><i class="am-icon-check am-text-warning"></i><input type="hidden" value="1" name="roomStatus" id="roomStatus"/></td>
                </c:otherwise>
                </c:choose>
                <td>${room.description}</td>
                 <td>0.8</td> 
                <td>2015年3月3日</td> 
                <td>2015年3月3日</td>  
                <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
		              <a href="javascript:void(0);" onclick="editRoom(this)" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="编辑"><span class="am-icon-pencil-square-o" ></span></a>
                      <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
                       <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                   
                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除" onclick="delRoom(this)"><span class="am-icon-trash-o"></span></button>                    
                   </div>
                 </div>
	            </td>
              </tr> 
            </c:forEach>       
            </tbody>
          </table>
          
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#my-popup'}"><span class="am-icon-plus" ></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
              <button type="button" class="am-btn am-btn-default" onclick="delRoom()"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          
        <ul class="am-pagination am-fr">
			<li><a href="RoomListServlet?currentPage=1">首页</a></li>
			
			<c:choose>
			  <c:when test="${pm.getCurrentPage()==1}">
			     <li><a href="RoomListServlet?currentPage=${pm.getCurrentPage()}">«</a></li>
			  </c:when>
			  <c:otherwise>
			       <li><a href="RoomListServlet?currentPage=${pm.getCurrentPage()-1}">«</a></li>
			  </c:otherwise>
			</c:choose>	   
			    
	        <c:forEach var="Page" begin="1" end="${pm.getTotalPages()}">
	       <!--   <li class="am-active"><a href="#">1</a></li> -->
	        <c:choose>
	          <c:when test="${Page == pm.getCurrentPage()}">
	            <li class="am-active"><a href="RoomListServlet?currentPage=${Page}">${Page}</a></li>
	          </c:when>
	          <c:otherwise>
	           <li><a href="RoomListServlet?currentPage=${Page}">${Page}</a></li>
	          </c:otherwise>
	        </c:choose>
	        
	        </c:forEach>
	         <c:choose>
	            <c:when test="${pm.getCurrentPage()==pm.getTotalPages()}">
	                <li><a href="RoomListServlet?currentPage=${pm.getCurrentPage()}">»</a></li>
	            </c:when>
	            <c:otherwise>
	                 <li><a href="RoomListServlet?currentPage=${pm.getCurrentPage()+1}">»</a></li>
	            </c:otherwise>
	        </c:choose>
	   
	        <li><a href="RoomListServlet?currentPage=${pm.getTotalPages()}">末页</a></li>
	        <li>每页${pm.getPageSize()} </li>         
	        <li>共${pm.getTotalPages()}页</li>
        </ul>
          
          <hr />
          <p>注：.....</p>
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