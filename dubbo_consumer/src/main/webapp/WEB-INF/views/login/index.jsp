<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<meta charset="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="./js/jquery/jquery-1.8.3.min.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				// 更换验证码
				$("#captchaImage").click(
						function() {
							$("#captchaImage").attr(
									"src",
									"./common/captcha.html?captchaId=${captchaId}&timestamp="
											+ (new Date()).valueOf());
						});

				$("#submit").click(
						function() {
							//FormData支持文件ajax上传
							//使用 jQuery 来发送 FormData，但必须要正确的设置相关选项：
							//processData: false,  // 告诉jQuery不要去处理发送的数据
							//contentType: false   // 告诉jQuery不要去设置Content-Type请求头
							//支持浏览器：Chrome 7+, Firefox(2.0) 4.0, Internet Explorer 10+, Opera 12+,Safari 5+
							$.ajax({
								url : "./login/submit.html",
								data : $("#loginForm").serialize(),
								type : "post",
								dataType : "text",
								cache : false,
								success : function(data) {
									if (data == "成功") {
										//alert("登录成功！");
										window.location.href = "./";
									} else {
										$("#message").text(data);
										$("#captchaImage").attr(
												"src",
												"./common/captcha.html?captchaId=${captchaId}&timestamp="
														+ (new Date())
																.valueOf());
									}
								},
								error : function(data) {
								}
							});
						});
				/**回车**/
				$("#captcha").keydown(function(e) {
					if (e.keyCode == 13) {
						$("#submit").click();
					}
				});

			});
</script>

</head>

<body>
	<center>
		<form id="loginForm" action="../login/submit.html" method="post">
			<input type="hidden" name="captchaId" id="captchaId"
				value="${captchaId }"> 用户名称：<input type="text"
				name="username" id="username" value="lwj"> <br /> <br />
			用户密码：<input type="password" name="password" id="password"
				value="123456"> <br /> <br /> 验证码：<input type="text"
				name="captcha" id="captcha">&nbsp;&nbsp;<img
				id="captchaImage" class="captchaImage"
				src="./common/captcha.html?captchaId=${captchaId}" title="点击切换验证码"
				style="vertical-align: middle;" /><br /> <br /> <input
				type="button" value="登录" id="submit"> <input type="button"
				value="退出"
				onclick="javascript:window.location.href='../login/logout.html'">
		</form>
		<label id="message"></label>
	</center>
</body>
</html>
