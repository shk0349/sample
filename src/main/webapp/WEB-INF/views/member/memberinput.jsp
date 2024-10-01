<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="membersave" method="post">
<table border="6" align="center" width="auto">
<caption>회원가입화면</caption>
	<tr>
		
			<td>
			<input type="text" name="id" id="id" placeholder="id를 입력해주세요">
			<input type="button" name="idcheck" id="idcheck"  value="중복확인" onclick="#"> 
			</td>
	</tr>
	<tr>
		
			<td><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요"></td>
	</tr>
	<tr>
		
			<td>
			<input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요">
			<input type="button" name="nicknamecheck" id="nicknamecheck" value=" 중복확인" onclick="#"> 
			</td>
	</tr>
	<tr>
			<td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"></td>
	</tr>
	<tr>
			<td>
			<input type="radio" name="gender" value="남성" id="gender-male">남성
			<input type="radio" name="gender" value="여성" id="gender-femail" >여성
			</td>
	</tr>
	<tr>
			<td><input type="date" name="birth" id="birth"></td>
	</tr>
	<tr>
			<td>010-<input type="text" name="phone1" id="phone1">-<input type="text" name="phone2" id="phone2">
			</td>
	</tr>
	<tr>
		<td><input type="text" name="address" id="address" placeholder="주소를 입력해주세요"></td>
	</tr>
	<tr>
			<td>
			<input type="text" name="fdomain" id="domain-txt">@
			<select  class="box"  id="domain-list" name="bdomain">
			<option value="naver.com">naver.com</option>
			<option value="google.com">google.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="kakao.com">kakao.com</option>
			</select>
			</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="button" value="회원가입"  id="button1">
	<input type="reset" value="취소">
	</td>
	</tr>
</table>
</form>
</body>
</html>