<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	$(function() {});
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			//width : 245
			width : 150
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
	var typeone;
	var typetwo;
	var typethree;
	var fathertarget;
	var fathertarget1;
	var fathertarget2;
	var fathertarget3;
	function show() {
	    var typeonetext;
		var v = document.getElementById("type").value;
		var vv = document.getElementById("type");
		var index = vv.selectedIndex;
		var ii = document.getElementById("type2");
		if (v == 1) {
			ii.style.display = "block";
			typeonetext = vv.options[index].text;
			typeone = typeonetext;
			fathertarget1 = v;
		} else if(v==6){
			ii.style.display = "none";
			fathertarget = 0;
			alert(fathertarget);
		} else{
			ii.style.display = "none";
		}
		
	}
	function show2() {
	    var typetwotext;
		var v2 = document.getElementById("stype").value;
		var vv2 = document.getElementById("stype");
		var index2 = vv2.selectedIndex;
		var iid3 = document.getElementById("type3").value;
		var id3 = document.getElementById("type3");
		var index3 = id3.selectedIndex;
		var iid4 = document.getElementById("type4").value;
		var id4 = document.getElementById("type4");
		var index4 = id4.selectedIndex;
		if (v2 == 11) {
			fathertarget = v2;
			id3.style.display = "block";
			id4.style.display = "none";
			typetwotext = vv2.options[index2].text;
			typetwo= typetwotext;
			fathertarget2 = v2;
		} else if(v2 == 13){
			fathertarget = v2;
			id3.style.display = "none";
			id4.style.display = "block";
			typetwotext = vv2.options[index2].text;
			typetwo= typetwotext;
			fathertarget2 = v2;
		}else if(v2 == 16){
			//vv2.style.display = "none";
			id3.style.display = "none";
			id4.style.display = "none";
			fathertarget = fathertarget1;
			alert("fathertarget16=="+fathertarget);
		}else{
			//vv2.style.display = "none";
			id3.style.display = "none";
			id4.style.display = "none";
		}
		
	}
	function show3() {
	    var typethreetext;
		var iid3 = document.getElementById("stype3").value;
		var id3 = document.getElementById("stype3");
		var index3 = id3.selectedIndex;
		var iid4 = document.getElementById("stype4").value;
		var id4 = document.getElementById("stype4");
		var index4 = id4.selectedIndex;
		if (iid3 ==111 || iid3 ==122 || iid3 ==133) {
			fathertarget = iid3;
			id3.style.display = "block";
			id4.style.display = "none";
			typethreetext = id3.options[index3].text;
			typethree= typethreetext;
		} else if(iid3 == 144){
			id3.style.display = "none";
			id4.style.display = "none";
			fathertarget = fathertarget2;
			alert("fathertarget===iid3=="+fathertarget);
		}else{
			id3.style.display = "none";
			id4.style.display = "none";
		}
		
	}
	function show4() {
	    var typethreetext;
		var iid3 = document.getElementById("stype3").value;
		var id3 = document.getElementById("stype3");
		var index3 = id3.selectedIndex;
		var iid4 = document.getElementById("stype4").value;
		var id4 = document.getElementById("stype4");
		var index4 = id4.selectedIndex;
		if (iid4 ==211 || iid4 ==222 || iid4 ==233 || iid4 ==244) {
			fathertarget = iid4;
			id4.style.display = "block";
			id3.style.display = "none";
			typethreetext = id4.options[index4].text;
			typethree= typethreetext;
		} else if(iid4 == 255){
			id3.style.display = "none";
			id4.style.display = "none";
			fathertarget = fathertarget2;
			alert("fathertarget===iid4=="+fathertarget);
		}else{
			id3.style.display = "none";
			id4.style.display = "none";
		}
		
	}
	window.onload = function() {
	//提交按钮绑定点击事件，根据校验结果判断是否提交
	$("#sch").click(function() {
		var targetlevel;
		//alert("typeone=="+typeone);
		var targetcontent=$("#targetcontent").val();
		//alert("targetcontent=="+targetcontent);
		//alert("fathertarget=="+fathertarget);
		if(fathertarget==0){
			targetlevel = 0;
			//alert("学院指标=" + targetlevel + "--内容==" + targetcontent + "父指标==" + fathertarget);
			$("#form1").submit();
		}
		//alert("typetwo=="+typetwo);
		if(fathertarget==1){
			targetlevel = 0;
			//alert("学院指标=" + targetlevel + "--内容==" + targetcontent + +"父指标=="+fathertarget);
			$("#form1").submit();
		}
		if(fathertarget==11 || fathertarget==13){
			targetlevel = 1;
			//alert("一级指标=" + targetlevel + "--内容==" + targetcontent + +"父指标=="+fathertarget);
			$("#form1").submit();
		}
		if(fathertarget==111 || fathertarget==122 || fathertarget==133 || fathertarget==211 || fathertarget==222 || fathertarget==233 || fathertarget==244){
			targetlevel = 3;
			//alert("三级指标=" + targetlevel + "--内容==" + targetcontent + +"父指标=="+fathertarget);
			$("#form1").submit();
		}
		if(fathertarget==144 || fathertarget==255){
			targetlevel = 2;
			//alert("二级指标=" + targetlevel + "--内容==" + targetcontent + +"父指标=="+fathertarget);
			$("#form1").submit();
		}
	});
	
	};

 </script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>指标自定义</li>
			<li style="float:right;"><a href="login.jsp">退出</a></li>
			<li style="float:right;"><a href="abouts.jsp">关于</a></li>
			<li style="float:right;"><a href="help.jsp">帮助</a></li></ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">指标自定义</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<div class="formtext">
					Hi，<b>admin</b>，欢迎您使用指标自定义功能！
				</div>
				<form action="UptargetServlet" method="post" enctype="multipart/form-data" id="form1">
					<ul class="forminfo">
						<li style="width: 800px;"><label>指标层级<b>*</b></label>
							<div class="vocation" >
								<select class="select1" name="type" id="type" onchange="show()">
									<option value="2">电子学院</option>
									<option value="1">计算机学院</option>
									<option value="3">外语学院</option>
									<option value="4">软件工程学院</option>
									<option value="5">信息安全学院</option>
									<option value="6">学院</option>
								</select>
							</div>
							<div class="vocation" id="type2" style="display: none;">
								<select class="select1" name="type2" id="stype" onchange="show2()">

									<option value="12">专业建设目标与规划</option>
									<option value="11">专业定位与规划</option>
									<option value="13">学科方向设置</option>
									<option value="14">优势与特色</option>
									<option value="15">就业与社会评价</option>
									<option value="16">计算机学院</option>
								</select>
							</div>
							<div class="vocation" id="type3" style="display: none;">
								<select class="select1" name="type3" id="stype3" onchange="show3()">

									<option value="122">学科等级</option>
									<option value="111">培养目标</option>
									<option value="133">支撑行业</option>
									<option value="144">专业定位与规划</option>
								</select>
							</div>
							<div class="vocation" id="type4" style="display: none;">
								<select class="select1" name="type4" id="stype4" onchange="show4()">
									<option value="222">图形图像方向</option>
									<option value="211">计算智能方向</option>
									<option value="233">网络与信息系统安全方向</option>
									<option value="244">物联网技术方向</option>
									<option value="255">学科方向设置</option>
								</select>
							</div>
							</li>
						<li id="lis"><label>指标内容<b>*</b></label>
							<div class="vocation" id="targettitle"
								style="width: 150px;display: block;">
								<textarea name="targettitle" id="targetcontent" class="dfinput" rows="5" cols="7"> </textarea>
							</div></li>
						<li><label>评审开通<b>*</b></label>
							<div class="vocation">
								<select class="select1" name="flag">
									<option>是</option>
									<option>否</option>
								</select>
							</div></li>
						<li><label>最小分值<b>*</b></label>
							<div class="vocation" id="mincount"
								style="width: 150px;display: block;">
								<textarea name="mincount" id="mincount" class="dfinput" rows="5" cols="7"> </textarea>
							</div></li>
						<li><label>最大分值<b>*</b></label>

							<div class="vocation" id="maxcount"
								style="width: 150px;display: block;">
								<textarea name="maxcount" id="maxcount" class="dfinput" rows="5" cols="7"> </textarea>
							</div></li>
						<li><label>指标附件<b>*</b></label> <input type="hidden"
							name="aid1" /> <input type="file" name="target" /></li>
						<li><input id="sch" type="button" class="btn"
							value="上传指标" />
							<a href="" class="linkToUptargetServlet">提交</a>
							</li>
					</ul>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>
</body>
</html>