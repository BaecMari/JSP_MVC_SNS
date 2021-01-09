<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 개발자가 작성한 태그 파일 -->
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns" %>

<div class="menu">
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="javascript:newuser()">New User</a></li>
		
		<!-- 전체 메시지 보기 -->
		<li><a href="../Controller/sns_control.jsp?action=getall">메시지</a></li>
		
		<!-- 게시판 목록 보기 -->
		<li><a href="../Controller/bbs_control.jsp?action=list">게시판</a></li>
		
		<!-- 커스텀 택을 이용하여 로그인 처리, 로그인 이전과 이후의 모습이 다르게 구현됨 -->
		<li><sns:login></sns:login></li>
	</ul>
</div>