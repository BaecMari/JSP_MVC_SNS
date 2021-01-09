<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="sns"%>


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
	<!-- 상단 배너 -->
	<header>
		<%@include file="../Include/include_header.jsp"%>
	</header>

	<!-- 배너 아래의 메인 메뉴 -->
	<nav>
		<%@include file="../Include/include_nav.jsp"%>
	</nav>

	<div id="wrapper">
		<!-- 메인 콘텐츠 구성 위치 -->
		<section id="main">
			<section id="content">
				<div style="text-align: left;">
					<H2>게시판 글 쓰기</H2>
				</div>
				[<a href="../Controller/bbs_control.jsp?action=list">게시판 목록으로</a>] <br>

				<form name="form1" method="post"
					action="../Controller/bbs_control.jsp">
					<!-- action 은 hidden으로 전달 -->
					<input type="hidden" name="action" value="new" />
					<table border="1">
						<tr>
							<th>아이디</th>
							<td width="500px"><input type="text" name="author"
								readonly="readonly" value="${uid }" style="width: 500px;"
								maxlength="15" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" style="width: 500px;"
								maxlength="30" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td height="300px"><textarea name="contents"
									style="width: 500px;" maxlength="500"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="저장" /> <input type="reset" value="취소" /></td>
						</tr>
					</table>
				</form>
			</section>
			<!-- end of section content -->

			<aside id="sidebar2">
				<%-- Sidebar 영역의 기술내용을 include 함 --%>
				<%@include file="../Include/include_sidebar.jsp"%>
			</aside>
			<!-- end of sidebar -->
		</section>
		<!-- end of section main -->
	</div>

	<footer>
		<%@include file="../Include/include_footer.jsp"%>
	</footer>
</body>
</html>