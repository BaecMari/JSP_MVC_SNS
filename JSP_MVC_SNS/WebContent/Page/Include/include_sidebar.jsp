<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL core 활용 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- sidebar2 -->
<h2>새로운 친구들</h2>

<!-- DAO 클래스를 이용하여 새로운 사용자 표시 -->
<jsp:useBean id="mdao" class="sns.member.MemberDao" />
<% for(String newMember : mdao.getNewMembers()) { %>
		<ul>
			<li><%=newMember %></li>
		</ul>
<%} %>

<br><br>

<h3>We're Social Too!!</h3>
<img src="../../images/facebook.png" width="45">
<img src="../../images/twitter.png" width="45">
<img src="../../images/youtube.png" width="45"> <br><br>

<br><br>

<h3>Links</h3>
<ul>
	<li><a href="#">한빛 미디어</a></li>
	<li><a href="#">가나다라마바사</a></li>
</ul>