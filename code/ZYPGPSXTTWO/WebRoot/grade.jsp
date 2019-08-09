<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.TargettoUserDao"%>
<%@page import="dao.TargetDao"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>指标自定义</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
		
		function GetQueryString(index) { 
			var reg = new RegExp("(^|&)" + index + "=([^&]*)(&|$)","i"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r!=null) return (r[2]); return null; 
		}
		var index = GetQueryString("index"); 
		if(index!=null) 
		{
			var index_ = decodeURIComponent(index); 
			alert(index_); 
		}
		$("#td1").text(index_);
		
						
	});
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>专家评分</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab2">专家评分</a></li>
				</ul>
			</div>
				
			<div id="tab2" class="tabson">
					<table class="tablelist">
						<thead>
							<tr>
								<th>指标等级</th>
								<th>指标名称</th>
								<th>指标内容描述</th>
								<th>指标评分范围</th>
								<th>评分</th>
								<th style="display: none;">隐藏</th>
								<th style="display: none;">隐藏</th>
								<th style="display: none;">隐藏</th>
								<th style="display: none;">隐藏</th>
								<th>操作</th>
							</tr>
							</thead>
							<c:forEach var="ta" items="${aseachList}" varStatus="t">
							<tbody class="s2">
								<tr>
									<td>${ta['targetlevel']} 级</td>
									<td>${ta['targettype']}</td>
									<td>${ta['targettitle']}</td>
									<td>${ta['mincount']}~~${ta['maxcount']}</td>
									<td><input type="text" name="targetcount"
										style="height: 25px;" class="targetcounts"></input>
									</td>
									<td id="ids" class="d1" style="display: none;">${ta['tutargetid']}</td>
									<td id="uids" class="d1" style="display: none;">${ta['tuserid']}</td>
									<td id="mincounts" class="d1" style="display: none;">${ta['mincount']}</td>
									<td id="maxcounts" class="d1" style="display: none;">${ta['maxcount']}</td>
									<td>
										<a href="" class="linkToTargetUser">提交</a> 
									</td>
								</tr>
							</tbody>
							</c:forEach>
					</table>
					</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		 <script type="text/javascript">
    		$(document).ready(function(){
      		 //点击链接的时候调用
     			$(".linkToTargetUser").click(function(){
          		//得到input的值
	         		var ids = document.getElementById('ids');
	         		var uids = document.getElementById('uids');
	         		var mincounts = document.getElementById('mincounts');
	         		var maxcounts = document.getElementById('maxcounts');
	         		var mincount = mincounts.innerText;
	         		var maxcount = maxcounts.innerText;
	         		var count = $(".targetcounts").val();
	         		if(count>maxcount || count<mincount ){
	         			alert("您的评分超出"+mincount+"~~"+maxcount+"的评分范围,请合理打分!");
	         		}else{
	         			$(".linkToTargetUser").attr("href","TargettoUserServlet?targetcount="+count+"&id="+ids.innerText+"&uid="+uids.innerText);
	         		}
     			});
     			
    		});
</script>
	</div>
</body>

</html>
