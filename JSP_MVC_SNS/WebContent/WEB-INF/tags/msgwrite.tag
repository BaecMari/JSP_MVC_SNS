<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="type" %>

<c:if test="${uid != null }">
	<!-- 로그인 -> 메시지 or 댓글 입력 가능 -->
	<c:choose>
		<c:when test="${type == 'message' }">
			소식올리기<input type="text" name="msg" maxlength="100" />
		</c:when>
		<c:when test="${type == 'reply' }">
			댓글달기 <input type="text" name="reply" maxlength="50" size="60" />
		</c:when>
	</c:choose>
	<button class="submit" type="submit">등록</button>
</c:if>

<c:if test="${uid == null}">
	<!-- 로그인 안한 상태 -->
	<c:choose>
		<c:when test="${type == 'message' }">
			소식올리기<input type="text" name="msg" maxlength="100" disabled="disabled" value="작성하려면 로그인 하세요."/>
		</c:when>
		<c:when test="${type == 'reply' }">
			댓글달기<input type="text" name="reply" maxlength="50" size="60" disabled="disabled" value="작성하려면 로그인 하세요." />
		</c:when>
	</c:choose>
</c:if>