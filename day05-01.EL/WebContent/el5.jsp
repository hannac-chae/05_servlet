<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(5) EL 내장객체 레벨</title>
</head>
<body>
<h3>내장 객체의 레벨</h3>
<hr />
<ol>
	<li>
		<p>page : 현재 페이지에서만 사용 가능한 범위</p>
	</li>
	<li>
		<p>request : 응답(response)이 일어나기 전까지 유지되는 객체. <br />
		             응답이 일어나기 전까지는 처음 생성된 요청(request)이 계속 유지됨 <br />
		             이렇게 유지되는 요청 객체는 여러 페이지에 걸쳐 전달될 수 있다. <br />
		             응답(response)이 일어나기 전까지는 해당 요청(request)에 설정(추가)된 <br />
		             모든  attribute 와 파라미터가 유지된다. <br /><br />
		             모든 요청(request)는 응답(response)가 발생하면 소멸한다.
		             
		</p>
	</li>
	<li>
		<p>session : 명시적으로 생성하는 객체. 
		명시적으로 제거할 때까지 유지되는 객체 <br />
		
		세션은 요청(request)에 연결되어 있어서 
		요청객체로부터 세션을 추출하여 생성 <br />
		
		세션은 자신을 추출하는데 사용된 요청이 응답되어 
		소멸해도 세션 자체는 소멸되지 않는다 <br />
		
		명시적으로 invalidate() 를 시켜야 소멸. <br />
		보통은 로그인 정보 등을 유지하기 위해 사용함 <br /> 
		
		</p>
	</li>
	<li>
		<p>application : 하나의 웹 어플리케이션당 1개씩만 생성되는 객체. <br />
		웹 컨테이너에 의해 하나의 애플리케이션이 배포되어 유지되는 동안 <br />
		계속하여 유지되는 객체이다. <br />
		서버가 종료될 때까지 계속해서 하나의 객체가 유지된다. <br />
		즉, 객체의 유지 범위가 가장 길다. <br />
		</p>
	</li>
</ol>

<div>
* JSP 내장객체의 유지 범위 순서 <br />
page =&gt; request =&gt; session =&gt; application <br />
<hr />
* EL 내장객체의 유지 범위 순서<br />
pageScope =&gt; requestScope =&gt; sessionScope =&gt; applicationScope <br />
</div>

</body>
</html>