<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#update").click(function() {
			$.ajax({
				url : "<%=path%>/user/update.html",
				data : $("#updateForm").serialize(),
				type : "post",
				dataType : "text",
				success : function(data) {
					if (data == "success") {
						alert("修改成功！");
					} else {
						alert("修改失败！");
					}
				}

			});
		});

	});
</script>

</head>

<body>
	<center>
		<form id="updateForm">
			<input type="hidden" name="id" value="${user.id }"> 名称：<input
				type="text" name="name" value="${user.name }"> <br /> 年龄：<input
				type="text" name="age" value="${user.age }"><br /> <input
				type="button" value="修改" id="update">
		</form>
	</center>
</body>
</html>
