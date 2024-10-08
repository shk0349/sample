<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="bookupdate2" method="post" enctype="multipart/form-data">
<table border="6" align="center" width="700px">
	<tr>
		<th>책번호</th>
			<th><input type="text" name="bnumber" value="${dto.bnumber}" readonly></th>
	</tr>
	<tr>
		<th>책제목</th>
			<th><input type="text" name="bname" value="${dto.bname}" ></th>
	</tr>
	<tr>
		<th>저자</th>
			<th><input type="text" name="bwriter" value="${dto.bwriter}"></th>
	</tr>
	<tr>
		<th>출판사</th>
			<th><input type="text" name="bcompany" value="${dto.bcompany}" ></th>
	</tr>
	<tr>
		<th>가격</th>
			<th><input type="text" name="bprice" value="${dto.bprice}" ></th>
	</tr>
	<tr>
		<th>출판일</th>
			<th><input type="date" name="bdate" value="${dto.bdate}" ></th>
	</tr>
	<tr>
		<th>책내용</th>
			<th><textarea rows="10" cols="20" name="bcontent"></textarea></th>
	</tr>
	<tr>
		<th>책표지</th>
			<th>
			<img src="./image/${dto.bimage}">
			<input type="file" name="bimage">
			</th>
	</tr>
	<tr>
			<th colspan="2" style="text-align: center">
			<input type="submit" value="수정">
			<input type="submit" value="취소">
			</th>
	</tr>
</table>
</form>
</body>
</html>