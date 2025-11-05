<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="lang" value="<spring:message code="lang"/>"/>
<!DOCTYPE html>
<html lang="${lang }">
<head>
<meta charset="UTF-8" />
<title><spring:message code="0010.title"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="Keywords" content="<spring:message code="0010.keys"/>"/>
<meta name="Description" content="<spring:message code="0010.desc"/>"/>
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/favicon.ico"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/${lang }.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/screen.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/print.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/jquery.js"/>"></script><!-- jQuery 3.7.1 -->
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<!-- for pretty code begin -->
<link rel="stylesheet" href="<c:url value="/resources/css/prettify.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/windows.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/prettify.js"/>"></script>
<script src="<c:url value="/resources/js/javaschool-prettify.js"/>"></script>
<!-- for pretty code end -->
</head>
<body>
<div id="wrap">
	
	<div id="header">
		<%@ include file="./inc/header.jsp" %>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="./inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<spring:message code="lang" var="lang" />
<c:choose>
	<c:when test="${lang == 'ko'}">
		<jsp:include page="./articles/0010-JDK-Install.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="./articles/0010-JDK-Install_en.jsp" />
	</c:otherwise>
</c:choose>
<!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		<h1>Home</h1>
		<ul>
		    <li class="sub-heading"><spring:message code="book.source" /></li>
		    <li><a href="https://github.com/kimjonghoon/SpringBbs"><spring:message code="1st.book" /></a></li>
		    <%-- <li><a href="https://github.com/kimjonghoon/GAEJavaProgramming"><spring:message code="2nd.book" /></a></li> --%>
		</ul>
		<a href="https://play.google.com/store/books/details?id=vlqKBgAAQBAJ"><img alt="Java Web Programming" src="<%=request.getContextPath() %>/resources/images/JavaWebPrograming.png" style="display: block;width: 100%;margin: 10px 0;"></a>
<%-- 		<a href="https://play.google.com/store/books/details?id=HOe4DAAAQBAJ"><img alt="Google Cloud Java Programming" src="<%=request.getContextPath() %>/resources/images/GAEJavaProgramming.jpg" style="display: block;width: 100%;margin: 10px 0;"></a> --%>
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
