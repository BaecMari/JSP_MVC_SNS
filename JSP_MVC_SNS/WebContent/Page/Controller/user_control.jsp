<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- DO 클래스의 객체 생성 및 속성 값 전달 -->
<!-- 입력 폼으로부터 속성값을 전달받기 위함 -->
<jsp:useBean id="mdo" class="sns.member.Member"/>
<jsp:setProperty name="mdo" property="*" />

<!-- DAO 클래스의 객체 생성 및 속성 값 전달 -->
<jsp:useBean id="mdao" class="sns.member.MemberDao" />

<%
	// 컨트롤러 요청 action 코드값 추출
	// action(newuser, login, logout) 값에 따라 
	String action = request.getParameter("action");
	//System.out.println("action : " + action);
	
	// 신규 회원등록
	if(action.equals("newuser")) {
		if(mdao.addMember(mdo))
			out.println("<script>alert('정상적으로 등록되었습니다. 로그인 하세요!!');"
			 + "opener.window.location.reload(); window.close();</script>");
		else 
			out.println("<script>alert('같은 아이디가 존재합니다!!');"
				+ "history.go(-1);</script>"); 
	}
	
	//로그인 
	else if(action.equals("login")) {
		if(mdao.login(mdo.getUid(), mdo.getPasswd())) {
			// 로그인 성공  > 세션에 "uid" 저장
			session.setAttribute("uid", mdo.getUid());
			
			//추후 링크 변경 예정
			response.sendRedirect("../default.jsp");
		} else {
			out.println("<script>alert('아이디나 비밀번호가 틀렸습니다!!');"
			+ "history.go(-1);</script>");
		}
	} 
	//로그 아웃
	else if(action.equals("logout")) {
		// 세션에 저장된 값 초기화
		session.removeAttribute("uid");
		
		//추후 링크 변경 예정
		response.sendRedirect("../default.jsp");
	}
%>