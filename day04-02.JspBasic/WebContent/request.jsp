<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장객체  request</title>
</head>
<body>
<%
	// 과일 목록을 생성
	List<String> fruits = new ArrayList<>();
	// 과일 추가
	fruits.add("복숭아");
	fruits.add("사과");
	fruits.add("수박");
	fruits.add("키위");
	fruits.add("깔라만시");
	fruits.add("망고");
	fruits.add("체리");
	fruits.add("두리안");
	
	// 생성한 자바의 리스트를 
	// 내장객체인 request에 attribute 를 추가
	// request 는 JSP의 _service()메소드의 매개변수로 지정되어 있는 객체이다.
	request.setAttribute("fruits", fruits);
	
	// 추가된 attribute 를 추출
	// attribute 는 Object 타입으로만 추출되므로
	// 실제 자료형으로 강제 타입 캐스팅이 필요
	List<String> fruitList = 
	   (List<String>)request.getAttribute("fruits");
	
	// 브라우저 출력
	for (String fruit: fruitList) {
%>
		<h3><%=fruit %></h3>
<%  } // end for %>
<%--
	
	parameter : 
		(1) 클라이언트 ==> 서버로 전송되는 값
		(2) request 객체에만 추가되어 서버로 전송
		(3) String 타입의 데이터로 발생
		(4) <form> 에 전송될 때 자동으로 추가되므로
		        서버에서는 getParameter(String) 로 추출만 가능
	
	attribute :
	    (1) 서버에서 발생하여 공유객체에 추가되는 값
	    (2) request, session, context(application) 
	                  중 어느 공유 객체에도 추가될 수 있다.
	    (3) Object 타입의 모든 데이터 형을 사용가능
	    (4) 서버에서 발생하므로
	        setAttribute(String, Object) 메소드로 추가
	        getAttribute(String) 메소드로 추출 

 --%>


</body>
</html>

