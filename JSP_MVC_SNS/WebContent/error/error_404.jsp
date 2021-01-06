<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>404-error.jsp[web.xml 지정]</h2>
		<hr>
		<table>
			<tr>
				<td width="100%" bgcolor="blue">
					요청하신 파일을 찾을 수 없습니다. <br>
					URL 주소를 다시한번 확인해 주세요!!
				</td>
			</tr>
			<tr>
				<td>
					${now }<p>
					요청 실패URI : ${pageContext.errorData.requestURI } <br>
					상태코드 : ${pageContext.errorData.statusCode }<Br>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>