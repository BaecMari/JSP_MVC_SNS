<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>error.jsp [web.xml 지정]</h2>
		<hr>
		<table>
			<tr>
				<td width="100%" bgcolor="pink">
					관리자에게 문의해 주세요... <br>
					빠른시일내 복구하겠습니다.
				</td>
			</tr>
			<tr>
				<td>
					${now }<p>
					요청 실패 URI : ${pageContext.errorData.requestURI } <br>
					상태코드 : ${pageContext.errorData.statusCode } <br>
					예외유형 : ${pageContext.errorData.throwable }
				</td>
			</tr>
		</table>
	</div>
</body>
</html>