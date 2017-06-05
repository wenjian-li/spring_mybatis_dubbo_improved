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
<base href="<%=basePath%>">

<title>用户列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
			$.ajax({
				url : "<%=path%>/user/getList.html",
				data : {},
				type : "GET",
				dataType : "json",
				success : function(data) {
					if (!$.isEmptyObject(data)) {
						var htmlStr ="";
						$.each(data,function(i,item){
							htmlStr += "<li>名称："+item.name+" 年龄："+item.age+"&nbsp;<a href=\"/spring_mybatis_web/user/toUpdate.html?id="+item.id+"\">修改</a><li/>";
						});
						$("#list").html(htmlStr);
					} else {
						alert("失败！");
					}
				}

			});
		
		
		
	});
	
</script>

</head>

<body>
	<center>
		<ul id="list" style="list-style-type:none;">
		</ul>
	</center>
</body>
</html>
