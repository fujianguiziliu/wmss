/** table鼠标悬停换色* */
/*$(function() {
	// 如果鼠标移到行上时，执行函数
	$(".table tr").mouseover(function() {
		$(this).css({background : "#CDDAEB"});
		$(this).children('td').each(function(index, ele){
			$(ele).css({color: "#1D1E21"});
		});
	}).mouseout(function() {
		$(this).css({background : "#FFF"});
		$(this).children('td').each(function(index, ele){
			$(ele).css({color: "#909090"});
		});
	});
});*/
jQuery.ajaxSettings.traditional = true;
$(function(){
	
	//1选中新增按钮，绑定一个点击事件
	$(".btn_input").click(function(){
		var  url=$(this).data("url");
		//通过action跳转到新增界面
		window.location.href=url;
	});
	
	//给分页按钮绑定点击事件
	$(".btn_page").click(function(){
		var pageNo=$(this).data("page") || $("[name='qo.currentPage']").val();
		//获取到当前页的jquery对象并给其赋值
		 $("[name='qo.currentPage']").val(pageNo);
		 //提交表单
		 $("#searchForm").submit();
	});
	//给页面大小绑定一个值改变事件
	$("[name='qo.pageSize']").change(function(){
		$("#searchForm").submit();
	});
	
	
	//批量删除的操作
	$(".btn_batchDelete").click(function(){
		//获取到需要批量删除的url
		var url=$(this).data("url");
		//获取到复选框
		/*console.log($(".acb:checked"));
		var checkboxArr=$(".acb:checked").get();
		for(var index=0;index<checkboxArr.length;index++){
			console.log(checkboxArr[index]);
			console.log($(checkboxArr[index]).data("oid"));
			ids.push($(checkboxArr[index]).data("oid"))
		}*/
		var ids=$.map($(".acb:checked"),function(item,index,arr){
			return $(item).data("oid");
		});
		//console.log(ids);
		//使用jquery的post提交
		$.post(url,{"ids":ids},function(){
			alert("批量删除成功");
			window.location.reload();
		})
	});
})















