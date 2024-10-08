<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="booksave" method="post" enctype="multipart/form-data">
<table border="6" align="center" width="500px">
	<tr>
		<th>책제목</th>
			<th><input type="text" name="bname"></th>
	</tr>
	<tr>
		<th>저자</th>
			<th><input type="text" name="bwriter"></th>
	</tr>
	<tr>
		<th>출판사</th>
			<th><input type="text" name="bcompany"></th>
	</tr>
	<tr>
		<th>가격</th>
			<th><input type="text" name="bprice"></th>
	</tr>
	<tr>
		<th>출판일</th>
			<th><input type="date" name="bdate"></th>
	</tr>
	<tr>
		<th>책내용</th>
			<th><textarea rows="10" cols="20" name="bcontent"></textarea></th>
	</tr>
	<tr>
		<th>책표지</th>
			<th><input type="file" name="bimage"></th>
	</tr>
	<tr>
			<th colspan="2" style="text-align: center">
			<input type="submit" value="입력">
			<input type="submit" value="취소">
			</th>
	</tr>
</table>
</form>
</body>
</html>