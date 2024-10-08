<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script>
    function confirmDelete(bnumber) {
        // confirm 창을 띄운다. 확인을 누르면 true, 취소를 누르면 false를 반환
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 확인을 누르면 해당 학번의 삭제 URL로 이동
            window.location.href = 'bookdelete?bnumber=' + bnumber;
        }
    }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="6" align="center" width="600px">
<tr>
	<th>책번호</th>
	<th>책제목</th>
	<th>저자</th>
	<th>출판사</th>
	<th>가격</th>
	<th>출판일</th>
	<th>조회수</th>
	<th>수정/삭제</th>
</tr>
<c:forEach items="${list}" var="my">
<tr>
	<td>${my.bnumber}</td>
	<td><a href="bookdetail?bnumber=${my.bnumber}">${my.bname}</a></td>
	<td>${my.bwriter}</td>
	<td>${my.bcompany}</td>
	<td>${my.bprice}</td>
	<td>${my.bdate}</td>
	<td>${my.breadcnt}</td>
	<td>
	<a href="bookupdate?bnumber=${my.bnumber}">수정</a>
	<a href="javascript:void(0);" onclick="confirmDelete(${my.bnumber});">삭제</a>
	</td>
</tr>
</c:forEach>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="bookout?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="bookout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="bookout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   </td>
</tr>
<!-- 페이징처리 4444444444-->
</table>

</body>
</html>