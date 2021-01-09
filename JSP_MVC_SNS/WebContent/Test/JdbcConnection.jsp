<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- 입력으로 전달 받는 내용에 대한 한글 인코딩 지정 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	//데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//데이터베이스 연결관련 정보 -- > 커넥션 풀 안사용
	/*String jdbc_drvier = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String jdbc_url = "jdbc:sqlserver://127.0.0.1; DatabaseName=JspSNS";
	String jdbc_user = "User";
	String jdbc_paswd = "1";
	
	//JDBC Driver 로딩
	Class.forName(jdbc_drvier);
	
	//Connection 객체 생성
	conn = DriverManager.getConnection(jdbc_url, jdbc_user, jdbc_paswd);*/
	
	//DBCP를 활용한 커넥션 얻기
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/mssql");
	conn = ds.getConnection();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<%
			//결과를 저장하기 위한 객체
			ResultSet rs = null;
		
			try {
				//PreparedStatement 작성
				String sql = "select * from members";
				pstmt = conn.prepareStatement(sql);
				
				//결과를 ResultSet 클래스의 객체로 받음
				rs = pstmt.executeQuery();
				
				//루프를 이용하여 모든 요소를 순회
				while(rs.next()) {
					out.println(rs.getString("uid") + ", " + rs.getString("name") + ", "
							+ rs.getString("email") + ", " + rs.getString("joindate") + "<BR>");
				}
				
				//사용할 자원의 반납
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println(e);
			}
		%>
	</div>
</body>
</html>