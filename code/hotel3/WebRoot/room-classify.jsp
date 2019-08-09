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

   <!--添加分类start -->
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form class="am-form tjlanmu" action="AddRClassifyServlet" method="post" enctype="multipart/form-data" name="tform">
         <div class="am-form-group am-cf">
          <div class="zuo">新增分类：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rtype" name="rtype" placeholder="请输入新增分类">
          </div>
        </div>
	
       <div class="am-form-group am-cf">
          <div class="zuo">新增分类单价：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rprice" name="rprice" placeholder="请输入新增分类单价">
          </div>
        </div>
	
	<div class="am-form-group am-cf">	
          <div class="zuo">新增分类数量：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rtotal" name="rtotal" placeholder="新增分类数量">
          </div>
        </div>
       
        <div class="am-form-group am-cf">
          <div class="zuo">描述：</div>
          <div class="you">
            <textarea class="" rows="2" id="rdescription" name="rdescription"></textarea>
          </div>
        </div> 
        
         <div class="am-form-group am-cf" style="margin-bottom: 25px">
            <div class="zuo">上传图片：</div>
            <div style="float: left">
               <div style="float: left"><input type="file" name="photo" class="am-btn am-btn-success"/> </div> 
               <div style="float: left;margin-left: 5px"><input type="submit" value="确认上传" class="am-btn am-btn-secondary am-radius"/></div>  
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
   <!--添加分类end -->


  
   <!--编辑分类start -->
  <div class="am-popup am-popup-inner" id="my-popups">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu" name="form1" action="EditTypeServlet" method="post">
        <div class="am-form-group am-cf">
          <div class="zuo">分类类型ID：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="typeid" name="typeid" readonly>
          </div>
        </div>
        
         <div class="am-form-group am-cf">
          <div class="zuo">修改分类类型：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rtype" name="type">
          </div>
        </div>
	
       <div class="am-form-group am-cf">
          <div class="zuo">修改分类单价：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rprice" name="rprice">
          </div>
        </div>
	
	<div class="am-form-group am-cf">
          <div class="zuo">修改分类数量：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rtotal" name="rtotal" >
          </div>
        </div>

        
        <div class="am-form-group am-cf">
          <div class="zuo">修改描述：</div>
          <div class="you">
            <textarea class="" rows="2" id="rdescription" name="rdescription"></textarea>
          </div>
        </div>
        
      <!--    <div class="am-form-group am-cf" style="margin-bottom: 25px">
            <div class="zuo">上传图片：</div>
            <div style="float: left">
               <div style="float: left"><input type="file" name="photo" class="am-btn am-btn-success"/> </div> 
               <div style="float: left;margin-left: 5px"><input type="submit" value="确认上传" class="am-btn am-btn-secondary am-radius"/></div>  
            </div>
         </div>  
                 -->
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>

          </div>
        </div>
        </form>
      </div>
    </div>
   <!--编辑分类end -->
            
   <!--编辑图片end -->
   <div class="am-popup am-popup-inner" id="my-photo">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
      <form class="am-form tjlanmu" name="pform" action="EditTphotoServlet" method="post" enctype="multipart/form-data"> 
        
         <div class="am-form-group am-cf">
          <div class="zuo">分类类型ID：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="rtypeid" name="rtypeid" readonly>
          </div>
        </div>
              
          <div class="am-form-group am-cf" style="margin-bottom: 25px">   
            <div class="zuo">上传图片：</div>
            <div style="float: left">
               <div style="float: left"><input type="file" name="photo" class="am-btn am-btn-success"/> </div> 
               <div style="float: left;margin-left: 5px"><input type="submit" value="确认上传" class="am-btn am-btn-secondary am-radius"/></div>  
            </div>
         </div>         
       </form>
       
     </div>
   </div> 
   <!--编辑图片end -->      
            
    
    <div class="admin-biaogelist">
    
      <div class="listbiaoti am-cf">
         <ul class="am-icon-flag on">房间分类</ul>
         <dl class="am-icon-home" style="float: right;"> 当前位置： 管理员首页 > <a href="#">房间管理</a>>房间分类</dl>
         <dl><button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#my-popup'}">添加分类</button></dl>
          <!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束-->      
      </div>
      
	  <div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
         <ul>
           <li><input type="text" class="am-form-field am-input-sm am-input-xm" placeholder="关键词搜索" /></li>
           <li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;">搜索</button></li>
         </ul>
       </div>

      <form class="am-form am-g">
        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
          <thead>
            <tr class="am-success">
              <th class="table-check"><input type="checkbox" /></th>
              <th class="table-id am-text-center">ID</th>
              <th class="table-type">房间类型</th>
              <th class="table-type">房间单价</th>
              <th class="table-type">房间总数</th>
              <th class="table-author am-hide-sm-only">未预订房间</th>
              <th class="table-author am-hide-sm-only">描述</th>
              <th class="table-author am-hide-sm-only">图片</th>
              <th class="table-set">操作</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="type" items="${typeList}" varStatus="t">
            <tr>
              <td><input type="checkbox" /></td>
              <td class="am-text-center">${type.typeid}</td>
              <td class="am-text-center">${type.rtype}</td>
              <td class="am-text-center">${type.rprice}</td>
              <td class="am-text-center">${type.rtotal}</td>
              <td class="am-text-center">${type.ravailable}</td>
              <td class="am-hide-sm-only">${type.rdescription}</td>
              <td class="am-hide-sm-only">
                  ${type.rphoto}
                  <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" onclick="editTphoto(this)" data-am-modal="{target: '#my-photo'}" title="编辑"><span class="am-icon-pencil-square-o" ></span></button>
              </td>
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
		            <a href="javascript:void(0);" onclick="editType(this)" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="编辑"><span class="am-icon-pencil-square-o" ></span></a>
                    <!--<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o" ></span></button>-->
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->                   
                  <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除" onclick="delType(this)"><span class="am-icon-trash-o"></span></button>                    
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
            </div>>
      
        <hr />
        <p>
        备注：操作图标含义 
         <a class="am-icon-pencil-square-o am-text-secondary" title="修改"> 修改栏目</a> 
         <a class="am-icon-trash-o am-text-danger" title="删除"> 删除栏目</a>             
        </p>
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