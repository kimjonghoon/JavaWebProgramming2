<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang"/>
<!DOCTYPE html>
<html lang="${lang }">
<head>
<meta charset="UTF-8" />
<title><spring:message code="user.welcome.title"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="Keywords" content="<spring:message code="user.welcome.keys"/>"/>
<meta name="Description" content="<spring:message code="user.welcome.desc"/>"/>
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/favicon.ico"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/${lang }.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/screen.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/print.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
</head>
<body>
<div id="wrap">
	
	<div id="header">
		<%@ include file="../inc/header.jsp" %>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="../inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">	
<!-- content begin -->
<div id="content-categories"><spring:message code="membership" /></div>

<h2><spring:message code="welcome.heading" /></h2>

<spring:message code="welcome.message" /><br />
<a href="login"><button type="button"><spring:message code="login" /></button></a>
<!-- content end -->
		</div>
	</div>
	
	<div id="sidebar" lang="en">
		<%@ include file="user-sub.jsp" %>
	</div>
	
	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>
</div>

</body>
</html>	