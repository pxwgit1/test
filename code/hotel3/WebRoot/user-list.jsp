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
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="index.jsp">退出登录</a></button></li>				
			</ul>	
         </div>


 <!-- 添加用户start --> 
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加用户</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form class="am-form tjlanmu" action="AddUserServlet" method="get">
         <div class="am-form-group am-cf">
          <div class="zuo">用户名：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="uname" name="uname" placeholder="请输入用户名">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">密码：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="upwd" name="upwd" placeholder="请输入密码">
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">真实姓名：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="relName" name="relName" placeholder="请输入真实姓名">
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">用户性别：</div>
          <div class="you">
             <select data-am-selected="{btnSize: 'sm'}" name="gender" >
              <option value="男">男</option>
              <option value="女">女</option>  
            </select>
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">用户类型：</div>
          <div class="you">          
             <select data-am-selected="{btnSize: 'sm'}" name="role">
              <c:forEach var="role" items="${role}" varStatus="t">
         			<option value="${role.key}" >${role.value}</option>	         
        		</c:forEach>
              </select>
          </div>
      </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">联系电话：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="telNum" name="telNum" placeholder="请输入联系电话">
          </div>
        </div>
        
         <div class="am-form-group am-cf">
          <div class="zuo">邮箱：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="email" name="email" placeholder="请输入邮箱">
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
 <!-- 添加用户end --> 

 <!-- 编辑用户基本信息start --> 
  <div class="am-popup am-popup-inner" id="my-popups">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改用户基本信息</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form class="am-form tjlanmu" name="form1" action="EditUserServlet" method="get">
          <div class="am-form-group am-cf">
          <div class="zuo">用户名：</div>
          <div class="you">        
            <input type="text" class="am-input-sm" id="uname" name="uname" readonly>
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">密码：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="upwd" name="upwd">
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">真实姓名：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="relName" name="relName" >
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">用户性别：</div>
          <div class="you">
             <select  data-am-selected="{btnSize: 'sm'} name="gender">
              <option value="男">男</option>
              <option value="女">女</option>  
            </select>
          </div>
        </div>
        
         <div class="am-form-group am-cf">
          <div class="zuo">用户类型：</div>
          <div class="you">
             <select  data-am-selected="{btnSize: 'sm'} name="role">
              <c:forEach var="role" items="${role}" varStatus="t">
         			<option value="${role.key}" >${role.value}</option>	         
        		</c:forEach>
              </select>
          </div>
       </div>
          
        
        <div class="am-form-group am-cf">
          <div class="zuo">联系电话：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="telNum" name="telNum">
          </div>
        </div>
        
         <div class="am-form-group am-cf">
          <div class="zuo">邮箱：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="email" name="email">
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
 <!-- 编辑用户基本信息end --> 


	
	
<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 用户列表</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： <a href="manager.html">管理员首页</a> > <a herf="">用户管理</a> >用户列表</dl>
      
      <dl>
        <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#my-popup'}">添加新用户</button>
      </dl>   
    </div>
	
<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <ul>
    <li>
     <select data-am-selected="{btnSize: 'sm'}" name="selectRole" id="selectRole">
        <c:forEach var="role" items="${role}" varStatus="t">
  			<option value="${role.key}" >${role.value}</option>	         
 		</c:forEach>
      </select>
    </li>
    <li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="searchUserByRole()">搜索</button></li>
  </ul>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
          <thead>
            <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">序号</th>
                <th class="table-type">用户名</th>
                <th class="table-type">密码</th>
                <th class="table-title">真实姓名</th>
                <th class="table-type">性别</th>                
                <th class="table-title">联系电话</th>
                <th class="table-title">邮箱</th>
                 <th class="table-title">角色</th>
                <th width="163px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${pm.getRList() }" varStatus="u">
              <tr>
                <td><input type="checkbox" value="ture"/></td>
                 <td>${u['index']}</td>
                <td>${user.uname}</td>
                <td>${user.upwd}</td>
                <td>${user.relName}</td>
                <td>${user.gender}</td>
                <td>${user.telNum}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
		          <a  href="javascript:void(0);" onclick="editUser(this,${login.getRole()})" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></a>
                    <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                                       
                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除" onclick="delUser(this)"><span class="am-icon-trash-o"></span></button>
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
	        <c:forEach var="Page" begin="1" end="${pm.getTotalPages()}">
	        <!--  <li class="am-active"><a href="#">1</a></li> -->
	        <li><a href="RoomListServlet?currentPage=${Page}">${Page}</a></li>
	        </c:forEach>
	        <li><a href="#">»</a></li>
	        <li><a href="RoomListServlet?currentPage=${pm.getTotalPages()}">末页</a></li>
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