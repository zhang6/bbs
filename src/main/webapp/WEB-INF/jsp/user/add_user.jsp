<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<base href="${config:url(pageContext.request)}">
<TITLE>添加用户</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="backstage/css/list.css" type="text/css" rel="stylesheet">
<LINK href="backstage/css/table.css" type="text/css" rel="stylesheet">
<script language="javascript" type="text/javascript">


function sureSubmit(objForm){
	//按钮设置 disabled="disabled"
	document.getElementById("submitForm").disabled=true;
	objForm.submit();
} 
</script>
  
</HEAD>
<BODY>
<form:form modelAttribute="user" method="post" >
<DIV class="d-box">
<div class="d-button">
	<input class="functionButton" type="button" onClick="javascript:window.location.href='${config:url(pageContext.request)}control/user/list${config:suffix()}'" value="返回">
</div>
<TABLE class="t-table" cellSpacing="1" cellPadding="2" width="100%" border="0">
  <TBODY>
  <TR>
    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>会员用户名：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<input class="form-text" name="userName" size="30" maxlength="30" value="${user.userName }"/>&nbsp;&nbsp;
    	<form:errors path="userName" class="span-text"/>
   		<SPAN class="span-help">会员用户名只能输入由数字、26个英文字母或者下划线组成</SPAN>
   	</TD>
  </TR>
  <TR>
    <TD class="t-label t-label-h" width="12%">呢称：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<input class="form-text" name="nickname" size="30" maxlength="30" value="${user.nickname}"/>&nbsp;&nbsp;
    	<form:errors path="nickname" class="span-text"/>
   	</TD></TR>
  <TR>
    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>密码：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    <input type="password" class="form-text" name="password" size="30" maxlength="30" value="${user.password }"/>
    &nbsp;&nbsp;<form:errors path="password" class="span-text"/>
	</TD></TR>

  <TR>
    <TD class="t-label t-label-h" width="12%">Email地址：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<input class="form-text" name="email" size="50" maxlength="40" value="${user.email}"/>
    	&nbsp;&nbsp;<form:errors path="email" class="span-text"/>
    	</TD>
  </TR>
  <TR>
    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>密码提示问题：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<input class="form-text" name="issue" size="50" maxlength="40" value="${user.issue}"/>
    	&nbsp;&nbsp;<SPAN style="color: red"><form:errors path="issue"  class="span-text"/></SPAN></TD>
  </TR>
  <TR>
    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>密码提示答案：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<input class="form-text" name="answer" size="50" maxlength="40" value="${user.answer}"/>
    	&nbsp;&nbsp;<form:errors path="answer" class="span-text"/></TD>
  </TR>

  <TR>
	    <TD class="t-label t-label-h" width="12%">手机：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<input class="form-text" name="mobile" size="50" maxlength="60" value="${user.mobile}"/>
	    	&nbsp;&nbsp;<form:errors path="mobile" class="span-text"/></span>
    	</TD>
	</TR>
  <TR>
    <TD class="t-label t-label-h" width="12%">实名认证：</TD>
    <TD class="t-content" width="88%" colSpan="3">
		<label><INPUT type="radio" value="true" name="realNameAuthentication" <c:if test="${ user.realNameAuthentication == true}">checked="checked"</c:if>>已实名</label>
		<label><INPUT type="radio" value="false" name="realNameAuthentication" <c:if test="${ user.realNameAuthentication == false}">checked="checked"</c:if> >未实名</label>
    
    </TD>
  </TR>
  
  <TR>
    <TD class="t-label t-label-h" width="12%">用户状态：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<label><INPUT id="radios" type="radio" value="1" name="state" <c:if test="${ user.state eq 1 || user.state eq 11}">checked="checked"</c:if>>正常用户</label>
		<label><INPUT id="radios" type="radio" value="2" name="state" <c:if test="${ user.state eq 2 || user.state eq 12}">checked="checked"</c:if> >禁止用户</label>
    
    </TD>
  </TR>
  <TR>
    <TD class="t-label t-label-h" width="12%">显示用户动态：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<label><INPUT type="radio" value="true" name="allowUserDynamic" <c:if test="${ user.allowUserDynamic == true}">checked="checked"</c:if>>显示</label>
		<label><INPUT type="radio" value="false" name="allowUserDynamic" <c:if test="${ user.allowUserDynamic == false}">checked="checked"</c:if> >关闭</label>
    
    </TD>
  </TR>
	<TR>
    <TD class="t-label t-label-h" width="12%">备注：</TD>
    <TD class="t-content" width="88%" colSpan="3">
    	<textarea class="form-textarea" name="remarks" cols="80" rows="5" >${user.remarks }</textarea>
    </TD>
  </TR>
	<!-- 用户自定义注册功能项 -->
	<c:forEach items="${userCustomList}" var="entry" varStatus="status">
	<TR>
    <TD class="t-label t-label-h" width="12%"><c:if test="${entry.required == true}"><SPAN class="span-text">*</SPAN></c:if>${entry.name}：</TD>
    <TD class="t-content" width="88%" colSpan="3">
		<c:if test="${entry.chooseType ==1}">
			<input type="text" class="form-text" name="userCustom_${entry.id}" value="<c:forEach items='${entry.userInputValueList}' var='userInputValue'>${userInputValue.content}</c:forEach>" size="${entry.size}" maxlength="${entry.maxlength}">
			<SPAN class="span-help">${entry.tip}</SPAN>
		</c:if>
		<c:if test="${entry.chooseType ==2}">
			
			<c:forEach items="${entry.itemValue}" var="itemValue" varStatus="status">
				<!-- 选中项 -->
				<c:set var="_checked" value=""></c:set>
				<c:forEach items='${entry.userInputValueList}' var='userInputValue'>
					<c:if test="${userInputValue.options == itemValue.key}">
						<c:set var="_checked" value=" checked='checked'"></c:set>
					</c:if>
				</c:forEach>
			
				<!-- 默认选第一项 -->				
				<label><input type="radio" name="userCustom_${entry.id}" value="${itemValue.key}" ${_checked} <c:if test="${fn:length(entry.userInputValueList)==0 && status.count == 1}"> checked='checked'</c:if>>${itemValue.value}</label>
			</c:forEach>
			<SPAN class="span-help">${entry.tip}</SPAN>
		</c:if>
		<c:if test="${entry.chooseType ==3}">
			<c:forEach items="${entry.itemValue}" var="itemValue">
				<c:set var="_checked" value=""></c:set>
				<c:forEach items='${entry.userInputValueList}' var='userInputValue'>
					<c:if test="${userInputValue.options == itemValue.key}">
						<c:set var="_checked" value=" checked='checked'"></c:set>
					</c:if>
				</c:forEach>
			
			
				<label><input type="checkbox" name="userCustom_${entry.id}" value="${itemValue.key}" ${_checked}>${itemValue.value}</label>
			</c:forEach>
			<SPAN class="span-help">${entry.tip}</SPAN>
		</c:if>
		<c:if test="${entry.chooseType ==4}">
		
			<select class="form-select" name="userCustom_${entry.id}" <c:if test="${entry.multiple == true}"> multiple='multiple'</c:if> <c:if test="${entry.selete_size != null}"> size='${entry.selete_size}'</c:if>>
				<c:forEach items="${entry.itemValue}" var="itemValue">
					<c:set var="_selected" value=""></c:set>
					<c:forEach items='${entry.userInputValueList}' var='userInputValue'>
						<c:if test="${userInputValue.options == itemValue.key}">
							<c:set var="_selected" value=" selected='selected'"></c:set>
						</c:if>
					</c:forEach>
				
					<option value="${itemValue.key}" ${_selected}>${itemValue.value}</option>		
				</c:forEach>	
			</select>
			<SPAN class="span-help">${entry.tip}</SPAN>
		</c:if>
		<c:if test="${entry.chooseType ==5}">
			<textarea class="form-textarea" name="userCustom_${entry.id}" rows="${entry.rows}" cols="${entry.cols}"><c:forEach items='${entry.userInputValueList}' var='userInputValue'>${userInputValue.content}</c:forEach></textarea>			
			<SPAN class="span-help">${entry.tip}</SPAN>
		</c:if>
		<c:set var="userCustom_id" value="userCustom_${entry.id}"></c:set>
		<SPAN class="span-text">${error[userCustom_id]}</SPAN>
    </TD>
  </TR>
  </c:forEach>
	
	
	<tr>
    <TD class="t-button" colSpan="4">
    	<span class="submitButton"><INPUT type="button" id="submitForm" value="提交" onClick="javascript:sureSubmit(this.form);"></span>
  	</TD>
  </TR>
</TBODY></TABLE>
</DIV>
</form:form>
</BODY></HTML>
