$(function(){
	$("#all").click(function(){
		selectOrClearAllCheckbox(this);
	});
	
	$(".btn_batchDelete").click(function(){
		if($("input[name='IDCheck']:checked").size()<=0){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'至少选择一条', ok:true,});
			return;
		}
		var selected=[];
		var refreshLocation=$(this).attr("data-refresh-href");
		$("input[name='IDCheck']:checked").each(function(index,item){
			selected[index]=$(item).val();
		});
		$.ajax({
	        url : $(this).attr("data-href"),
	        data: $.param({"ids":selected},true),
	        type : "POST",
	        dataType : 'json',
	        success : function (result){
	        	art.dialog({icon:'info', title:'提示', drag:false, resize:false, content:'批量删除成功', 
	        		ok:function(){window.location.href=refreshLocation}});
	        }
		});
	});
	
	if($("#editForm").size()>0){
		$("#editForm").validate({
			rules:{
				"e.name":{
					required:true,
					minlength: 4
				},
				"e.password":{
					required:true,
					minlength: 4
				},
				"repassword":{
					equalTo: "#password"
				},
				"e.email":{
					email:true
				},
				
				"e.age":{
					digits: true,
					range: [18, 60]
				}
			},
			messages:{
				"e.name":{
					required:"用户名不能为空!",
					minlength:"用户名长度至少4位"
				},
				"e.password":{
					required:"密码不能为空!",
					minlength:"密码长度至少4位"
				},
				'repassword':{
 					equalTo:"重复验证密码和密码相同"
 				},
 				'e.email':{
 					email:"请输入合法的email"
 				},
 				'e.age':{
 					range:"年龄必须在18到68之间",
 					digits:"年龄必须是整数"
 				}
			}
		});
	}
	
	$("#select").click(function(){
		$(".all_roles option:selected").appendTo(".selected_roles");
	});
	
	$("#selectAll").click(function(){
		$(".all_roles option").appendTo(".selected_roles");
	});
	
	$("#deselect").click(function(){
		$(".selected_roles option:selected").appendTo(".all_roles");
	});
	
	$("#deselectAll").click(function(){
		$(".selected_roles option").appendTo(".all_roles");
	});
	
	$("#editForm").submit(function(){
		if($(".selected_roles option:selected").size()!=$(".selected_roles option")){
			$(".selected_roles option").prop("selected",true);
		}
	});
	
	if($(".selected_roles option").size()>0){
		var arr=$.map($(".selected_roles option"),function(option){
			return $(option).attr("value");
		});
		$(".all_roles option").filter(function(index){
			return $.inArray($(this).attr("value"),arr)>=0;
		}).remove();
	}
});

$(function(){
	$("#select").click(function(){
		$(".all_role option:selected").appendTo($(".selected_role"));
	});
	
	$("#selectAll").click(function(){
		$(".all_role option").appendTo($(".selected_role"));
	});
	
	$("#deselect").click(function(){
		$(".selected_role option:selected").appendTo($(".all_role"));
	});
	
	$("#deselectAll").click(function(){
		$(".selected_role option").appendTo($(".all_role"));
	});
	
	$("#editForm").submit(function(){
		$(".selected_role option").prop("selected",true);
		/*if($(".selected_roles option:selected").size()!=$(".selected_roles option")){
			$(".selected_roles option").prop("selected",true);
		}*/
	});
	
	$(function(){
		//第一种
		console.log($(".selected_role option"));
		var selectedIds=$.map($(".selected_role option"),function(item,index,arr){
			return $(item).val();
		});
		console.log(selectedIds);
		$.each($(".all_role option"),function(index,item){
			//console.log(arguments);
			//ids.push($(item).val());
			console.log(index,item);
			var id=$(item).val();
			if($.inArray(id,selectedIds)>=0){
				$(item).remove();
			}
		});
		
	})
		
});