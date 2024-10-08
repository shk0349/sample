<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script>
    function confirmDelete(id) {
        // confirm 창을 띄운다. 확인을 누르면 true, 취소를 누르면 false를 반환
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 확인을 누르면 해당 학번의 삭제 URL로 이동
            window.location.href = 'memberdelete?id=' + id;
        }
    }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="6" align="center" width="500px">
<tr>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>전화번호</th>
	<th>성별</th>
	<th>주소</th>
	<th>인사말</th>
	<th>수정/삭제</th>
</tr>
<c:forEach items="${list}" var="my">
	<tr>
		<td>${my.id}</td>
		<td>${my.pw}</td>
		<td>${my.name}</td>
		<td>${my.tel}</td>
		<td>${my.gender}</td>
		<td>${my.address}</td>
		<td>${my.greeting}</td>
		<td>
		<a href="memberupdate?id=${my.id}">수정</a>
		<a href="javascript:void(0);" onclick="confirmDelete('${my.id}');">삭제</a>
		</td>
	</tr>
</c:forEach>
</table>
</body>
</html>