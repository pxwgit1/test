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
 <link href="calendar\jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"/>
 <script src="calendar\jquery.min.js"></script> 
 <script src="calendar\jquery-ui-1.8.16.custom.min.js"></script>
 <script type="text/javascript"> 
$(function() { 
	$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
	$("#liveTime").datepicker(); 
	$("#liveTime").datepicker('option', $.datepicker.regional['zh-CN']); 
	$("#liveTime").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
 }); 
 
 $(function() { 
	$.datepicker.setDefaults($.datepicker.regional['']);//先清理一下语言包的regional 
	$("#outTime").datepicker(); 
	$("#outTime").datepicker('option', $.datepicker.regional['zh-CN']); 
	$("#outTime").datepicker('option', 'dateFormat','yy-mm-dd');//set dateFormat 
});
</script> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>order list</title>
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
          
  <div class="admin-biaogelist">
  	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 订单列表</ul>      
      <dl class="am-icon-home" style="float: right;">当前位置： <a href="manager.jsp">管理员首页</a> > <a href="#">订单管理</a>>订单列表</dl>     
    </div>  
    
    <div class="am-tabs am-margin" data-am-tabs>
    
     <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li class="am-active"><a href="#tab1">全部订单</a></li>
      <li><a href="#tab2">今日订单</a></li>
      <li><a href="#tab3">未处理订单</a></li>
      <li><a href="#tab4">退订订单</a></li>
      <li><a href="#tab5">添加订单</a></li>
     </ul>

    <div class="am-tabs-bd">

      <!--全部订单tab1 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table style="width:110%;font-size: 10px" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-id">序号</th>
                <th class="table-id">编号</th>
                <th class="table-type">用户名</th>
                <th class="table-title">房间数</th>
                <th class="table-type">预留电话</th>              
                <th class="table-date am-hide-sm-only">入住日期</th>
                <th class="table-date am-hide-sm-only">离开日期</th>
                <th class="table-date am-hide-sm-only">预订时间</th>
                <th class="table-type">房间类型</th>
                <th class="table-type">状态</th> 
                <th  class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="order" items="${tab1.getRList()}" varStatus="o">
              <tr>           
                <td>${o['index']}</td>
                <td>${order.orderid}</td>
                <td>${order.uname }</td>
                <td>${order.num }</td>
                <td>${order.tel }</td>
                <td class="am-hide-sm-only">${order.livetime }</td>
                <td class="am-hide-sm-only">${order.outtime }</td>
                <td class="am-hide-sm-only">${order.ordertime }</td>
                <td class="am-hide-sm-only">${order.roomtype }</td>
                <td class="am-hide-sm-only">${order.status }</td>          
                <td>
	                <div class="am-btn-toolbar">
	                  <div class="am-btn-group am-btn-group-xs">
			          <a class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
	                    <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
	                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                   
	                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除" onclick="delOrder(this)"><span class="am-icon-trash-o"></span></button>
	                  </div>
	                </div>
	           </td>
           </tr>
           </c:forEach>        
            </tbody>
          </table>
          
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          
         <ul class="am-pagination am-fr">
			<li class="am-disabled"><a href="#">首页</a></li>
	        <li class="am-disabled"><a href="#">«</a></li>
	        <c:forEach var="Page" begin="1" end="${tab1.getTotalPages()}">
	        <!--  <li class="am-active"><a href="#">1</a></li> -->
	        <li><a href="RoomListServlet?currentPage=${Page}">${Page}</a></li>
	        </c:forEach>
	        <li><a href="#">»</a></li>
	        <li><a href="RoomListServlet?currentPage=${tab1.getTotalPages()}">末页</a></li>
	        <li>共${tab1.getTotalPages()}页</li>
         </ul>      
          <hr />
          <p>注：.....</p>
        </form> 
      </div>
    </div>
  
      <!--今日订单tab2 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab2">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">序号</th>
                <th class="table-id">编号</th>
                <th class="table-type">用户名</th>
                <th class="table-title">人数</th>
                <th class="table-type">预留电话</th>              
                <th class="table-date am-hide-sm-only">入住日期</th>
                <th class="table-date am-hide-sm-only">离开日期</th>
                <th class="table-date am-hide-sm-only">订单生成时间</th>
                <th width="163px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox" value="ture"/></td>
                <td>0</td>
                <td>14</td>
                <td><a href="#">双人间</a></td>
                <td>啦啦啦</td>
                <td>789</td>
                <td class="am-hide-sm-only"><i class="am-icon-check am-text-warning"></i><i class="am-icon-close am-text-primary"></i></td>
                <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
		         <a class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                    <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                   
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div>
	      </td>
              </tr>        
            </tbody>
          </table>
          
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          
          <ul class="am-pagination am-fr">

		<li class="am-disabled"><a href="#">首页</a></li>
                <li class="am-disabled"><a href="#">«</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">»</a></li>
                <li><a href="#">末页</a></li>
                <li>共4页</li>
           </ul>      
          <hr />
          <p>注：.....</p>
        </form> 
      </div>
    </div>

     <!--未处理订单tab3 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab3">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">序号</th>
                <th class="table-id">编号</th>
                <th class="table-type">用户名</th>
                <th class="table-title">人数</th>
                <th class="table-type">预留电话</th>              
                <th class="table-date am-hide-sm-only">入住日期</th>
                <th class="table-date am-hide-sm-only">离开日期</th>
                <th class="table-date am-hide-sm-only">订单生成时间</th>
                <th width="163px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox" value="ture"/></td>
                <td>0</td>
                <td>14</td>
                <td><a href="#">双人间</a></td>
                <td>啦啦啦</td>
                <td>789</td>
                <td class="am-hide-sm-only"><i class="am-icon-check am-text-warning"></i><i class="am-icon-close am-text-primary"></i></td>
                <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
		         <a class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                    <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                   
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div>
	      </td>
              </tr>        
            </tbody>
          </table>
          
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          
          <ul class="am-pagination am-fr">

		<li class="am-disabled"><a href="#">首页</a></li>
                <li class="am-disabled"><a href="#">«</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">»</a></li>
                <li><a href="#">末页</a></li>
                <li>共4页</li>
           </ul>      
          <hr />
          <p>注：.....</p>
        </form> 
      </div>
    </div>

       <!--已退订订单tab4 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab4">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">序号</th>
                <th class="table-id">编号</th>
                <th class="table-type">用户名</th>
                <th class="table-title">人数</th>
                <th class="table-type">预留电话</th>              
                <th class="table-date am-hide-sm-only">入住日期</th>
                <th class="table-date am-hide-sm-only">离开日期</th>
                <th class="table-date am-hide-sm-only">订单生成时间</th>
                <th width="163px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox" value="ture"/></td>
                <td>0</td>
                <td>14</td>
                <td><a href="#">双人间</a></td>
                <td>啦啦啦</td>
                <td>789</td>
                <td class="am-hide-sm-only"><i class="am-icon-check am-text-warning"></i><i class="am-icon-close am-text-primary"></i></td>
                <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
                <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
		         <a class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                    <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                   
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div>
	      </td>
              </tr>        
            </tbody>
          </table>
          
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          
          <ul class="am-pagination am-fr">

		<li class="am-disabled"><a href="#">首页</a></li>
                <li class="am-disabled"><a href="#">«</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">»</a></li>
                <li><a href="#">末页</a></li>
                <li>共4页</li>
           </ul>      
          <hr />
          <p>注：.....</p>
        </form> 
      </div>
    </div>

 <!--添加订单tab5 -->    
      <div class="am-tab-panel am-fade" id="tab5">
       <form class="am-form" action="AddOrderServlet" method="get">
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
             <select data-am-selected="{btnSize: 'sm'}" name="roomtype">
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
                <input type="text" class="am-form-field am-input-sm" id="liveTime" name="liveTime" placeholder="入住时间">
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
                <input  type="text" class="am-form-field am-input-sm" id="outTime" name="outTime" placeholder="离开时间">
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