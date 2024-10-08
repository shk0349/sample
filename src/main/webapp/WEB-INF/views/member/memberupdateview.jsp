<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="memberupdate2" method="post">
<table border="6" align="center" width="700px">
<tr>
	<th>아이디</th>
		<td>
		<input type="text" name="mid" value="${dto.mid}" readonly>
		</td>
</tr>
<tr>
	<th>비밀번호</th>
		<td><input type="password" name="pw" value="${dto.pw}"></td>
</tr>
<tr>
	<th>이름</th>
		<td><input type="text" name="name" value="${dto.name}"></td>
</tr>
<tr>
	<th>전화번호</th>
		<td><input type="text" name="tel" value="${dto.tel}"></td>
</tr>
<tr>
	<th>성별</th>
		<td>
		<input type="radio" name="gender" value="남성">남성
		<input type="radio" name="gender" value="여성">여성
		</td>
</tr>
<tr>
	<th>주소</th>
		<td><input type="text" name="address" value="${dto.address}"></td>
</tr>
<tr>
	<th>인사말</th>
		<td><textarea rows="5" cols="10" name="greeting"></textarea></td>
</tr>
<tr>
		<td colspan="2" style="text-align: center">
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		</td>
</tr>
</table>
</form>
</body>
</html>