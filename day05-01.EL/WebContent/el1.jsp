<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(1) EL 의 산술연산자</title>
</head>
<body>
<h3>EL의 산술 연산자</h3>
<hr />
<!-- 
	EL (Expression Language)
	=========================================
	1. 웹 컨테이너(서블릿 컨테이너:tomcat)이 있으면 해석가능
	   (브라우저:클라이언트 는 해석하지 못함)
	2. ${ } 구문 안에 표현식을 기술하는 방법으로 사용
	3. 산술, 관계, 논리 연산 수행 가능
	4. 빈즈객체, 맵, 리스트, 배열 등의 객체를 
	   .(도트) 연산자로 편리하게 접근 가능
    5. null 처리가 0, false, ""(빈 문자열)등의 값으로 자동 처리됨
    ==========================================


 -->
<!-- ol>li*5 -->
<ol>
	<li>EL의 덧셈 : 10 + 55 = ${10 + 55}</li>
	<li>EL의 뺄셈 : 10 - 55 = ${10 - 55}</li>
	<li>EL의 곱셈 : 10 * 55 = ${10 * 55}</li>
	<li>EL의 나눗셈 : 10 / 55 = ${10 / 55}</li>
	<li>EL의 나머지 : 10 % 55 = ${10 % 55}</li>
</ol>

<hr />

<h3>EL의 관계 연산자</h3>
<hr />
<!-- ol>li*6 -->
<ol>
	<li>~보다 크다(&gt;) : 10 &gt; 55 = ${10 > 55}, ${10 gt 55}</li>
	<li>~보다 작다(&lt;) : 10 &lt; 55 = ${10 < 55}, ${10 lt 55}</li>
	<li>~보다 크거나 같다(&ge;) : 10 &ge; 55 = ${10 >= 55}, ${10 ge 55}</li>
	<li>~보다 작거나 같다(&le;) : 10 &le; 55 = ${10 <= 55}, ${10 le 55}</li>
	<li>~와 같다 (==) : 10 == 55 = ${10 == 55}, ${10 eq 55}</li>
	<li>~과 같지 않다(!=) : 10 &ne; 55 = ${10 != 55}, ${10 ne 55}</li>
</ol>

<h3>EL 의 논리 연산자</h3>
<hr />
<!-- ol>li*3 -->
<ol>
	<li>논리 AND :  true && false 
	         = ${true && false}, ${true and false}</li>
	<li>논리 OR : true || false
	         = ${true || false}, ${true or false}</li>
	<li>논리 NOT : !true = ${! true}, ${not true}</li>
	<li>논리 NOT : !false = ${! false}, ${not false}</li>
</ol>





</body>
</html>