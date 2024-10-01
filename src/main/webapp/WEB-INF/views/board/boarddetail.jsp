<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th
{
text-align: center;
}</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reply" method="post">
<table border="6" align="center" width="300px">

<input type="hidden" value="${dto.bnumber}" name="number">
<tr>
	<th>글번호</th>
	<th>글내용</th>
</tr>
<tr>
	<td>${dto.bnumber}</td>
	<td>
	<textarea rows="10" cols="20">${dto.bcontents}</textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="댓글작성">
	<input type="button" value="메인으로" onclick="location.href='./'">
	</td>
	
</tr>
</table>
</form>
</body>
</html>