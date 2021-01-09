<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sns" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My SNS</title>

<!-- 본문의 메인디자인을 위한 스타일 시트 -->
<!-- http://freehtml5templates.com 사이트에 공개된 스타일 시트-->
<link rel="stylesheet" href="../../css/styles.css" type="text/css"
	media="screen" />

<!-- jQuery-UI 사용하기 위한 스타일 시트 링크 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<!-- jquery 와 jquery-ui 사용을 위한 자바 스크립트 파일 링크 -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">
	//친구 추가를 위한 새로운 윈도우 생성시킴
	//메뉴바 등의 장식이 없는 윈도우 생성
	function newuser() {
		window.open("../View/new_user.jsp", "newuser",
				"titlebar=no,location=no,scrollbars=no,resizeable=no,menubar=no,"
						+ "toolbar=no,width=300,height=240");
	}
</script>
</head>
<body>
	<header>
		<%@include file="../Include/include_header.jsp" %>
	</header>
	<nav>
		<%@include file="../Include/include_nav.jsp" %>
	</nav>
	
	<div id="wrapper">
		<section id="main">
			<section id="content">
				<div style="text-align: left;">
					<H2>게시판 상세보기</H2>
				</div>
				[<a href="../Controller/bbs_control.jsp?action=list">게시판 목록으로</a>] <P>
				
				<!-- bbs_control.jsp 에서 request의 attribute 읽음 -->
				<table border="1">
					<tr>
						<th width="100px">번호</th>
						<th width="100px">${m_bbs.no }</th>
						<th width="100px">작성자</th>
						<th width="100px">${m_bbs.name }(${m_bbs.author })</th>
						<th width="100px">조회수</th>
						<th width="100px">${m_bbs.hits }</th>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${m_bbs.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">${m_bbs.contents }</td>
					</tr>
				</table>
			</section>
		</section>
	</div>
</body>
</html>