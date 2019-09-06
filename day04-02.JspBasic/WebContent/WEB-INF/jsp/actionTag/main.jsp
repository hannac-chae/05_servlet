<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	
	<h2>요청주소</h2>
	<hr />
	<h3>http://localhost:8080/jsp/main</h3>
	<hr />
	
	<h3>마이 코퍼레이션</h3>
	<h3>방문을 환영합니다</h3>
	<hr size="4" noshade="noshade" />
	
	<!-- copy.jsp 에 넘기는 color 요청 파라미터 설정 액션태그 사용 -->
	<!-- /copy 는 web.xml 에 등장하는 copy.jsp 를 요청하는 주소 -->
	<jsp:include page="/copy">
		<jsp:param value="hotpink" name="color"/>
	</jsp:include>
	<%--
		<jsp:include> 액션태그 :
			==> 이 태그의 위치에 다른 페이지를 삽입해 화면을 조립해 달라는 요청으로 해석
			         이렇게 끼워넣는 페이지를 요청하며 전달할 요청 파라미터가 있다면
			    <jsp:param> 을 같이 사용하여 요청 파라미터를 전달할 수 있다.
			    
		<jsp:param> 액션태그 :
			==> 요청 파라미터를 전송하는 액션태그
			         이 액션태그로 요청 파라미터를 전달받은 쪽에서는
			    jsp 내장객체인 request 에 getParameter(String)을 호출하여
			         전달된 요청 파라미터를 추출하여 사용 가능하다.  
	 --%>

</body>
</html>







