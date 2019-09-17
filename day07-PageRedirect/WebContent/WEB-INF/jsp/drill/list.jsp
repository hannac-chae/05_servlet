<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일 목록</title>
</head>
<body>

<!-- 서버에서 전달된 과일 목록을 출력  
	0. 이 list.jsp 는 WEB-INF 아래에 존재하므로
	   web.xml 에 등록되어야 한다.
	1. EL 로 요청에 설정된 목록 객체를 추출할 수 있어야 함
	2. c:forEach 로 목록의 각 원소를 출력할 수 있어야 함
	3. 출력을 할 때, 표(table 태그)를 갖추어서 출력할 것
	4. redirect 로 이 페이지 진입시 전달되는 과일목록이 없으므로
	      그런 경우에는 "과일 목록이 없습니다." 라고 출력되도록
	   c:if 를 잘 쓸 것 
-->

<table>
	<tr>
		<th>과일 명</th>
	</tr>

 <c:if test="${not empty fruits}">
  <c:forEach var="fruit" items="${fruits}">
	<tr>
		<td>${fruit}</td>
	</tr>
   </c:forEach>
 </c:if>
 <c:if test="${empty fruits}">
	<tr>
		<td>과일이 없습니다</td>
	</tr>
 </c:if>
    
</table>

</body>
</html>