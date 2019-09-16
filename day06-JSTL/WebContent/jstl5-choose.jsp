<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  
    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(5) JSTL Core Tag : choose</title>
</head>
<body>

<%--
	<c:choose>
		<c:when>
		</c:when>
		<c:when>
		</c:when>
		...
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	======================================
	<c:if> 와 유사한 조건 분기 기능을 가진 코어 태그
	if ~ else if ~ else 구문과 비슷하게 사용 가능
	
	<c:choose> 내부에 
	<c:when>, <c:otherwise> 배치해서 분기
	
	<c:when> 은 여러번 등장 가능
	if ~ else if 처럼 동작하게 하려면 test 속성안에 EL 조건식을
	잘 사용해야 올바른 분기처리가 가능하다.
	
	<c:otherwise> 는 마지막에 한번만 등장 가능
	else 구문과 비슷하게 동작 <c:when> 에 분기되지 못한 모든 경우는
	여기서 실행
	======================================
 --%>
<%
	// 1 ~ 10 까지의 숫자를 리스트에 저장
	List<Integer> numbers = new ArrayList<>();

	for (int idx = 1; idx <= 10; idx++) {
		numbers.add(idx);
	}
	
	// 리스트를 요청 객체에 속성으로 추가
	request.setAttribute("numbers", numbers);
%>

<%-- 
	1. 요청 객체에 추가된 리스트 객체를 EL로 추출 가능
	2. 리스트의 각 원소는 c:forEach 로 추출 가능 
	3. c:forEach 안에서 추출된 각 원소의 값에 대해
	      홀/짝 판별을 c:choose, c:when, c:otherwise 로 진행
 --%>

<%-- ${requestScope.numbers} --%>
<%-- ${numbers} --%>
<c:forEach var="number" items="${numbers}">
	<c:choose>
		<c:when test="${number % 2 eq 0}">
			${number} 은(는) 짝수입니다. <br />
		</c:when>
		<c:when test="${number % 2 eq 1}">
			${number} 은(는) 홀수입니다. <br />
		</c:when>
		<c:otherwise>
			${number} 은(는) 정수가 아닙니다. <br />
		</c:otherwise>
	</c:choose>
</c:forEach>

<hr />
<%-- 위의 <c:choose> 구문을 <c:if>조합으로 변경 --%>
<c:forEach var="number" items="${numbers}">
	<c:if test="${number % 2 eq 0}">
		${number} 은(는) 짝수입니다. <br />
	</c:if>
	<c:if test="${number % 2 eq 1}">
		${number} 은(는) 홀수입니다. <br />
	</c:if>
	<c:if test="${number % 2 ne 1 and 
	              number % 2 ne 0}">
		${number} 은(는) 정수가 아닙니다. <br />
	</c:if>
</c:forEach>




</body>
</html>