<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(3) EL 다중 파라미터 처리</title>
</head>
<body>

이 페이지를 요청할 때, 다음의 주소를 복사하여 요청합니다. <br />
http://localhost:8080/el/el3.jsp <br />
http://localhost:8080/el/el3.jsp?hobby=baseball <br />
http://localhost:8080/el/el3.jsp?hobby=baseball&hobby=surf <br />
http://localhost:8080/el/el3.jsp?hobby=baseball&hobby=surf&hobby=triathlon <br />
http://localhost:8080/el/el3.jsp?hobby= <br />
<hr />

<h3>EL의 다중 파라미터 처리</h3>
EL에서 다중 파라미터는 paramValues(대소문자 주의)로 <br />
추출하고 결과는 배열로 받아진다. <br />
따라서 각 원소에 배열 인덱스를 나타내는 괄호 안에 <br /> 
[숫자]로 접근가능 하다.
<hr />

<ol>
	<li>hobby[0] :
		\${paramValues.hobby[0]} 
		= ${paramValues.hobby[0]}
	</li>
	<li>hobby[1] :
		\${paramValues.hobby[1]} 
		= ${paramValues.hobby[1]}
	</li>
	<li>hobby[2] :
		\${paramValues["hobby"][2]} 
		= ${paramValues["hobby"][2]}
	</li>
</ol>

<hr />
<h3>scriptlet, expression Tag 를 사용하여 
       다중 파라미터 처리 : getParameterValues()</h3>

<%
	String[] hobbies = request.getParameterValues("hobby");

	if (hobbies != null) {
		int count = 0;
		for (String hobby: hobbies) {
%>
			hobby[<%=count %>] = <%=hobby %> <br />
<%			count++;
		}
	} else {
%>
		파라미터에 hobby 라는 이름으로 전달된 값이 없습니다. <br />
<%		
	}
%>
       
</body>
</html>