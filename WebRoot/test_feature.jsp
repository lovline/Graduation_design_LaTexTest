<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript"> 
//(A)①获取文本文件方法(传统javascript实现AJAX写法) 
	function LoadXMLDoc1(){
		$.ajax({ 
		    type : "GET", 
		    url : "upload/test.txt", 
		    success : function(data){ 
		        $("#myDiv1").text("Result:"+data) 
		    }, 
		    error:function(){ 
		        alert('fail'); 
		    } 
		}); 
}

</script>
<body> 
<form id="form1" runat="server"> 
<%-- 获取服务器上的文本文件并显示--%> 
<div id="myDiv1"><h2>通过ajax改变内容</h2></div> 
<button id="btnChange1" type="button" onclick="LoadXMLDoc1()">通过 AJAX 改变内容(获取test1.txt上面的文本)</button> 
</form> 
</body> 