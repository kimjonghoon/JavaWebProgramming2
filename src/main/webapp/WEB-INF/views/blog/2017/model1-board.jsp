<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="model1-board.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="model1-board.keys" />" />
<meta name="Description" content="<spring:message code="model1-board.desc" />" />
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/print.css" type="text/css" />
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/commons.js"></script>
<!-- for pretty code begin -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/prettify.css" type="text/css" />
<script src="<%=request.getContextPath() %>/resources/js/prettify.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/javaschool-prettify.js"></script>
<!-- for pretty code end -->
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
		<%@ include file="../../inc/header.jsp" %>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="../../inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<spring:message code="lang" var="lang" />
<c:choose>
	<c:when test="${lang == 'ko'}">
		<jsp:include page="../../articles/blog/2017/model1-board.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../../articles/blog/2017/model1-board_en.jsp" />
	</c:otherwise>
</c:choose>
<!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		
	</div>

	<div id="extra">
		<%@ include file="../../inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="../../inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>
