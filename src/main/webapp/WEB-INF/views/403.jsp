<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang"/>
<!DOCTYPE html>
<html lang="${lang }">
<head>
<meta charset="UTF-8" />
<title><spring:message code="403.title"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="Keywords" content="<spring:message code="404.keys"/>"/>
<meta name="Description" content="<spring:message code="404.desc"/>"/>
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
		<div style="float: left;width: 150px;position: relative;top: 7px;"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/images/ci.gif"/>" alt="java-school" /></a></div>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="./inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<div id="content-categories">Error</div>
<h2>403</h2>
<p>
<spring:message code="403.msg" />
</p>
 <!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		<h1>Error</h1>
	</div>

	<div id="extra">
		<%@ include file="./inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="./inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>