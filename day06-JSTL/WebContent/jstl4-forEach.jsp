<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="book.vo.Book"
		 import="book.factory.BookFactory" 
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(4) JSTL Core Tag : forEach</title>
</head>
<body>
<%--
	<c:forEach> 중 자료구조를 사용하는 구문
 --%>
<%
	// 과일 이름을 String으로 저장하는 목록객체 생성
	java.util.List<String> fruits = 
		new java.util.ArrayList<>();

	// 과일 추가
	fruits.add("복숭아");
	fruits.add("사과");
	fruits.add("수박");
	fruits.add("키위");
	fruits.add("깔라만시");
	fruits.add("망고");
	fruits.add("체리");
	fruits.add("두리안");
	
	// request 에 fruits 라는 이름으로 속성 추가
	request.setAttribute("fruits", fruits);
%> 
<h4>forEach 를 자료구조와 함께 사용</h4>
<%--
	// request 에서 fruits 를 추출하여
	// foreach 구문으로 각 과일 이름 출력하는 구문
	// html 에 출력 구문은 out.print(fruit + "<br />");
	java.util.List<String> fruitList = 
			(java.util.List<String>) request.getAttribute("fruits");
			
	for (String fruit: fruitList)  {
		out.print(fruit + "<br />");
	}
--%>

<c:forEach var="fruit" items="${requestScope.fruits}">
	${fruit} <br />
</c:forEach>

<hr />
<h4>forEach , items, var, varStatus 를 같이 사용</h4>
<c:forEach var="fruit" items="${requestScope.fruits}"
           varStatus="status">           
	반복횟수 : ${status.count} / 
	반복인덱스 : ${status.index} / 
	현재아이템 : ${status.current} / 
	
	과일이름 : ${fruit} <br />
</c:forEach>
<hr />

<%
	//사용자 정의 타입 Book 객체 생성
	Book vegetarian = 
		BookFactory.buildBook(1, "9788936433598", "채식주의자"
				  , "한강", "창비", 247, 10800, 10);
	
	Book littlePrince = 
		BookFactory.buildBook(2, "9791159039690", "어린왕자(초판본)"
				  , "생텍쥐페리", "더스토리", 150, 8820, 5);
	
	Book noDaap = 
		BookFactory.buildBook(3, "9791190182645", "제 인생에 답이 없어요"
				  , "선바", "위즈덤하우스", 192, 10800, 3);
	
	Book dduk = 
		BookFactory.buildBook(4, "9791196394509", "죽고 싶지만 떡볶이는 먹고 싶어"
				  , "백세희", "흔", 208, 12420, 2); 
	
	Book ax = 
		BookFactory.buildBook(5, "9788956055466", "책은 도끼다"
				  , "박웅현", "북하우스", 348, 14400, 2);

	// books 목록에 저장
	java.util.List<Book> books = 
	    new java.util.ArrayList<>();
	
	books.add(vegetarian);
	books.add(littlePrince);
	books.add(noDaap);
	books.add(dduk);
	books.add(ax);
	
	request.setAttribute("books", books);
%>
<%
	// books 목록을 자바의 foreach 로 화면 출력
	// 출력구문 out.print(book + "<br />");
	for (Book book: books) {
		out.print(book + "<br />");
	}
%>
<hr />
<c:forEach var="book" items="${requestScope.books}">
	<%-- TODO --%>
	${book} <br />
</c:forEach> 


<h4>책 목록을 테이블로 출력</h4>
<hr />
<table>
	<tr>
		<th>책 번호</th>
		<th>ISBN</th>
		<th>도서 명</th>
		<th>저자</th>
		<th>출판사</th>
		<th>페이지 수</th>
		<th>가격</th>
		<th>재고</th>
	</tr>
  <c:forEach var="book" items="${requestScope.books}">
	<%-- TODO 표에 맞춰서 출력되도록 여기 완성 --%>
	<tr>
		<td>${book.sequence}</td>
		<td>${book.isbn}</td>
		<td>${book.title}</td>
		<td>${book.author}</td>
		<td>${book.company}</td>
		<td>${book.totalPage}</td>
		<td>${book.price}</td>
		<td>${book.quantity}</td>
	</tr>
  </c:forEach> 
</table>



</body>
</html>


