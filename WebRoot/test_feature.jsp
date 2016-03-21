<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upload Files using XMLHttpRequest - Minimal</title>

    <script type="text/javascript">
      function fileSelected() {
        var file = document.getElementById('fileToUpload');
       	var filePath = file.value;
      	//alert(file.value);  //这样得到了文件的目录
       
      
      }

    </script>
</head>
<body>
<form id="form1" enctype="multipart/form-data" method="post" action="">
	<div class="row">
     	<label for="fileToUpload">Select a File to Upload</label>
	  	<input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();"/>
   		
   </div>

</form>

</body>
</html>