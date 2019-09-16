<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 페이지</title>
</head>
<body>

next.jsp 가 응답 <br />
<h3>이전 페이지에서 등록한 name 값</h3>
${requestScope.name}, ${name} 

</body>
</html>