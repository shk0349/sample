<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="scoresave" method="post">
<table border="6" align="center" width="600px">
<tr>
	<th>이름</th>
		<td><input type="text" name="name"></td>
</tr>
<tr>
	<th>국어</th>
		<td><input type="number" name="kor" min="0" max="100"></td>
</tr>
<tr>
	<th>영어</th>
		<td><input type="number" name="eng" min="0" max="100"></td>
</tr>
<tr>
	<th>수학</th>
		<td><input type="number" name="math" min="0" max="100"></td>
</tr>
<tr>
		<td>
		<input type="submit" value="입력">
		<input type="reset" value="취소">
		</td>
</tr>
</table>
</form>
</body>
</html>