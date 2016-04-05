<%@page import="com.xidian.graduation.EditBean"%>
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
	
	
//	 var editor=CKEDITOR.instances.ckeditor;
//   editor.setData(data);
	
</script>

<body>
	<c:if test="${ isWritten }">
		<div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>【Well Done !】</strong> 写入数据库student表LaTeX成功 。
		</div>
	</c:if>
	<form action="edit2database" method="post" name="form1" id="form1">
	   <textarea id="ckeditor" name="ckeditor" rows="7" cols="30"></textarea>
	   <script type="text/javascript">
	   		CKEDITOR.replace("ckeditor");
	   </script>
	
	   <div id="tmp"></div>
	   <hr>
	   <div class="col-md-8 col-md-offset-2">
	   		<div>
	   			<button type="submit" class="btn btn-primary btn-lg btn-block">保存文本到数据库</button>
	   			<br>
	   		</div>		
	   </div>
	 </form> 
	 
	 <%
		EditBean eb = new EditBean();
	 	List<EditBean> list = eb.getContentsFromDatabase();
	 	request.setAttribute("editContList", list);
	 %>
		<div class="col-md-8 col-md-offset-2">	
			<table class="table table-condensed" id="contents_table">
				<tr id="contents_header">
					<td><font size="4px;">记录de数目</font></td>
					<td><font size="4px;">记录de内容</font></td>
				</tr>
				<c:if test="${ isWritten }">
					<c:forEach items="${ requestScope.editContList }" var="list_message" varStatus="status">
						<tr id="contents_body">
							<td id="contents_number">${ status.count }</td>
							<td><span id="edit_message_contents">${ list_message.getContents() }</span></td>
						</tr>
					</c:forEach>	
				</c:if>
			</table>
		</div>			

</body>

</html>
