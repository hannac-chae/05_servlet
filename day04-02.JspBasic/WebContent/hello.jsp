<%-- 
	1. JSP 주석 : 
	   ==> JSP 가 Servlet 으로 변환될 때 이 주석 사이의 내용은 무시됨	
 --%>
<%--
	2. <%@ %> : 
	   Directive Tag : 현재 이 페이지의 설정을 지정할 때 사용.
	                                      이 페이지에서 import 구문이 필요한 경우 사용.
	                                      이 페이지에서 태그 라이브러리가 필요한 경우 사용.      
 --%> 
<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP</title>
</head>
<body>
<%--
	3. <%! %> : Declaration Tag  
	   ==> 멤버 변수 선언, 멤버 메소드 선언
	   
 --%>
<%!
	// 멤버 변수 선언
	private int result;

	// 멤버 메소드 선언
	public int add(int x, int y) {
		return x + y;
	}
%> 

<%--
	4. <% %> : Scriptlet Tag
		==> JSP 안에서 순수 자바 코드(로직, 문장)를 쓸 수 있는 태그
		이 태그 안에는 완전한 자바 [문장]이 들어가야 한다.

		문장 (statement): 
		  (1) ;으로 끝나는 할당문
		  (2) ;으로 끝나는 메소드 호출문
		  (3) if, if ~ else, while, do ~ while, for, switch 등
		             제어구조
		  (4) 지역변수 선언 및 초기화, 지역변수 할당문
		  
		문장이 아닌 구문은 불가능:
		  (1) 멤버변수 선언문
		  (2) 메소드 선언문
		  (3) 클래스 선언문
		   
 --%>
<% 	// 스크립트릿 태그 안쪽에 주석을 줄 때는
   	// 완전한 자바 주석을 사용한다.
   
   	// 스크립트릿에 사용하는 지역변수 선언
	int age = 55; 

	// 리스트 객체 사용
	// 스크립트릿에 사용하는 지역변수 선언 및 초기화 
	List<Integer> ages = new ArrayList<>();
	// 스크립트릿에 사용하는 메소드 호출 구문
	ages.add(12);
	ages.add(20);
	ages.add(52);
	ages.add(age);
	ages.add(72);
	
	// 스크립트릿에 사용하는 제어구조 : for
	for (int age2: ages) {
		// for 반복문 시작 후 스크립트릿을 닫는다.
%>		
	<!--  스크립트릿 바깥쪽에 반복할 내용의 HTML 을 구성 -->
	<%--
		5. <%= %> : expression Tag
			==> 값을 출력하는 용도의 태그
			(1) 변수 출력
			(2) 리턴이 있는 메소드 호출 결과 출력
			(3) ; 을 쓰지 않음
	 --%>
		가족 구성원의 나이 : <%=age2 %> <br/>
		
<%		// 스크립트릿을 다시 열고 for 반복문을 닫는다.
	}
%> 
	<hr />
<%
	// 멤버 메소드로 선언된 add()를 호출
	// 가족 구성원의 나이를 합산
	for (int age2: ages) {
		result = add(result, age2);
	}
%>
	<h3>가족 구성원 나이 합</h3>
	<hr />
	<%=result %>
<%--

  1. JSP 주석
  2. <%@ : Directive Tag
  3. <%! : Declaration Tag
  4. <%  : Scriptlet Tag
  5. <%= : Expression Tag

 --%>	
</body>
</html>



