<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="ckeditor/ckeditor.js" type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <textarea id="ckeditor" name="ckeditor" rows="5" cols="30"></textarea>
   <script type="text/javascript">CKEDITOR.replace("ckeditor");</script>

   <div id="tmp"></div>
  </body>
  <script type="text/javascript">
	$(document).ready(function(){
  		var editor=CKEDITOR.instances.ckeditor;
  		editor.setData($("#tmp",window.opener.document).html());
 
  		$(window).bind('beforeunload',function(){
	  		var editor=CKEDITOR.instances.ckeditor;
	  		var text=editor.getData();

	  		$("#tmp",window.opener.document).html(text);
	  		opener.update();
	  	});
  	}); 
 </script>
</html>
