<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL core 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 개발자가 작성한 태그 파일 활용 -->
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My SNS</title>

<!-- 본문의 메인 디자인을 위한 스타일 시트 -->
<!-- http://freehtml5templates.com 사이트에 공개된 스타일 시트 사용 -->
<link rel="stylesheet" href="../../css/styles.css" type="text/css"
	media="screen" />

<!-- jQuery-UI를 사용하기 위한 스타일 시트 링크 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />


<!-- jQuery 와 jQuery - UI 사용을 위한 자바 스크립트 파일 링크
CDN (Contents Delivery Network)을 이용 외부에서 파일 참조 -->

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">
	// accordion 컴포넌트의 이벤트 동작을 위한 jQuery 구문
	// accordion을 id로 하는 부분에서 accordion 이벤트 함수 요청이 발생할 경우 스타일을 변경시켜 폴딩효과
	
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content",
			active : parseInt("${curmsg == null ? 0 : curmsg}")
		});
	});
	
	//친구추가를 위한 새로운 윈도우 생성시킴
	//메뉴바 등의 장식이 없는 윈도우 생성ㄴ
	function newuser() {
		window.open("new_user.jsp", "newuser",
				"titlebar=no, location=no, scrollbars=no, resizeable=no, menubar=no,"
				+ "toolbar=no, width=300, height=240")
	}
</script>
</head>
<body>

	<!-- 상단 배너 -->
	<header>
		<%-- Header 영역의 기술내용을 include함 --%>
		<%@include file="../Include/include_header.jsp"%>
	</header>

	<!-- 배너 아래의 메인메뉴 -->
	<nav>
		<%-- Navigation 영역의 기술내용을 include함 --%>
		<%@include file="../Include/include_nav.jsp"%>
	</nav>

	<div id="wrapper">
		<!-- 메인 콘텐츠 구성 위치 -->
		<section id="main">
			<!-- 메인 콘텐츠 위치 중 주된 콘텐츠가 위치할 부분, 페이지마다 내용이 다름 -->
			<section id="content">
				<b>내 소식 업데이트</b>
				<!-- 임시로 형식을 보기 위해 만들어 놓은 것, 추후 코드 변경 -->
				<form class="m_form" method="post">
					<input type="text" name="message">

					<button class="submit" type="submit">등록</button>
				</form>

				<br> <br>
				<h3>친구들의 최신 소식</h3>
				<div id="accordion">
					<!-- UI 테스트를 위한 용도로 만든 샘플 -->
					<h3>김프리 :: 2013.7.8:14:00 작성 [좋아요 6 | 댓글 4]</h3>
					<div>
						<p>어제는 나홀로 영화를 보았습니다. ^^ 사람들이 이상하다고 해도 나는 즐거워요..</p>
						<p>[삭제] 좋아요 / 2013.7.8:14:00</p>
						<ul class="reply">
							<li>홍길동 :: 저랑 똑같네요.. - 2013.07.08 <a href="">삭제</a></li>
							<li>홍길동 :: 저랑 똑같네요.. - 2013.07.08 <a href="">삭제</a></li>
							<li>홍길동 :: 저랑 똑같네요.. - 2013.07.08 <a href="">삭제</a></li>
						</ul>
						<form action="" class="">
							댓글달기<input type="text" name="" size="60">
						</form>
					</div>
				</div>
			</section>
			<!-- end of section content -->

			<aside id="sidebar2">
				<%-- SideBar 영역의 기술내용을 include 함 --%>
				<%@ include file="../Include/include_sidebar.jsp"%>
			</aside>
			<!-- end of sidebar -->
		</section> <!-- end of section main -->
	</div>
	
	<footer>
		<%-- Footer 영역의 기술내용을 include함 --%>
		<%@ include file="../Include/include_footer.jsp" %>
	</footer>
</body>
</html>