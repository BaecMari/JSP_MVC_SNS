<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<!-- 회원등록 버튼을 누르면, user_control.jsp 페이지 호출 -->
	<form method="post" action="../Controller/user_control.jsp?action=newuser">
		<table>
			<!-- required 속성은 값이 없을 경우 submit 버튼을 누를 때 값을 입력해야 한다는 메시지 출력 -->
			<!-- 컨트롤의 이름은 Member 클래스(DO 클래스)의 멤버변수와 일치해야 함 -->
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20" required></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" size="20" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" size="20" required></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" size="20" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" size="20" required></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>