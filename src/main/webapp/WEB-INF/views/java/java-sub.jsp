<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h1>Java</h1>
<spring:message code="lang" var="lang" />
<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li class="sub-heading">자바 소개</li>
	    <li><a href="<c:url value="/java/Features"/>">자바의 특징</a></li>
	    <li><a href="<c:url value="/java/Class-Object"/>">객체와 클래스</a></li>
	
	    <li class="sub-heading">자바 기초</li>
	    <li><a href="<c:url value="/java/Keyword_Identifiers_Comment"/>">키워드 식별자 주석</a></li>
	    <li><a href="<c:url value="/java/DataType_Casting"/>">데이터 타입과 타입 캐스팅</a></li>
	    <li><a href="<c:url value="/java/Arrays"/>">배열</a></li>
	    <li><a href="<c:url value="/java/Operators_if_loops"/>">연산자 switch if 반복문</a></li>
	    <li><a href="<c:url value="/java/Package_Modifiers"/>">패키지와 접근자</a></li>
	    <li><a href="<c:url value="/java/Inheritance"/>">상속</a></li>
	    <li><a href="<c:url value="/java/Static"/>">static 키워드</a></li>
	    <li><a href="<c:url value="/java/Collection"/>">컬렉션</a></li>
	    <li><a href="<c:url value="/java/Exception"/>">예외</a></li>
	
	    <li class="sub-heading">예제: 자바은행</li>
	    <li><a href="<c:url value="/java/Javabank-Requirements-analysis"/>">요구사항 분석</a></li>
	    <li><a href="<c:url value="/java/Javabank-Design"/>">구현</a></li>
	    <li><a href="<c:url value="/java/Javabank-Inheritance"/>">상속 적용</a></li>
	    <li><a href="<c:url value="/java/Javabank-Abstract-class"/>">추상 클래스 적용</a></li>
	    <li><a href="<c:url value="/java/Javabank-Interface"/>">인터페이스 적용</a></li>
	
	    <li class="sub-heading">스레드 I/O 네트워크</li>
	    <li><a href="<c:url value="/java/Thread"/>">스레드</a></li>
	    <li><a href="<c:url value="/java/Stream"/>">자바 I/O</a></li>
	    <li><a href="<c:url value="/java/Logging"/>">로깅</a></li>
	    <li><a href="<c:url value="/java/Socket"/>">소켓</a></li>
	    <li><a href="<c:url value="/java/RMI"/>">RMI</a></li>
	</ul>	    	
	</c:when>
	<c:otherwise>
	<ul>
		<li class="sub-heading">Java Introduction</li>
		<li><a href="<c:url value="/java/Features"/>">Java Features</a></li>
		<li><a href="<c:url value="/java/Class-Object"/>">Object and Class</a></li>
		
		<li class="sub-heading">Java Basic</li>
		<li><a href="<c:url value="/java/Keyword_Identifiers_Comment"/>">Identifiers</a></li>
		<li><a href="<c:url value="/java/DataType_Casting"/>">Data Type</a></li>
		<li><a href="<c:url value="/java/Arrays"/>">Arrays</a></li>
		<li><a href="<c:url value="/java/Operators_if_loops"/>">Operators if switch loops</a></li>
		<li><a href="<c:url value="/java/Package_Modifiers"/>">Package and Modifiers</a></li>
		<li><a href="<c:url value="/java/Inheritance"/>">Inheritance</a></li>
		<li><a href="<c:url value="/java/Static"/>">static keyword</a></li>
		<li><a href="<c:url value="/java/Collection"/>">Collection</a></li>
		<li><a href="<c:url value="/java/Exception"/>">Exception</a></li>
		
		<li class="sub-heading">Example: Java Bank</li>
		<li><a href="<c:url value="/java/Javabank-Requirements-analysis"/>">Requirements Analysis</a></li>
		<li><a href="<c:url value="/java/Javabank-Design"/>">Application Design</a></li>
		<li><a href="<c:url value="/java/Javabank-Inheritance"/>">Inheritance</a></li>
		<li><a href="<c:url value="/java/Javabank-Abstract-class"/>">Abstract Class</a></li>
		<li><a href="<c:url value="/java/Javabank-Interface"/>">Interface</a></li>
		
		<li class="sub-heading">Thread I/O Network</li>
		<li><a href="<c:url value="/java/Thread"/>">Thread</a></li>
		<li><a href="<c:url value="/java/Stream"/>">Java I/O</a></li>
		<li><a href="<c:url value="/java/Logging"/>">Logging</a></li>
		<li><a href="<c:url value="/java/Socket"/>">Socket</a></li>
		<li><a href="<c:url value="/java/RMI"/>">RMI</a></li>
	</ul>		
	</c:otherwise>
</c:choose>