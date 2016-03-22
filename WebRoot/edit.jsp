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
	
	function LoadXMLDoc1(){
		$.ajax({ 
			//alert($("#filename").value);
		    type : "GET", 
		    //这里有一个问题
		    url : "upload/$('#filename').value", 
		    success : function(data){ 
		        //alert(data);
		        var editor=CKEDITOR.instances.ckeditor;
		        editor.setData(data);
		    }, 
		    error:function(){ 
		        alert('fail'); 
		    } 
		}); 
	}
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
	 <form name="form2" id="form2" enctype="multipart/form-data" method="post" action="upload">
		<div class="col-md-8 col-md-offset-2">
     		<label for="fileToUpload">Select a File to Upload</label>
	  		<input type="file" name="file" id="file" class="btn btn-primary btn-lg btn-block"/>
			<button class="btn btn-primary btn-lg btn-block">(先选择一个上传的文件后点击)上传本地文件</button>
   			<hr>
   			<button type="button" onclick="LoadXMLDoc1()" class="btn btn-primary btn-lg btn-block">将上传的文本在ckeditor中显示</button> 
   			<input id="filename" type="text" value="${ fileName }" />
   		</div>
	</form>

   
</body>


</html>
