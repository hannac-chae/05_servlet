<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie 로그인</title>
<style type="text/css">
	table, th, td {
		border: 1px solid black;
	}
</style>

</head>
<body>

<!-- table>(tr>th+td)*3 -->
<h3>로그인 하세요(Cookie)</h3>
<form action="login" method="post">
	<table>
		<tr>
			<th>유저 아이디</th>
			<td>
				<input type="text" 
				       name="userId" required="required" />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" 
				       name="password" required="required" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="reset" value="초기화" />
				<input type="submit" value="로그인" />
			</th>
		</tr>
	</table>
</form>

</body>
</html>




