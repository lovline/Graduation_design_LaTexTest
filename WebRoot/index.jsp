<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}});</script>
<script type='text/javascript'
	src='MathJax-2.4-latest/MathJax.js?config=TeX-AMS-MML_SVG-full'></script>
<script src="js/jquery.js" type="text/javascript"></script>

	<link rel="stylesheet" type="text/css" href="css/upload.css">


</head>

<body>
	<table class="bordered" style="min-width:40%;margin:10px auto;">
		<thead>
			<tr>
				<th>Latex录入测试</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div id="math" class="math">在这里输入</div>
					<div id="tmp" style="display:none;">在这里输入</div>
				</td>
			</tr>
			<tr><td><input id="latexedit" type="button" value="编辑"  /></td></tr>
		</tbody>
	</table>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#latexedit")
									.click(
											function() {
												window
														.open(
																"edit.jsp",
																"编辑",
																"toolbar=no,menubar=no, scrollbars=no, location=no, status=no, height=400px, width=600px, resizable=no, screenX=600px, screenY=300px, alwaysRaised=yes");
											});

						});
		function update() {
			$("#math").html($("#tmp").html());
			var $img = $("#math img");
			$img.each(function() {
				$(this).replaceWith("$" + $(this).attr("alt") + "$");
			});

			MathJax.Hub.Queue([ "Typeset", MathJax.Hub, "math" ]);
		};
	</script>
</body>
</html>
