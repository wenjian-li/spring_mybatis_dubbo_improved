<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
/***设置提示颜色**/
label.error {
	color: red;
	font-size: 12px
}
</style>
<script type="text/javascript" src="../js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 	$("#add").click(function() {
				$.ajax({
					url : "../member/save.html",
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
			}); */

		// 自定义memberName验证方法
		jQuery.validator.addMethod("username", function(value, element) {
			var akey = /^[A-Za-z0-9_]+$/;
			return this.optional(element) || (akey.test(value.trim()));
		}, "只允许输入英文字母、数字和下划线");
		$("#addForm").validate({
			debug : true,//调试模式取消submit的默认提交功能 
			focusInvalid : false, //当为false时，验证无效时，没有焦点响应  
			onkeyup : false,
			//改变错误提示位置
			/* errorPlacement : function(error, element) {
				if(element.is(":radio"))
					error.appendTo(element.parent().next().next());
				else
					error.appendTo(element.parent());
			}, */
			submitHandler : function(form) {
				$.ajax({
					url : "../member/save.html",
					data : $("#addForm").serialize(),
					type : "post",
					dataType : "json",
					success : function(data) {
						if (data.code == "000") {
							alert("成功！");
							location.reload();
						} else {
							alert("失败！");
						}
					}
				});
			},
			//校验规则
			rules : {
				username : {
					required : true,
					//自定义验证方法
					username : true,
					maxlength : 20,
					minlength : 2,
					remote : {
						url : "../member/checkUsername.html",
						type : "post",
						dataType : "json",
						data : {
							username : function() {
								return $("input[name='username']").val();
							}
						}
					}
				},
				password : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				sex : {
					required : true,
					digits : true
				}
			},
			//提示信息
			messages : {
				username : {
					required : "用户名称必填",
					maxlength : "不超过20个字",
					minlength : "不小于2个字",
					remote : "该用户名称已被占用"
				},
				password : {
					required : "密码必填"
				},
				email : {
					required : "邮箱必填",
					email : "邮箱格式不正确"
				},
				sex : {
					required : "性别必选",
					digits : "整数数字"
				}
			}
		});

	});
</script>

</head>

<body>
	<center>
		<form id="addForm">
			名称：<input type="text" name="username"> <br /> <br /> 密码：<input
				type="password" name="password"><br /> <br /> 邮箱：<input
				type="text" name="email"><br /> <br />性别：<input
				type="radio" name="sex" value="0">男 <input
				type="radio" name="sex" value="1">女 <br /> <br /> <input
				type="submit" value="添加" id="add">
		</form>
	</center>
</body>
</html>
