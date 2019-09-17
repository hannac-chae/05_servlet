<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie 로그인 성공</title>
</head>
<body>
<%
	// 서버에서 전달되는 쿠키는 여러개가 있을 수 있으므로
	// 쿠키는 항상 배열로 전달된다.
	Cookie[] cookies = request.getCookies();

	// 쿠키에 담겨져 전달된 아이디, 비밀번호를 저장할 변수 선언
	String userId = null;
	String password = null;
	
	// 쿠키는 값이 key=value 가 쌍으로 저장됨
	// 따라서 Map 으로 변환하여 관리하기 편리함
	Map<String, String> cookieMap = new HashMap<>();
	
	// 쿠키가 존재하면
	if (cookies != null) {
		
		// 쿠키 하나 하나의 값을 추출
		for (Cookie cookie: cookies) {
			// 쿠키 1개씩 추출하여 쿠키맵에 저장
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			
			cookieMap.put(cookieName, cookieValue);			
		}
		
		// 맵으로 변환된 쿠키 내용을 확인하기 위해서
		// 이 요청객체에 속성으로 추가해 본다.
		request.setAttribute("cookieMap", cookieMap);
		
		// for 가 끝나면 서버에서 추가해서 전달한 
		// userId, password 가 맵에 추가되어 있으므로
		userId = cookieMap.get("userId");
		password = cookieMap.get("password");

		// userId, password 변수가 둘 다 null 이 아니면
		// 로그인이 되었다는 의미로 해석 가능
		// 추출된 userId, password 값을 요청객체에 속성으로 추가
		request.setAttribute("userId", userId);
		request.setAttribute("password", password);
		
		// 쿠키가 존재할 때 if 로직 끝
	} else {
		// 쿠키가 존재하지 않을 때(혹은 쿠키가 만료되었을 때) 속성 제거 
		request.removeAttribute("userId");
		request.removeAttribute("password");
	}
%>
<h3>cookieMap 내용 출력</h3>
${requestScope.cookieMap}

<hr />
<h3>로그인 성공 여부</h3>
<c:choose>
	<c:when test="${not empty userId and not empty password}">
		안녕하세요, ${userId}님, 로그인 되었습니다. <br />
		로그인 10초 후 쿠키가 자동으로 만료됩니다. <br />
		쿠키가 만료되면 자동 로그아웃 됩니다.
	</c:when>
	<c:otherwise>
		로그인 해야 합니다. <br />
		<a href="<%=application.getContextPath() 
		            + "/cookie/login"%>">로그인 하러 가기...</a>
	</c:otherwise>
</c:choose>

<hr />



</body>
</html>