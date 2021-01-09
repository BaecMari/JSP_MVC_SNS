/**
 * 파일명 : MemberDao.java
 * 날짜 : Jan 8, 2021
 * 설명 :
 */
package sns.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sns.util.DbMan;

/**
 * @author tardi
 *
 */
public class MemberDao {
	//데이터베이스 작업 관련 모듈 변수 선언
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/*
	 * 신규 회원 등록
	 * 입력 --> Member 클래스의 객체 -- > 사용자 입력 정보 전달받음
	 * 출력 --> boolean --> 회원입력 성공 여부
	 * */
	
	public boolean addMember(Member m) {
		conn = DbMan.getConnection();
		
		String sql
		= "insert into members (name,uid,passwd, email, age,joindate) "
		+ "values(?,?,?,?,?,GETDATE())";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getUid());
			pstmt.setString(3, m.getPasswd());
			pstmt.setString(4, m.getEmail());
			pstmt.setInt(5, m.getAge());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		} finally {
			//conn 객체 해제
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}		
	
	/*
	 * 메인화면 우측 <sidebar>에 필요한 신규회원 목록
	 * */
	
	public ArrayList<String> getNewMembers() {
		ArrayList<String> newmembers = new ArrayList<String>();
		conn = DbMan.getConnection();
		
		//신규 회원 7명의 목록을 갖고 오는 쿼리문 작성 및 실행
		String sql
		= "select TOP 7 * from members order by joindate desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				newmembers.add(rs.getString("uid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return newmembers;
	}
	
	/*
	 * 회원 로그인
	 * 입력 - > uid, passwd
	 * 출력 - > boolean - > 로그인 성공 여부
	 * */
	
	public boolean login(String uid, String passwd) {
		conn = DbMan.getConnection();
		
		String sql = "select * from members where uid = ? and passwd = ?";
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			//조회한 값이 존재하면 로그인 성공
			if(rs.next()) result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			return false;
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		return result;
	}
}
