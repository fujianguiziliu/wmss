<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/commonAll.js"></script>
<title>PSS-账户管理</title>
<style>
.alt td {
	background: black !important;
}
</style>
<script type="text/javascript">
	/* $(function() {
		$(".btn_input").click(function() {
			window.location.href = $(this).data("url");
		});
		//翻页
		$(".btn_page")
				.click(
						function() {
							$(":input[name='qo.currentPage']")
									.val(
											$(this).data("page")
													|| $(
															":input[name='qo.currentPage']")
															.val());
							$("#searchForm").submit();
						});
		//每页多少条数据
		$(":input[name='qo.pageSize']").change(function() {
			$("#searchForm").submit();
		});
	}); */
</script>
</head>
<body>
	<s:form id="searchForm" namaspace="/" action="employee" method="post">
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							姓名/邮箱
							<s:textfield name="qo.keyword" class="ui_input_txt02"></s:textfield>
							所属部门
							<s:select list="#depts" name="qo.deptId" headerKey="-1"
								headerValue="全部部门" listKey="id" listValue="name"
								cssClass="ui_select01" />
						</div>
						<div id="box_bottom">
							<s:submit value="查询" class="ui_input_btn01 btn_page" data-page="1"></s:submit>
							<input type="button" value="批量删除" class="ui_input_btn01 btn_batchDelete" 
							data-url="<s:url namespace="/" action="employee_batchDelete"/>"/>
							<input type="button" value="新增" class="ui_input_btn01 btn_input"
								data-url="<s:url namespace="/" action="employee_input"/>"/>
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%"
						align="center" border="0">
						<tr>
							<th width="30">
								<input type="checkbox" id="all" />
							</th>
							<th>编号</th>
							<th>用户名</th>
							<th>邮箱</th>
							<th>年龄</th>
							<th>所属部门</th>
							 <th>角色</th> 
							<th>操作</th>
						</tr>
						<tbody>
							<s:iterator value="#result.listData" var="e">
								<tr>
									<td>
										<input type="checkbox" name="IDCheck" class="acb" 
										data-oid="<s:property value="id"/>"/>
									</td>
									<td>
										<s:property value="#e.id" />
									</td>
									<td>
										<s:property value="#e.name" />
									</td>
									<td>
										<s:property value="#e.email" />
									</td>
									<td>
										<s:property value="#e.age" />
									</td>
									<td>
										<s:property value="#e.dept.name" />
									</td>
									<td>
										<s:property value="#e.roleNames" />
									</td>
									<td>
										<s:a namespace="/" action="employee_input">
											<s:param name="e.id" value="#e.id" />编辑</s:a> |
																			
										<s:a namespace="/" action="employee_delete">
											<s:param name="e.id" value="#e.id" />删除</s:a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<!-- 抽取分页 -->
				<%@include file="/WEB-INF/views/common/common_page.jsp"%>
				<%-- <div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04"><s:property value="#result.totalCount"/></span>
						条记录，当前第
						<span class="ui_txt_bold04"><s:property value="#result.currentPage"/>/<s:property value="#result.totalPage"/></span>
						页
					</div>
					<div class="ui_frt">
						<input type="button" value="首页" class="ui_input_btn01 btn_page" data-page="1"/>
						<input type="button" value="上一页" class="ui_input_btn01 btn_page" data-page="<s:property value="#result.prePage"/>"/>
						<input type="button" value="下一页" class="ui_input_btn01 btn_page" data-page="<s:property value="#result.nextPage"/>"/>
						<input type="button" value="尾页" class="ui_input_btn01 btn_page" data-page="<s:property value="#result.totalPage"/>"/>
						
						<s:select list="{5,10,20,50}" name="qo.pageSize" class="ui_select02">
							<!-- <option>10</option>
							<option>20</option>
							<option>50</option> -->
						</s:select>
						转到第
						<!-- <input type="text" name="" value="" class="ui_input_txt01" /> -->
						<s:textfield name="qo.currentPage" class="ui_input_txt01"/>
						页
							 <input type="button" class="ui_input_btn01 btn_page" value="跳转"/>
					</div> --%>
				</div>
			</div>
		</div>
	</s:form>
</body>
</html>
