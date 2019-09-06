<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>copy</title>
</head>
<body>
<%--
	메인화면 하단에 삽입되어 저작권 표기(copyright)를
	나타내는 푸터(footer)로 사용되는 페이지
	
	main.jsp 에 포함(<jsp:include> 액션태그 사용)되어 화면에 조립되어 나타남
	
	main.jsp 에서 이 페이지를 끼워넣기 요청(<jsp:include>)할 때
	<jsp:param> 액션태그로 전달한 요청 파라미터가 전달된다
	이 액션태그로 전달된 요청 파라미터는 이 화면에서 추출되어 사용된다.
 
 --%>
<!-- 
	main.jsp 페이지에서 이 화면으로 파라미터를 넘기면
	JSP 내장객체인 request 에 대하여 getParameter(String) 메소드를 호출하여
	추출하여 사용할 수 있다.
 --> 
<%	
	String color = request.getParameter("color");
%> 
	<div style="color:<%=color %>;">
		copyright &copy; my.co.kr
	</div>
</body>
</html>




