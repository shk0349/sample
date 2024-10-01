<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%!String today; %>
<% today=LocalDate.now().format(DateTimeFormatter.ofPattern("yy년MM월dd일")); %>
<%!String time; %>
<script type="text/javascript">
function timer(){
	var nt=document.getElementById("nowtime");
	nt.innerHTML=(new Date()).toLocaleTimeString();
}
	setInterval("timer()",100);
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 네비게이션 바 전체의 배경색 변경 */
.navbar {
	background-color: #6CC0FF !important; /* 배경 색상 변경 */
	border-color: #6CC0FF !important; /* 보더 색상 변경 */
	opacity: 0.8; /* 불투명도 설정 */
}

/* 네비게이션 바 텍스트 색상 */
.navbar .navbar-nav>li>a, .navbar .navbar-brand {
	color: white !important; /* 텍스트 색상 변경 */
}

/* 활성화된 항목 배경색 */
.nav.navbar-nav>.active>a {
	background-color: #5BB0FF !important; /* 약간 더 어두운 색상으로 활성화 표시 */
}

/* 드롭다운 메뉴 항목의 기본 상태 배경색과 텍스트 색상 */
.dropdown-menu>li>a {
	color: black !important; /* 기본 텍스트 색상 */
	background-color: white !important; /* 기본 배경색 */
}

/* 드롭다운 메뉴 항목 클릭, 포커스, 호버 시 배경색 및 텍스트 색상 */
.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:focus,
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:hover,
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:active {
	background-color: #6CC0FF !important; /* 클릭, 포커스, 호버 시 배경색 */
	color: white !important; /* 클릭, 포커스, 호버 시 텍스트 색상 */
}

/* 추가적으로 active 상태에도 적용 */
.navbar-inverse .navbar-nav .open .dropdown-menu>li>a.active {
	background-color: #6CC0FF !important; /* active 시 배경색 */
	color: white !important; /* active 시 텍스트 색상 */
}

/* 상위 드롭다운 메뉴가 열릴 때의 상태 변경 */
.navbar .navbar-nav>.dropdown.open>a {
	background-color: #6CC0FF !important;
	color: white !important;
}

/* 페이지 전체 불투명도 설정 */
body {
	opacity: 0.8; /* 불투명도 설정 */
}
</style>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">ㅎㅇ</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="./">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="boardin">게시판자료입력</a></li>
						<li><a href="boardout">게시판자료출력</a></li>
					</ul></li>
				
				
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">성적관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="scoreinput">성적입력</a></li>
						<li><a href="scoreout">성적자료출력</a></li>
						<li><a href="scoresearch">성적자료검색</a></li>
					</ul></li>
					
					<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">도서관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="bookinput">도서입력</a></li>
						<li><a href="bookout">도서자료출력</a></li>
						<li><a href="booksearch">도서자료검색</a></li>
					</ul></li>
					
					<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="memberout">회원출력</a></li>
						<li><a href="membersearch">검색</a></li>
					</ul></li>
				
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${loginstate==true }">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
								<%=today %></a></li>
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>
								${dto3.id}님 반갑습니다!!</a></li>
						<li><a href="logout"><span
								class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="#">
								<%=today %></a></li>
					<li><a href="#">
								<p id="nowtime"></p> </a></li>
						<li><a href="memberinput"><span class="glyphicon glyphicon-user"></span>
								회원가입</a></li>
						<li><a href="login"><span
								class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</nav>

	<div class="container"></div>

</body>
</html>