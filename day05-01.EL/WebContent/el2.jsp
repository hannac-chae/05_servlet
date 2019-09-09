<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(2) EL 에서 파라미터 다루기</title>
</head>
<body>
<!-- 
	파라미터 vs 어트리뷰트 : 공부해 둘 것
	=========================================
	EL 은 기존 JSP 에서 
	scriptlet, expression 이 했던 일을 단순화하여 제공
	
	scriptlet 에서 했던 파라미터 추출을 단순하게 바꾸어 줌
	=========================================
 -->
<%
	// 이 페이지가 요청될 때, 주소 표시줄에 QUERY_STRING 으로 
	// 전달되는 파라미터를 scriptlet 에서 추출하는 방식
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String id = request.getParameter("id");
%>

이 페이지를 요청할 때 다음의 주소를 복사해서 요청합니다. <br />
http://localhost:8080/el/el2.jsp
       ?name=홍길동 <br />
http://localhost:8080/el/el2.jsp
       ?name=홍길동&address=율도국 <br />
http://localhost:8080/el/el2.jsp
       ?name=홍길동&address=율도국&id=gildong2 <br />
http://localhost:8080/el/el2.jsp
       ?name=&address=&id=<br />
       
<h3>EL의 파라미터 추출</h3>
<!-- ol>li*3        -->
<ol>
	<li>\${param.name} = ${param.name}</li>
	<li>\${param.address} = ${param.address}</li>
	<li>\${param.id} = ${param.id}</li>
</ol>

<hr />
<h3>expression Tag 의 파라미터 추출</h3>
<ol>
	<li>name=<%=name %></li>
	<li>address=<%=address %></li>
	<li>id=<%=id %></li>
</ol>
</body>
</html>