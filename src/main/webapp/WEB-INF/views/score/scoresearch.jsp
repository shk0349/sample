<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="searchsave" method="post">
<table border="6" align="center" width="500px">
<tr>
	<th>검색항목</th>
		<td>
		<select name="key">
		<option value="snumber">학번
		<option value="name">이름
		</select>
		</td>
</tr>
<tr>
	<th>검색값</th>
		<td><input type="text" name="svalue" ></td>
</tr>
<tr>
			<td colspan="2" style="text-align: center">
			<input type="submit" value="전송">
			<input type="reset" value="취소">
			</td>
	</tr>
</table>
</form>
</body>
</html>