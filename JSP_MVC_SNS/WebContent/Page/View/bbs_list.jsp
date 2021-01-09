<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL의 core 활용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 개발자가 작성한 태그 파일 -->
<%@ taglib prefix="sns" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My SNS</title>

<!-- 본문의 메인디자인을 위한 스타일 시트 -->
<!-- http://freehtml5templates.com 사이트에 공개된 스타일 시트-->
<link rel="stylesheet" href="../../css/styles.css" type="text/css" media="screen" />

<!-- jQuery-UI 사용하기 위한 스타일 시트 링크 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<!-- jquery 와 jquery-ui 사용을 위한 자바 스크립트 파일 링크 -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">
	<%-- 상세보기 화면으로 이동하기 위한 URL 구성. JavaScript는 헤드 태그 사이에 위치 --%>
	<%-- 입력으로 no를 가져와서 bbs_control.js 페이지로 이동 --%>
	function getshowurl(no) {
		document.location.href
			= "../Controller/bbs_control.jsp?action=details&no="+no;
	}
	
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
		<%-- Header --%>
		<%@include file="../Include/include_header.jsp" %>
	</header>
	<!-- nav -->
	<nav>
		<%@include file="../Include/include_nav.jsp" %>
	</nav>
	
	<div id="wrapper">
		<!-- 메인 콘텐츠 구성 위치 -->
		<section id="main">
			<!-- 메인 콘텐츠 위치 중 주된 콘텐츠가 위치할 부분, 페이지 마다 내용이 달라짐 -->
			<section id="content">
				<h2>게시판 목록</h2>
				<!-- 게시판 목록 -->
				<table style="width:100%" border="1">
					<tr>
						<th width="50px">번호</th>
						<th width="300px">제목</th>
						<th width="120px">작성자</th>
						<th width="80px">작성일</th>
						<th width="50px">조회수</th>
					</tr>
					<c:forEach var="bbs" items="${bbslists }">
						<tr>
							<td align="center">${bbs.no }</td>
							<td align="center"><a href="javascript:getshowurl(${bbs.no })">${bbs.title }</a></td>
							<td align="center">${bbs.name }</td>
							<td align="center">${bbs.uploaddate }</td>
							<td align="center">${bbs.hits }</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 기능을 위한 부분 -->
				<jsp:useBean id="bdao" class="sns.bbs.BbsDao"/>
				<%
					//페이지에 나타낼 페이지 개수
					final int PAGEBLOCK = 5;
					//현재 페이지 읽기
					int iPage = Integer.parseInt(request.getParameter("page"));
					
					//MemberDao에서 총페이지 수를 구해옴
					int iTotalPages = bdao.iBbsPages();
					
					//페이지 블럭의 시작과 끝
					int iStartPage = (iPage - 2 < 1) ? 1 : iPage - 2;
					int iEndPage = (iPage + 2 > iTotalPages) ? iTotalPages : iPage + 2;
				%>
				<!-- 테이블을 이용하여 페이징 기능 처리 -->
				<table style="width:100%;" border="1">
					<tr><td style="text-align:center;" width="700px">
					<%if (iStartPage > 1) {%>
						<a href="../Controller/bbs_control.jsp?action=list&page=1">&lt;&lt;</a>
						<a href="../Controller/bbs_control.jsp?action=list&page=<%=iPage-1 %>">&lt;</a>
					<%} %>
					<%for (int i=iStartPage; i <= iEndPage; i++) { 
						if(i == iPage) {%>
							<a href="#"><b><%=i %></b></a>						
						<%} else {%>
							<a href="../Controller/bbs_control.jsp?action=list&page=<%=i %>"><%=i %></a>
						<%} %>
					<%} %>
					
					<%if (iEndPage < iTotalPages) { %>
						<a href="../Controller/bbs_control.jsp?action=list&page=<%=iPage+1 %>">&gt;</a>
						<a href="../Controller/bbs_control.jsp?action=list&page=<%=iTotalPages %>">&gt;&gt;</a>
					<%} %>
					</td></tr>
				</table>
				
				<!-- 글쓰기 버튼 -->
				<form name="form1" method="post" action="../Controller/bbs_control.jsp">
					<input type="hidden" name="action" value="write"/>
					<sns:bbswrite></sns:bbswrite>
				</form>
			</section> <!-- end of section content -->
			
			<aside id="sidebar2">
				<%-- Sidebar 영역의 기술내용을 include 함 --%>
				<%@include file="../Include/include_sidebar.jsp" %>
			</aside> <!-- end of sidebar -->
		</section> <!-- end of section main -->
	</div>
	
	<footer>
		<%-- Footer 영역의 기술내용을 include 함 --%>
		<%@include file="../Include/include_footer.jsp" %>
	</footer>
</body>
</html>