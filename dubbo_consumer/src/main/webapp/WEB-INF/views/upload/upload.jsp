<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>上传文件</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="../js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#upload").click(function() {
			//FormData支持文件ajax上传
			//使用 jQuery 来发送 FormData，但必须要正确的设置相关选项：
			//processData: false,  // 告诉jQuery不要去处理发送的数据
			//contentType: false   // 告诉jQuery不要去设置Content-Type请求头
			//支持浏览器：Chrome 7+, Firefox(2.0) 4.0, Internet Explorer 10+, Opera 12+,Safari 5+
			var formData = new FormData($("#uploadForm")[0]);
			$.ajax({
				url : "../upload/files.html",
				data : formData,
				type : "post",
				dataType : "text",
				timeout : 3600000,
				async : true,
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data == "") {
						alert("上传文件失败！");
					} else {
						$("#url").text(data);
					}
				},
				error : function(data) {
					alert(data);
				}
			});
		});

	});
</script>

</head>

<body>
	<center>
		<form id="uploadForm" enctype="multipart/form-data" method="post">
			阿里云OSS文件夹路径：<input type="text" name="path" style="width: 400px"
				value="app.appsp.com/app/ios/"> <br /> <br /> 选择文件：<input
				type="file" name="files" multiple="multiple"><br /> <br />
			<input type="button" value="上传" id="upload">
		</form>
		上传成功文件路径：<label id="url" />
	</center>
</body>
</html>
