<%@ tag language="java" 
    import="java.util.*,java.sql.*,java.io.*,javax.servlet.jsp.*,javax.servlet.jsp.tagext.*" 
    pageEncoding="utf-8"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="head" %>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
  <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle> 消息管理<span class="am-badge am-badge-danger am-round">6</span></button>
  <ul class="am-dropdown-content">	
    <li class="am-dropdown-header">所有消息都在这里</li>

    <li><a href="#">未激活会员 <span class="am-badge am-badge-danger am-round">556</span></a></li>
    <li><a href="#">未处理汇款</a></li>
    <li><a href="#">未发放提现</a></li>
    <li><a href="#">未处理订单</a></li>
    <li><a href="#">信息反馈</a></li>   
  </ul>
</li>

 <li class="kuanjie">
 	
 	<a href="UserListServlet">用户管理</a>          
 	<a href="#">奖金管理</a> 
 	<a href="order_list.jsp">订单管理</a>   
 	<a href="RoomListServlet?n=1">房间管理</a> 
 	<a href="#">个人中心</a> 
 	 <a href="#">系统设置</a>
 </li>

 <li class="soso">
 	
    <p>   	
	   <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
          <option value="b">全部</option>
          <option value="o">房间</option>
          <option value="o">会员</option>         
        </select>
    </p>

<p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="搜索" /></p>
<p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
 </li>




      <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#ffffff; margin: 10px 0 0 0;"> 欢迎管理员：<c:out value="${login.getLogname() }"></c:out></div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><a href="#">房间管理</a></h3>
      <ul>
        <li><a href="RoomListServlet?n=1">房间列表</a></li>
        <li><a href="RoomListServlet?n=0">添加房间</a></li>
        <li><a href="RoomClassifyServlet">房间分类</a></li>
        <!-- <li><a href="room-classify.jsp">房间分类</a></li> -->
	<li><a href="RoomAlbumServlet">房间相册</a></li>
      </ul>

      <h3 class="am-icon-cart-plus"><a href="#"> 订单管理</a></h3>
      <ul>
        <li><a href="OrderListServlet">订单列表</a></li>
        <li><a href="#">订单打印</a></li>
        <li><a href="ManagerAddOrder">添加订单</a></li>
        <li><a href="StatisticalServlet">订单统计</a></li>
      </ul>

      <h3 class="am-icon-users"> <a href="#">用户管理</a></h3>
      <ul>
        <li><a href="UserListServlet">用户列表</a> </li>
        <li><a href="UserListServlet?r=1">酒店管理员</a></li>
        <li><a href="UserListServlet?r=2">会员列表 </a></li>
        <li><a href="UserListServlet?r=3">普通用户</a></li>     
        <li><a href="user-review.jsp">用户评论</a></li>
      </ul>

      <h3 class="am-icon-volume-up"> <a href="">信息通知</a></h3>
      <ul>
        <li><a href="message.jsp">留言 </a></li>
        <li><a href="message.jsp">短信</a></li>
        <li><a href="message.jsp">邮件</a></li>
        <li><a href="message.jsp">微信</a></li>
        <li><a href="message.jsp">客服</a></li>
      </ul>
      <h3 class="am-icon-gears"><a href="#">系统设置</a></h3>
      <ul>
        <li><a href="#">数据备份</a></li>
        <li><a href="#">邮件/短信管理</a></li>
        <li><a href="#">上传/下载</a></li>
        <li><a href="#">权限</a></li>
        <li><a href="#">网站设置</a></li>
        <li><a href="#">第三方支付</a></li>
        <li><a href="#">提现 /转账 出入账汇率</a></li>
        <li><a href="#">平台设置</a></li>
        <li><a href="#">音频文件</a></li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 
   </div>
	
	
		
