<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 한글 입력 처리를 위해 지금까지 했던 방법 -->
<%-- request.setCharacterEncoding("utf-8"); --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>한글 인코딩 처리결과 (result.jsp)</h2>
		<hr>
		
		<!-- 표현 언어를 이용하여 파라미터로 전달된 값을 출력 -->
		처리 결과 : ${param.title}
	</div>
</body>
</html>