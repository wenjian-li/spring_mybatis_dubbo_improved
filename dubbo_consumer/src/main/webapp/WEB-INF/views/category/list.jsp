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

<title>分类列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="../js/jquery/pagination.css">
<script type="text/javascript" src="../js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.pagination.js"></script>

<script type="text/javascript">
	var total_size = 0;//总数据条数
	var page_size = 20;//每页显示数
	var pageIndex = 0;//当前页码
	$(document).ready(function(){
		//初始分页数据
		initPagination(pageIndex);
		
		 $("#Pagination").pagination(total_size, {
        	 callback: pageselectCallback,            
             prev_text: '上一页',             
             next_text: '下一页',
             link_to:'javascript:void(0);',//分页的链接,默认“#”
             items_per_page: page_size,//每页显示的条目数           
             num_display_entries: 5,//连续分页主体部分显示的分页条目数   
             current_page: pageIndex,//当前选中的页面
             num_edge_entries: 1  //两侧显示的首尾分页的条目数
        });
		 
	});
	//回调方法
	function pageselectCallback(page_index, jq){
		initPagination(page_index);
    }
	
	function initPagination(page_index) {
		$.ajax({
			url : "./getList.html",
			data : {currentPage:page_index+1,pageSize:page_size},
			type : "GET",
			dataType : "json",
			async:true,
			success : function(data) {
				if (!$.isEmptyObject(data)) {
					page_size = data.pageSize;
					total_size = data.totalSize;
					var htmlStr ="";
					$.each(data.list,function(i,item){
						htmlStr += "<li>分类ID："+item.id+"  分类名称："+item.categoryName+" 排序："+item.categorySort+"<li/>";
					});
					$("#list").html(htmlStr);
				} else {
					alert("系统异常！");
				}
			}
		});
     }
	
</script>

</head>

<body>
	<center>
		<ul id="list" style="list-style-type:none;">
		</ul>
        <div id="Pagination" class=""></div>
	</center>
</body>
</html>
