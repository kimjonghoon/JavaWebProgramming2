<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="500.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="500.keys" />" />
<meta name="Description" content="<spring:message code="500.desc" />" />
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/print.css" type="text/css" />
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/commons.js"></script>
</head>
<body>
<div id="wrap">
	
	<div id="header">
		<div style="float: left;width: 150px;position: relative;top: 7px;"><a href="<%=request.getContextPath() %>"><img src="<%=request.getContextPath() %>/resources/images/ci.gif" alt="java-school" /></a></div>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="./inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<div id="content-categories">Error</div>
<h2>500</h2>
<p>
<spring:message code="500.msg" />
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