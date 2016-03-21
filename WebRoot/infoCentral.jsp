<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>

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
	<h3>请关闭本页面。</h3>
</div>
</body>
</html>