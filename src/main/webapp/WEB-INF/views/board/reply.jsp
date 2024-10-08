<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="replysave" method="post">
<table border="6" align="center" width="300px">
<input type="hidden" value="${dto.bnumber}" name="bnumber">
<input type="hidden" value="${dto.groups}" name="groups">
<input type="hidden" value="${dto.step}" name="step">
<input type="hidden" value="${dto.indent}" name="indent">

	<tr>
		<th>작성자</th>
			<td><input type="text" name="bwriter"></td>
	</tr>
	<tr>
		<th>글제목</th>
			<td><input type="text" name="btitle"></td>
	</tr>
	<tr>
		<th>글내용</th>
			<td><textarea rows="10" cols="20" name="bcontents"></textarea></td>
	</tr>
	<tr>
			<td colspan="2" style="text-align: center">
			<input type="submit" value="댓글등록">
			<input type="button" value="메인으로" onclick="location.href='./'">
			</td>
	</tr>
</table>
</form>
</body>
</html>