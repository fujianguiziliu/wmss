<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/style/basic_layout.css" rel="stylesheet" type="text/css">
<link href="/style/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/artDialog/jquery.artDialog.js?skin=chrome"></script>
<script type="text/javascript" src="/js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/jquery/messages_cn.js"></script>
<script type="text/javascript" src="/js/commonAll.js"></script>
<script type="text/javascript" src="/js/system/employee.js"></script>

 <%-- <script>
 	$(function(){
 		$("#editForm").validate({
 			rules:{
 				'e.name':{
 					required:true,
 					minlength:4
 				},
 				'e.password':{
 					required:true,
 					minlength:4
 				},
 				'repassword':{
 					equalTo:"#password"
 				},
 				'e.email':{
 					email:true
 				},
 				'e.age':{
 					range:[18,68],
 					digits:true
 				}
 				
 			},
 			 messages:{
 				'e.name':{
 					required:"用户名不能为空",
 					minlength:"最小长度4位"
 				},
 				'e.password':{
 					required:"密码不能为空",
 					minlength:"最小长度4位"
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
 			
 		})	
 	})
 </script>
  --%>
 
 
 
 </head>

<body>
<%@include file="/WEB-INF/views/common/common_message.jsp" %>
	<s:form name="editForm" namespace="/" action="employee_saveOrUpdate"
		id="editForm">
		<s:hidden name="e.id" />
		<div id="container">
			<div id="nav_links">
				<span style="color: #1A5CC6;">用户编辑</span>
				<div id="page_close">
					<a>
						<img src="/images/common/page_close.png" width="20" height="20"
							style="vertical-align: text-top;" />
					</a>
				</div>
			</div>
			<div class="ui_content">
				<table cellspacing="0" cellpadding="0" width="100%" align="left"
					border="0">
					<tr>
						<td class="ui_text_rt" width="140">用户名</td>
						<td class="ui_text_lt">
							<s:textfield name="e.name" cssClass="ui_input_txt02" />
						</td>
					</tr>
					<s:if test="e.id==null">
						<tr>
							<td class="ui_text_rt" width="140">密码</td>
							<td class="ui_text_lt">
								<s:password name="e.password" id="password"
									cssClass="ui_input_txt02" />
							</td>
						</tr>
						<tr>
							<td class="ui_text_rt" width="140">确认密码</td>
							<td class="ui_text_lt">
								<s:password name="repassword" cssClass="ui_input_txt02" />
							</td>
						</tr>
					</s:if>
					<tr>
						<td class="ui_text_rt" width="140">邮箱</td>
						<td class="ui_text_lt">
							<s:textfield name="e.email" cssClass="ui_input_txt02" />
						</td>
					</tr>
					<tr>
						<td class="ui_text_rt" width="140">年龄</td>
						<td class="ui_text_lt">
							<s:textfield name="e.age" cssClass="ui_input_txt02" />
						</td>
					</tr>
					<tr>
						<td class="ui_text_rt" width="140">所属部门</td>
						<td class="ui_text_lt">
							<s:select list="#depts" name="e.dept.id" listKey="id"
								listValue="name" cssClass="ui_select01" />
						</td>
					</tr>
					<tr>
						<td class="ui_text_rt" width="140">超级管理员</td>
						<td class="ui_text_lt">
							<s:checkbox name="e.admin" cssClass="ui_checkbox01" />
						</td>
					</tr>
					<tr>
						<td class="ui_text_rt" width="140">角色</td>
						<td class="ui_text_lt">
							<table>
								<tr>
									<td>
										<s:select list="#roles" name="" listKey="id" listValue="name"
											multiple="true" cssClass="ui_multiselect01 all_roles" />
									</td>
									<td align="center">
										<input type="button" id="select" value="--->"
											class="left2right" />
										<br />
										<input type="button" id="selectAll" value="==>"
											class="left2right" />
										<br />
										<input type="button" id="deselect" value="<---"
											class="left2right" />
										<br />
										<input type="button" id="deselectAll" value="<=="
											class="left2right" />
									</td>
									<td>
										<s:select list="e.roles" name="e.roles.id"
											listKey="id" listValue="name" multiple="true"
											cssClass="ui_multiselect01 selected_roles" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td class="ui_text_lt">
							&nbsp;
							<s:submit value="提交" class="ui_input_btn01"></s:submit>
							&nbsp;
							<input id="cancelbutton" type="button" value="重置"
								class="ui_input_btn01" />
						</td>
					</tr>
				</table>
			</div>
		</div>
	</s:form>
</body>
</html>