<%@ page language="java" 
import="java.util.*,java.sql.*" 
pageEncoding="utf-8"
contentType="text/html; charset=utf-8"
%>
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
        <h4 class="am-popup-title">添加房间分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu">
          <div class="am-form-group">
            <div class="zuo">新增分类：</div>
            <div class="you">
              <input type="text" class="am-input-sm" id="doc-ipt-email-1" name="type" placeholder="请输入新增分类">
            </div>
          </div>
        <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
              </p>
            </div>
          </div>
        </form>
      </div>
    </div>
 
   <!--添加分类end -->


  
   <!--编辑分类start -->
  <div class="am-popup am-popup-inner" id="my-popups">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改房间分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> 
      </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu">
          <div class="am-form-group">
            <div class="zuo">修改分类：</div>
            <div class="you">
              <input type="text" class="am-input-sm" id="doc-ipt-email-1" name="type" placeholder="请修改分类">
            </div>
          </div>

        <div class="am-form-group am-cf">
            <div class="you">
                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
            </div>
         </div>

        </form>
      </div>
    </div>
   <!--编辑分类end -->
            
    
    <div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">
          用户评论
        </ul>
        <dl class="am-icon-home" style="float: right;">
          当前位置： 管理员首页 > <a href="#">房间管理</a>>用户评论
        </dl>
            
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
              <th class="table-type">房间总数</th>
              <th class="table-author am-hide-sm-only">未预订房间</th>
              <th class="table-author am-hide-sm-only">描述</th>
              <th width="163px" class="table-set">操作</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="checkbox" /></td>
              <td class="am-text-center">14</td>
              <td><a href="#">Business</a></td>
              <td>default</td>
              <td class="am-hide-sm-only">访问</td>
              <td class="am-hide-sm-only">2014年9月4日 7:28:47</td>
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="置顶（前台显示热门评论）"></a>
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
            </div>>
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