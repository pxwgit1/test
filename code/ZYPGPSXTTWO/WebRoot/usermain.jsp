<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.UserDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>专业评估评审系统用户界面</title>
</head>
<%
	//HttpSession session=request.getSession();
	String unames = request.getParameter("uname");
	String uname = new String(unames.getBytes("iso8859-1"),"UTF-8");
	System.out.println("usermain-jsp==uname=="+uname);
	UserDao dao = new UserDao();
	ArrayList userList3 = dao.findUsersByName(uname);
	System.out.println("userList3=="+userList3.size());
	session.setAttribute("acList3", userList3);
%>

<frameset rows="88,*" cols="*" frameborder="no" border="0"
	framespacing="0">
	
	<frame src="top.jsp" name="topFrame" noresize="noresize" id="topFrame"
		title="topFrame" />
	<frameset cols="187,*" frameborder="no" border="0" framespacing="0" name="father">
	<c:forEach var="us" items="${acList3}" varStatus="t">
		<frame src="userleft.jsp?loginusid=${us['userid']}" name="leftFrame" noresize="noresize"
			id="leftFrame" title="leftFrame" />
		<frame src="index.jsp" name="rightFrame" id="rightFrame"
			title="rightFrame" />
			</c:forEach>
	</frameset>
	
</frameset>

</html>
