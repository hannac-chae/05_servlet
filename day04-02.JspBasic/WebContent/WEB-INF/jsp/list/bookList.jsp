<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.vo.*" 
         import="book.factory.*"
         import="java.util.*"
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 목록(WEB-INF 하위에서 응답)</title>
<link rel="stylesheet" 
      href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<%
	// 책 객체 5개 생성
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

	// 목록에 추가
	List<Book> books = new ArrayList<>();
	books.add(vegetarian);
	books.add(littlePrince);
	books.add(noDaap);
	books.add(dduk);
	books.add(ax);
	
	// JSP 내장객체인 request 에 books 라는 이름으로 
	// attribute 추가
	request.setAttribute("books", books);
	
	// List<Book> 타입의 bookList 변수에
	// 추가되었던 attribute 추출하여 담기
	List<Book> bookList =
	    (List<Book>) request.getAttribute("books");
	
	// 브라우저 출력
%>
	<!-- 브라우저에 HTML 테이블로 출력 -->
<h3>(WEB-INF 하위에서 응답)</h3>	
<table class="w3-table w3-striped w3-border w3-hoverable">
	<tr class="w3-green">
		<th>책 번호</th>
		<th>ISBN</th>
		<th>도서 명</th>
		<th>저자</th>
		<th>출판사</th>
		<th>페이지 수</th>
		<th>가격</th>
		<th>재고</th>
	</tr>
<%  for (Book book: bookList) { %>	
	<tr>
		<td><%=book.getSequence() %></td>
		<td><%=book.getIsbn() %></td>
		<td><%=book.getTitle() %></td>
		<td><%=book.getAuthor() %></td>
		<td><%=book.getCompany() %></td>
		<td><%=book.getTotalPage() %></td>
		<td><%=book.getPrice() %></td>
		<td><%=book.getQuantity() %></td>
	</tr>
<%  } %>	
</table>

</body>
</html>