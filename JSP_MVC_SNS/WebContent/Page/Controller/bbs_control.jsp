<%@page import="sns.bbs.Bbs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sns.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- input form 으로부터 bbs 정보를 전달받기 위한 빈즈 클래스 -->
<jsp:useBean id="bbs" class= "sns.bbs.Bbs"/>
<jsp:setProperty name="bbs" property="*"/>

<!-- BbsDao 클래스 Model -->
<jsp:useBean id="bbsdao" class="sns.bbs.BbsDao"/>

<%
	// 기본 파라미터 정리
	// 컨트롤러 요청 action 코드 값
	String action = request.getParameter("action");
	
	// 새로운 친구목록을 전달 --> <sidebar> 태그 내부의 친구목록에 사용
	ArrayList<String> newusers = new MemberDao().getNewMembers();
	
	// 신규 회원 목록
	request.setAttribute("newusers", newusers);
	
	// 작업 종료 후 이동할 홈 URL
    String home = "bbs_control.jsp?action=list";
	
	//게시판 목록
	if (action.equals("list")) {
		//페이지 번호가 지정되었는지 확인
		int iPage = (request.getParameter("page") == null)?
				1 : Integer.parseInt(request.getParameter("page"));
		System.out.println("iPage : " + iPage);
		
		//메서드 호출 결과를 ArrayList<Bbs> 형식으로 받은 후, request 의 attribute 로 등록
		ArrayList<Bbs> bbslists = bbsdao.getBbsList(iPage);
		request.setAttribute("bbslists", bbslists);
		
		//bbs_list.jsp 를 화면에 띄움
		pageContext.forward("../View/bbs_list.jsp?page="+iPage);
	}
	//게시글 입력 페이지로 이동
	else if (action.equals("write")) {
		pageContext.forward("../View/bbs_write.jsp");
	}
	//게시글 입력
	else if (action.equals("new")) {
		
		if(bbsdao.newArticle(bbs)) 
			pageContext.forward(home);
		else 
			throw new Exception("게시글 등록 오류");
	}
	//게시글 상세보기
	else if (action.equals("details")) {
		//no 값을 이용하여 해당 게시글의 상세정보를 bbs에 불러옴
		Bbs m_bbs = bbsdao.getDetails(
				Integer.parseInt(request.getParameter("no")));
		
		//데이터베이스로부터 읽은 정보를 수정 폼에 전달
		request.setAttribute("m_bbs", m_bbs);
		pageContext.forward("../View/bbs_show.jsp");
	}
	
	//게시글 수정
	//게시글 삭제
%>
