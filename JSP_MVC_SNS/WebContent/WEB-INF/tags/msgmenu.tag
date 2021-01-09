<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="msgid" %> <!-- 메시지 번호 -->
<%@ attribute name="msguid" %> <!-- 작성자 uid -->
<%@ attribute name="curmsg" %> <!-- 댓글을 포함할 메시지 번호, accodian에서 사용 -->

<!-- 로그인 아이디 (uid)와 메시지 작성자 (msguid)가 같으면 [삭제] 버튼 추가 -->
<c:if test="${uid== msguid }">
	[<a href="../Controller/sns_control.jsp?action=delmsg&mid=${msgid }&curmsg=${curmsg}">삭제</a>]
</c:if>

<!-- [좋아요] 버튼 추가, 좋아요는 누구나 가능 -->
[<a href="../Controller/sns_control.jsp?action=favorite&mid=${msgid }&curmsg=${curmsg}">좋아요</a>]