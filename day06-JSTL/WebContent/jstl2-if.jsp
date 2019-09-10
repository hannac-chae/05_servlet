<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(2) JSTL Core Tag : if</title>
</head>
<body>
<%--
	<c:if>
	========================================	
	if 구문과 같이 논리 결과에 따라 선택을 분기하는 기능 
	test 속성 값이 true/false 에 따라 분기 
	test 속성 값에 EL 을 사용할 수 있다. 
	else 구문은 없다.  
--%>
	

<h3>&lt;c:if&gt; 태그</h3>
<br />
<%-- 1. request 에 name 속성을 <c:set> 으로 추가 --%>
<c:set var="name" value="길동" scope="request" />

<%-- 2. <c:if> 로 name 
               속성 값이 존재하는지 여부를 기준으로 분기 --%>
<h4>EL 과 c:if 의 test 속성을 조합</h4>
<c:if test="${not empty requestScope.name}">
	${name}
</c:if>
<c:if test="${empty requestScope.name}">
	request 에 name attribute 가 없습니다.
</c:if>

<%-- 3. <c:if test="not emtpy ..."> <c:if test="empty .."
                 와 동일한 스크립트릿 코드 작성
 --%>
<%
	// 2번과 동일한 작업을 하는 스크립트 릿 코드
	if(request.getAttribute("name") != null) {
%>
		${name}
<%
	} else {
%>
		request 에 name attriubte 가 존재하지 않습니다.
<%	
}
%>

<hr />

</body>
</html>