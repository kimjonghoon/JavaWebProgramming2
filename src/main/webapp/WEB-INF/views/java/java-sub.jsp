<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h1>Java</h1>
<spring:message code="lang" var="lang" />
<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li class="sub-heading">자바 소개</li>
	    <li><a href="<%=request.getContextPath() %>/java/Features">자바의 특징</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Class-Object">객체와 클래스</a></li>
	
	    <li class="sub-heading">자바 기초</li>
	    <li><a href="<%=request.getContextPath() %>/java/Keyword_Identifiers_Comment">키워드 식별자 주석</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/DataType_Casting">데이터 타입과 타입 캐스팅</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Arrays">배열</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Operators_if_loops">연산자 switch if 반복문</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Package_Modifiers">패키지와 접근자</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Inheritance">상속</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Static">static 키워드</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Collection">컬렉션</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Exception">예외</a></li>
	
	    <li class="sub-heading">예제: 자바은행</li>
	    <li><a href="<%=request.getContextPath() %>/java/Javabank-Requirements-analysis">요구사항 분석</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Javabank-Design">구현</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Javabank-Inheritance">상속 적용</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Javabank-Abstract-class">추상 클래스 적용</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Javabank-Interface">인터페이스 적용</a></li>
	
	    <li class="sub-heading">스레드 I/O 네트워크</li>
	    <li><a href="<%=request.getContextPath() %>/java/Thread">스레드</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Stream">자바 I/O</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Logging">로깅</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/Socket">소켓</a></li>
	    <li><a href="<%=request.getContextPath() %>/java/RMI">RMI</a></li>
	</ul>	    	
	</c:when>
	<c:otherwise>
	<ul>
		<li class="sub-heading">Java Introduction</li>
		<li><a href="<%=request.getContextPath() %>/java/Features">Java Features</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Class-Object">Object and Class</a></li>
		
		<li class="sub-heading">Java Basic</li>
		<li><a href="<%=request.getContextPath() %>/java/Keyword_Identifiers_Comment">Identifiers</a></li>
		<li><a href="<%=request.getContextPath() %>/java/DataType_Casting">Data Type</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Arrays">Arrays</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Operators_if_loops">Operators if switch loops</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Package_Modifiers">Package and Modifiers</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Inheritance">Inheritance</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Static">static keyword</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Collection">Collection</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Exception">Exception</a></li>
		
		<li class="sub-heading">Example: Java Bank</li>
		<li><a href="<%=request.getContextPath() %>/java/Javabank-Requirements-analysis">Requirements Analysis</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Javabank-Design">Application Design</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Javabank-Inheritance">Inheritance</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Javabank-Abstract-class">Abstract Class</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Javabank-Interface">Interface</a></li>
		
		<li class="sub-heading">Thread I/O Network</li>
		<li><a href="<%=request.getContextPath() %>/java/Thread">Thread</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Stream">Java I/O</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Logging">Logging</a></li>
		<li><a href="<%=request.getContextPath() %>/java/Socket">Socket</a></li>
		<li><a href="<%=request.getContextPath() %>/java/RMI">RMI</a></li>
	</ul>		
	</c:otherwise>
</c:choose>