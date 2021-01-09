<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>

<%-- JSTL 사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="loginform" method="post" action="../Controller/user_control.jsp">
	<c:choose>
		<c:when test="${uid != null }">
			<input type="hidden" name="action" value="logout" />
			<input type="submit" value="로그아웃" />	
		</c:when>
		<c:otherwise>
			<li><a href="#">Login</a></li>
		
			<input type="hidden" name="action" value="login" />&nbsp;
			<input type="text" name="uid" size="5" />
			<input type="password" name="passwd" size="5"/>
			<input type="submit" value="로그인"/>
		</c:otherwise>
	</c:choose>
</form>
