//加载权限
$(function(){
	$(".btn_reload").click(function(){
		var url=$(this).data("url");
		$.dialog({
			title:"温馨提示",
			icon:"face-smile",
			content:"亲，重新加载权限可能需要很长时间，您确定加载嘛？",
			ok:function(){
				$.post(url,function(data){
					$.dialog({
						title:"温馨提示",
						content:data,
						ok:function(){
							window.location.reload();
						}
					})
				})
			},
			cancel:true
		})
	});
})