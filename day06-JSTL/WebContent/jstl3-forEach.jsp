<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(3) JSTL Core Tag : forEach</title>
</head>
<body>
<%--
	<c:forEach>
	==========================================
	for 구문처럼 정해진 횟수 반복 / 자료구조를 순회 반복
	두 가지 반복 모두 처리 가능한 JSTL 태그
	
 --%>
<h4>1. 정해진 횟수 반복</h4>
<c:forEach begin="1" end="10" step="3">
	안녕하세요, JSTL forEach <br />
</c:forEach>

<hr noshade="noshade"/>
<h4>2. index, status 변수 사용</h4>
<c:forEach begin="1" end="10" step="2" varStatus="status">
	안녕하세요, JSTL forEach <br />
	반복횟수 : ${status.count} <br />
	반복인덱스 : ${status.index} <hr/>
</c:forEach>

<hr noshade="noshade"/>
<h4>3. 값 누적 계산</h4>
<%-- <c:set> 으로 이 페이지에서 사용할 변수를 하나 선언 --%>
<c:set var="summ" value="0" scope="page" />
<c:forEach begin="1" end="10" step="1" varStatus="status">
	<%-- 아래 구문은 화면에 출력만 --%>
	${summ} + ${status.index} = ${summ + status.index} <br />
	
	<%-- 실제 합산 적용 : 
	     ${summ = summ + status.index} 이러한 EL 식은 불가능
	     EL 은 추출전문 저장(할당)식은 불가능 따라서 <c:set> 사용 
	--%>
	<c:set var="summ" 
	       value="${summ + status.index}" scope="page" />
</c:forEach>
summ 변수의 최종 값 : ${summ}
<br />


<hr noshade="noshade"/>
<h4>4. varStatus 속성들</h4>
<c:forEach begin="1" end="10" step="2" 
           varStatus="status" var="result">
    result 변수 값 : ${result}
    <br />
        현재 반복 아이템 : ${status.current}
    <br />
    
    <c:if test="${status.first}">
    	첫번째 반복입니다. <br />
    </c:if>
    <c:if test="${status.last}">
    	마지막 반복입니다. <br />
    </c:if> 
    
        반복의 시작 값: ${status.begin} <br />
        반복의 종료 값: ${status.end} <br />
        반복의 증가 값: ${status.step} <br />
    <hr /> 
</c:forEach>

</body>
</html>


