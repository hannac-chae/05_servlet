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
	서블릿 라이프 사이클 무엇인지
	JSP 태그 4가지가 무엇인지
	GET, POST 방식의 차이가 무엇인지, 각각의 메소드는 무엇인지
	
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
http://localhost:8080/el/el2.jsp<br />
http://localhost:8080/el/el2.jsp?name=홍길동 <br />
http://localhost:8080/el/el2.jsp?name=홍길동&address=율도국 <br />
http://localhost:8080/el/el2.jsp?name=홍길동&address=율도국&id=gildong2 <br />
http://localhost:8080/el/el2.jsp?name=&address=&id=<br />
       
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

<!-- 
	empty 연산자의 작동 방식
	===========================================
	param.xxx 과 같이 파라미터의 존재여부를 검사할 때
	1. 파라미터의 키가 존재하지 않는 경우 empty 로 판단함
	2. 파라미터의 키가 존재하지만 값이 없는 경우도 empty 로 판단함.
 -->
<h3>EL 의 파라미터 존재 여부 검사</h3>
<!-- ol>li*6 -->
empty : EL의 연산자 <br />
&nbsp;&nbsp;&nbsp;&nbsp; 
=&gt;값의 존재 여부를 검사하는 연산자, 없을 때 true 

<ol>
	<li>parameter중 name 이라는 것이 존재하는가? <br/> 
	    \${not empty param.name} 
	    = ${not empty param.name}
	</li>
	<li>parameter중 address 라는 것이 존재하는가? <br/> 
		\${not empty param.address}
		= ${not empty param.address}
	</li>
	<li>parameter중 id 라는 것이 존재하는가? <br />
		\${not empty param.id}
		= ${not empty param.id}
	</li>
	<li>parameter중 name 이라는 것이 없는가? <br/> 
	    \${empty param.name} 
	    = ${empty param.name}
	</li>
	<li>parameter중 address 라는 것이 없는가? <br/> 
		\${empty param.address}
		= ${empty param.address}
	</li>
	<li>parameter중 id 라는 것이 없는가? <br />
		\${empty param.id}
		= ${empty param.id}
	</li>
</ol>



</body>
</html>