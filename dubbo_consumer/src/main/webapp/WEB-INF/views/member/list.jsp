<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>用户列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="用户列表">
<meta http-equiv="description" content="用户列表">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="../js/jquery/pagination.css">
<script type="text/javascript"
	src="../js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="../js/jquery/jquery.pagination.js"></script>

<script type="text/javascript">
	
	$(document).ready(function() {
		var pageData = {
				init:function(){
					this.total_size = 0;//总数据条数
					this.page_size = 2;//每页显示数
					this.pageIndex = 0;//当前页码
					this.initPage();
				},
				/**
				 *初始化分页，展示分页信息并动态获取总数据条数、每页展示条数
				 */
				initPage:function(){
					var self = this;
					//初始化分页，展示分页信息并动态获取总数据条数、每页展示条数
					$.when(
						self.getPageData(0)
					).done(function(data){
						//初始化分页插件
						$("#Pagination").pagination(self.total_size, {
							callback : self.pageCallBack,
							prev_text : '上一页',
							next_text : '下一页',
							link_to : 'javascript:void(0);',//分页的链接,默认“#”
							items_per_page : self.page_size,//每页显示的条目数           
							num_display_entries : 5,//连续分页主体部分显示的分页条目数   
							current_page : self.pageIndex,//当前选中的页面
							num_edge_entries : 1//两侧显示的首尾分页的条目数
						})
					});
				},
				/**
				 *分页插件回调方法，page_index为当前页码
				 */
				pageCallBack:function(page_index, jq){
					var self = this;
					pageData.getPageData(page_index);
				},
				/**
				 *展示分页数据
				 */
				getPageData:function(page_index){
					var deferred = $.Deferred();
					var self = this;
					$.ajax({
						url : "../member/getPageData.html",
						data : {
							pageNum : page_index + 1,
							pageSize : self.page_size
						},
						type : "POST",
						dataType : "json",
						success : function(data) {
							if (!$.isEmptyObject(data)) {
								self.page_size = data.result.pageSize;
								self.total_size = data.result.total;
								var htmlStr = "";
								$.each(data.result.list, function(i, item) {
									htmlStr += "<li>ID:" + item.id + " 名称：" + item.username + " 密码：" + item.password +" 创建时间：" + item.createTime +"<li/>";
								});
								$("#list").html(htmlStr);
							} else {
								alert("系统异常！");
							}
							deferred.resolve();
						}
					});
					 return deferred;
				}
		}
		
		//调用初始化方法
		pageData.init();
		
	});
</script>

</head>

<body>
	<center>
		<h4>用户列表</h4>
		<ul id="list" style="list-style-type: none;">
		</ul>
		<div id="Pagination" class=""></div>
	</center>
</body>
</html>
