<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
  
<script type="text/javascript">
	$(document).ready(function(){
		document.title = "My JSP 'edit.jsp' starting page";
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

<body>
   <textarea id="ckeditor" name="ckeditor" rows="5" cols="30"></textarea>
   <script type="text/javascript">CKEDITOR.replace("ckeditor");</script>

   <div id="tmp"></div>
</body>

</html>
