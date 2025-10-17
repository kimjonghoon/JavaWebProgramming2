<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div style="float: left;width: 150px;position: relative;top: 7px;"><a href="${ctx}"><img src="${ctx}/resources/images/ci.gif" alt="java-school" /></a></div>

<div id="memberMenu" style="float: right;position: relative;top: 7px;">
<security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	<security:authentication property="principal.username" var="check" />
</security:authorize>
<c:choose>
	<c:when test="${empty check}">
		<a href="${ctx}/users/login"><button type="button"><spring:message code="login" /></button></a>
		<a href="${ctx}/users/signUp"><button type="button"><spring:message code="signup" /></button></a>
	</c:when>
	<c:otherwise>
		<button type="button" id="logout"><spring:message code="logout" /></button>
		<a href="${ctx}/users/editAccount"><button type="button"><spring:message code="modify.account" /></button></a>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<a href="${ctx}/admin?page=1"><button type="button">Admin</button></a>
		</security:authorize>
	</c:otherwise>
</c:choose>    
</div>
<%
String url = "";
String english = "";
String korean = "";
String qs = request.getQueryString();
if (qs != null) {
	if (qs.indexOf("&lang=") != -1) {
		qs = qs.substring(0, qs.indexOf("&lang="));
	}
	if (qs.indexOf("lang=") != -1) {
		qs = qs.substring(0, qs.indexOf("lang="));
	}
	if (!qs.equals("")) {
		String decodedQueryString = java.net.URLDecoder.decode(request.getQueryString(), "UTF-8");
		url = "?" + decodedQueryString;
		if (url.indexOf("&lang=") != -1) {
			url = url.substring(0, url.indexOf("&lang="));
		}
		english = url + "&lang=en";
		korean = url + "&lang=ko";
	} else {
		english = url + "?lang=en";
		korean = url = "?lang=ko";
	}
} else {
	english = url + "?lang=en";
	korean = url = "?lang=ko";
}
pageContext.setAttribute("english", english);
pageContext.setAttribute("korean", korean);
%>
<div id="localeChangeMenu" style="float: right;position: relative;top: 7px;margin-right: 10px;">
	<input type="button" value="English" onclick="location.href = '${english}'" />
	<input type="button" value="Korean" onclick="location.href = '${korean }'" />
</div>
<form id="logoutForm" action="${ctx}/logout" method="post" style="display:none">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<script>
$(document).ready(function () {
	$('#logout').click(function () {
		$('#logoutForm').submit();
		return false;
	});
});
</script>
