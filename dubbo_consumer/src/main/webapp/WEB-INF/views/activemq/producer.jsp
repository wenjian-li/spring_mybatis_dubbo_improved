<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>生产者</title>
<script type="text/javascript" src="../js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='queueButton']").click(function() {
			$.ajax({
				url : "./queueSend.html",
				data : $("#queueForm").serialize(),
				type : "post",
				dataType : "text",
				cache : false,
				success : function(data) {
					if (data == "success")
						alert("发送队列消息成功");
					else
						alert("发送队列消息失败");
				}
			});
		});
		
		$("input[name='topicButton']").click(function() {
			$.ajax({
				url : "./topicSend.html",
				data : $("#topicForm").serialize(),
				type : "post",
				dataType : "text",
				cache : false,
				success : function(data) {
					if (data == "success")
						alert("发送主题消息成功");
					else
						alert("发送主题消息失败");
				}
			});
		});
	});
</script>
</head>
<body>
	<center>
		<form action="" id="queueForm">
			队列模式消息：<input type="text" name="queueMessage"> <input type="button"
				name="queueButton" value="发送队列消息">
		</form>
		<br/><br/>
		<form action="" id="topicForm">
			主题模式消息：<input type="text" name="topicMessage"> <input type="button"
				name="topicButton" value="发送主题消息">
		</form>
	</center>
	<br />
	<a href="./queueMessage.html" target="_blank">查看队列消息</a>
	<br/><br/>
	<a href="./topicMessage.html" target="_blank">查看主题消息</a>
</body>
</html>