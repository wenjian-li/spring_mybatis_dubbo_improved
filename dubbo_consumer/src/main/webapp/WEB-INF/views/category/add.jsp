<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加分类</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="../js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#add").click(function() {
			$.ajax({
				url : "./save.html",
				data : $("#addForm").serialize(),
				type : "post",
				dataType : "text",
				success : function(data) {
					if (data == "success") {
						alert("成功！");
					} else {
						alert("失败！");
					}
				}

			});
		});
		
		
		
	});
	
</script>

</head>

<body>
	<center>
		<form id="addForm">
			分类名称：<input type="text" name="categoryName"> <br /> <br /> 
			排序：<input type="text" name="categorySort"><br/> 
			<input type="button" value="添加" id="add">
		</form>
	</center>
</body>
</html>
