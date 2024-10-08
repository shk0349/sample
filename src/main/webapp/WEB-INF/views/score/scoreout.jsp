<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script>
    function confirmDelete(snumber) {
        // confirm 창을 띄운다. 확인을 누르면 true, 취소를 누르면 false를 반환
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 확인을 누르면 해당 학번의 삭제 URL로 이동
            window.location.href = 'delete?snumber=' + snumber;
        }
    }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="6" align="center" width="500px">
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>총점</th>
		<th>평균</th>
		<th>학점</th>
		<th>순위</th>
		<th>수정/삭제</th>
	</tr>
	<c:forEach items="${list}" var="my">
	<tr>
		<td>${my.snumber}</td>
		<td>${my.name}</td>
		<td>${my.kor}</td>
		<td>${my.eng}</td>
		<td>${my.math}</td>
		<td>${my.tot}</td>
		<td>${my.avg}</td>
		<td>${my.hak}</td>
		<td>${my.rank}</td>
		<td>
		<a href="update?snumber=${my.snumber}">수정</a>
		<a href="javascript:void(0);" onclick="confirmDelete(${my.snumber});">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>