<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>

<script type="text/javascript">	
	$(document).ready(function() {
		document.title = "My JSP 'Index.jsp' starting page";
		$("body").css("background-image","url(${pageContext.request.contextPath}/images/indexbg.jpg)");
		$("#latexedit").click(function() {
			window.open("edit.jsp","编辑",
					"toolbar=no,menubar=no,scrollbars=no, location=no, status=no, height=400px, width=600px, resizable=no, screenX=600px, screenY=300px, alwaysRaised=yes");
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

<body>
	<div class="page-header col-md-7 col-md-offset-2">
	  <h1>  西电智能教育辅导信息在线编辑   <small>测试入口</small></h1>
	  <hr>
	</div>
	<div class='col-md-8 col-md-offset-2'>
		<table class="bordered" style="min-width: 60%; margin: 10px auto;">
			<thead>
				<tr>
					<th>Latex录入测试</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="color: green;">
						<div id="math" class="math">这里将显示输入</div>
						<div id="tmp" style="display: none;">在这里输入</div>
					</td>
				</tr>
				<tr>
					<td><input id="latexedit" class="btn btn-primary" value="输入-载入LaTeX编辑器" /></td>
				</tr>
			</tbody>
		</table>
	</div>


</body>
</html>
