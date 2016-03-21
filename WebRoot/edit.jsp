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
	  		var text=editor.getData(); //这个是得到ckeditor里面的内容的。

	  		$("#tmp",window.opener.document).html(text);
	  		opener.update();
	  	});
  	}); 
	
</script>

<body>
	<form action="edit" method="post" name="form1" id="form1">
	   <textarea id="ckeditor" name="ckeditor" rows="7" cols="30"></textarea>
	   <script type="text/javascript">
	   		CKEDITOR.replace("ckeditor");
	   </script>
	
	   <div id="tmp"></div>
	   <hr>
	   <div class="col-md-8 col-md-offset-2">
	   		<div>
	   			<button type="submit" class="btn btn-primary btn-lg btn-block">保存文本到本地</button>
	   			<br>
	   		</div>		
	   </div>
	 </form> 
	 <form name="form2" id="form2" enctype="multipart/form-data" method="post" action="edit">
		<div class="col-md-8 col-md-offset-2">
     		<label for="fileToUpload">Select a File to Upload</label>
	  		<input type="file" name="fileToUpload" id="fileToUpload" class="btn btn-primary btn-lg btn-block"/>
   		
   		</div>

	</form>
   
</body>


</html>
