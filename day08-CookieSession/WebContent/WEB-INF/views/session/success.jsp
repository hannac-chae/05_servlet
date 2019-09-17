<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 로그인 성공</title>
</head>
<body>
<h3>Session 로그인 성공</h3>
<hr />

안녕하세요, ${sessionScope.userId}, ${userId} 님.
로그인 되었습니다. <br />

<hr />
<a href="${pageContext.request.contextPath}/session/logout">로그 아웃</a>
<a href="<%=application.getContextPath() + "/session/logout"%>">로그 아웃</a>

</body>
</html>