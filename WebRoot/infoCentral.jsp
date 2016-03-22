<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>info message</title>

<meta http-equiv="refresh" content="3;url=edit.jsp">
<script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/upload.css">
<link rel="Shortcut Icon" href="images/titlebg.ico" />
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css"></link>
<style type="text/css">
	body{
		background-repeat:no-repeat; 
		background-attachment:fixed;
	}
</style>
</head>

<div class="col-md-7 col-md-offset-2">
	<hr>
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong> Congratulations !</strong> 
		您已经成功将文件写入 <font color="blue" size="5">${ path }</font> 文件中。
	</div>
	<hr>
	<div class="alert" role="alert"><font size="6" color="green">*&*&*  编辑成功</font></div>
	<hr>
	<h3>你可以选择关闭本页面， 或者系统 <font size="4" color="red">3</font> 秒后会自动转入edit编辑页面。</h3>
</div>
</body>
</html>