<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="blog.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="blog.keys" />" />
<meta name="Description" content="<spring:message code="blog.desc" />" />
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/print.css" type="text/css" />
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/commons.js"></script>
<style>
#sidebar  {
    display: none;
}
#content  {
    margin-left: 0;
}
</style>
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
<spring:message code="lang" var="lang" />
<c:choose>
	<c:when test="${lang == 'ko'}">
		<jsp:include page="../articles/blog-index.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../articles/blog-index_en.jsp" />
	</c:otherwise>
</c:choose>
<!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		
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
