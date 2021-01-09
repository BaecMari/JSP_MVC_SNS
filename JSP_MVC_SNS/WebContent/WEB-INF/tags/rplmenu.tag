<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="rplid" %> <!-- 댓글 번호 -->
<%@ attribute name="rpluid" %> <!-- 댓글 작성자 userid -->
<%@ attribute name="curmsg" %> <!-- 댓글을 포함할 메시지번호, accordian 에서 사용 -->

<!-- 로그인 아이디 (uid)와 댓글 작성자 (ruid)가 같으면 [삭제] 버튼 추가 -->
<c:if test="${uid == rpluid }">
	[<a href="../Controller/sns_control.jsp?action=delreply&rid=${rplid }&curmsg=${curmsg}">삭제</a>]
</c:if>

<!-- 댓글에는 좋아요 기능이 없음 -->