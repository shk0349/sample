<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="6" align="center" width="auto">
	<tr>
	<th>이미지</th>
		<td><img src="./image/${dto.bimage}" width="300px" hegith="300px"></td>
	</tr>
	<tr>
	<th>책내용</th>
		<td>${dto.bcontent}</td>
	</tr>
	<tr>
	<td><input type="button" value="이전으로" onclick="location.href='bookout'"></td>
	</tr>
</table>
</body>
</html>