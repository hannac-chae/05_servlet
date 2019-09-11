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
<hr />

<h4>request 객체에 name 이라는 이름의 속성이 존재하는지 여부 검사</h4>
<c:if test="${not empty requestScope.name}">
	${name}
</c:if>
<c:if test="${empty requestScope.name}">
	request 에 name attribute 가 없습니다.
</c:if>
<br />
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
<%-- 4. name 이라는 이름의 값이 '길동'과 같은지 여부 기준으로 분기 --%>
<h4>name 이라는 속성의 값이 '길동'과 같은지 검사</h4>
<c:if test="${requestScope.name eq '길동'}">
	이름이 ${name} 입니다.
</c:if>
<c:if test="${requestScope.name ne '길동'}">
	이름이 '길동'이	아닙니다.
</c:if>

<%-- 5. parameter로 id라는 값을 붙여서 요청 --%>
<h4>다음 주소로 한번씩 요청해봅니다</h4>
<ul>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?id=gildong</li>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?id=gildong2</li>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?id=</li>
	<li>http://localhost:8080/jstl/jstl2-if.jsp?</li>
</ul>

<%-- 6. id 라는 값이 파라미터에 존재하는가? --%>
<h4>id 라는 값이 파라미터에 존재하는가?</h4>
EL : \${not empty param.id} <br />

<c:if test="${not empty param.id}">
	파라미터에 id 라는 값이 존재합니다.
</c:if>
<c:if test="${empty param.id}">
	파라미터에 id 라는 값이 존재하지 않습니다.
</c:if>
<br />

<%-- 7. 파라미터 id의 값이 gildong 인가? --%>
<h4>파라미터 id의 값이 gildong 인가?</h4>
EL : \${param.id eq 'gildong'} <br />

<c:if test="${param.id eq 'gildong'}">
	파라미터 id 의 값은  ${param.id} 입니다.
</c:if>
<c:if test="${param.id ne 'gildong'}">
	파라미터 id 의 값은 gildong 이 아닙니다.
</c:if>
<br />


<%-- 8. 여러 파라미터 전송 : id, size, hobby --%>
<h4>다음의 파라미터를 주소 뒤에 붙여 요청합니다.</h4>
<ul>
	<li>?id=gildong&size=L&hobby=magic</li>
	<li>?id=&size=&hobby=</li>
	<li>?size=M</li>
	<li>?size=M&hobby=soccer</li>
</ul>

<h4>주문받기</h4>
안녕하세요, 

<c:if test="${not empty param.id}">
	${param.id} 님.
</c:if>
<c:if test="${empty param.id}">
	무명님.
</c:if>
<br />

	선택한 옷의 사이즈는 :
<c:if test="${not empty param.size}">	
	<c:if test="${param.size eq 'L'}">
		라지 입니다.
	</c:if>	
	<c:if test="${param.size eq 'M'}">
		미디움 입니다.
	</c:if>
	<c:if test="${param.size eq 'S'}">
		스몰 입니다.
	</c:if>
</c:if>
<c:if test="${empty param.size}">
	사이즈가 입력되지 않았습니다.
</c:if>
<br />

	당신의 취미는 : 
<c:if test="${not empty param.hobby}">
	${param.hobby} 입니다.
</c:if>	
<c:if test="${empty param.hobby}">
	없네요~
</c:if>	
<br />


<%-- 9. 4, 6, 7, 8 번 동일 작업 스크립트릿으로 변경 --%>
<hr />
<%
	String size = request.getParameter("size");

	out.print("선택한 옷의 사이즈는 : ");
	// null 포인터 방지를 위해 필수로 요다 표기법 적용할 것
	if ("L".equals(size)) {
		out.print("라지 입니다.");
		
	} else if ("M".equals(size)) {
		out.print("미디움 입니다.");
		
	} else if ("S".equals(size)) {
		out.print("스몰 입니다.");
		
	} else {
		out.print("선택된 사이즈가 없습니다.");
	}
	
	out.print("<br >");
	
	if (size != null) {
		if (size.equals("L")) {
			out.print("라지 입니다.");
			
		} else if (size.equals("M")) {
			out.print("미디움 입니다.");
			
		} else if (size.equals("S")) {
			out.print("스몰 입니다.");
			
		} else {
			out.print("사이즈가 부정확합니다. L/M/S 중 하나를 입력하세요.");
		}
	} else {
		out.print("선택된 사이즈가 없습니다.");
	}
%>


<br />	
</body>
</html>








