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
</head>
<body>
<head:tagOne></head:tagOne>
		
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="manager.jsp">管理员首页 </a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="Exit">退出登录</a></button></li>	
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"><a href="index.jsp">主页</a></button></li>			
			</ul>	
         </div>



<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 订单统计</ul>
      
      <dl class="am-icon-home" style="float: right;">当前位置： <a href="manager.jsp">管理员首页</a> > <a href="#">订单管理</a>>订单统计</dl>

      
      
    </div>
    
    
    
      <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li class="am-active"><a href="#tab1">全年统计</a></li>
      <li><a href="#tab2">第一季度</a></li>
      <li><a href="#tab3">第二季度</a></li>
      <li><a href="#tab4">第三季度</a></li>
      <li><a href="#tab5">第四季度</a></li>
    </ul>





    <div class="am-tabs-bd">

      <!--全年订单统计tab1 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table style="width:50%" class=" am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success"  >
                <th class="table-type">年份</th>
                <th class="table-type">订单总数</th>
                <th class="table-type">销售金额</th>          
              </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${oList }" varStatus="o"> 
              <tr>              
                <td>${order.year }</td>
                <td>${order.allOrder }</td>
                <td>${order.allSale }</td>               
              </tr> 
             </c:forEach>       
            </tbody>
          </table>      
        </form> 
      </div>
    </div>
  
      <!--第一季度订单统计tab2 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab2">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table style="width:50%" class=" am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success"  >
                 <th class="table-type">年份</th>
                <th class="table-type">月份</th>
                <th class="table-type">订单总数</th>
                <th class="table-type">销售金额</th>          
              </tr>
            </thead>
            <tbody>           
              <tr>    
                <td rowspan="3" align="center" valign="middle">2017</td>        
                <td>1</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>                          
                <td>2</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td>3</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td colspan="2">总计</td>
                <td >14</td> 
                <td>14</td>            
              </tr>        
            </tbody>
          </table>      
        </form> 
      </div>
    </div>
    
     <!--第二季度订单统计tab3 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab3">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table style="width:50%" class=" am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success"  >
                 <th class="table-type">年份</th>
                <th class="table-type">月份</th>
                <th class="table-type">订单总数</th>
                <th class="table-type">销售金额</th>          
              </tr>
            </thead>
            <tbody>           
              <tr>    
                <td rowspan="3" align="center" valign="middle">2017</td>        
                <td>4</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>                          
                <td>5</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td>6</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
               <tr>              
                <td colspan="2">总计</td>
                <td >14</td> 
                <td>14</td>            
              </tr>         
            </tbody>
          </table>      
        </form> 
      </div>
    </div>

      <!--第三季度订单统计tab4 -->
      <div class="am-tab-panel am-fade am-in am-active" id="tab4">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table style="width:50%" class=" am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success"  >
                 <th class="table-type">年份</th>
                <th class="table-type">月份</th>
                <th class="table-type">订单总数</th>
                <th class="table-type">销售金额</th>          
              </tr>
            </thead>
            <tbody>           
              <tr>    
                <td rowspan="3" align="center" valign="middle">2017</td>        
                <td>7</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>                          
                <td>8</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td>9</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td colspan="2">总计</td>
                <td >14</td> 
                <td>14</td>            
              </tr>         
            </tbody>
          </table>      
        </form> 
      </div>
    </div>
    
 <!--第四季度订单统计tab5 -->
      <div class="am-tab-panel am-fade" id="tab5">
        <div class="am-g am-margin-top">      
          <form class="am-form am-g">
          <table style="width:50%" class=" am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success"  >
                 <th class="table-type">年份</th>
                <th class="table-type">月份</th>
                <th class="table-type">订单总数</th>
                <th class="table-type">销售金额</th>          
              </tr>
            </thead>
            <tbody>           
              <tr>    
                <td rowspan="3" align="center" valign="middle">2017</td>        
                <td>10</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>                          
                <td>11</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td>12</td>
                <td>14</td>
                <td>323</td>               
              </tr>  
              <tr>              
                <td colspan="2">总计</td>
                <td >14</td> 
                <td>14</td>            
              </tr> >        
            </tbody>
          </table>      
        </form> 
      </div>
    </div>

</div>
      
 
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