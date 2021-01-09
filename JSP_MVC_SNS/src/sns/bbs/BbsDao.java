/**
 * 파일명 : BbsDao.java
 * 날짜 : Jan 9, 2021
 * 설명 :
 */
package sns.bbs;

import java.beans.Statement;
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
public class BbsDao {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	final int PAGESIZE = 5; //페이징 화면 5개씩
	
	//게시판 목록의 수를 조회하여 총 페이지 수를 계산하여 반환함
	//페이징 기능에 사용
	//게시판 목록 개수를 조회하고, 이를 PAGESIZE로 나누어 총 페이지 수를 계산
	public int iBbsPages() {
		//커넥션 풀
		conn = DbMan.getConnection();
		String sql;
		int iTotCnt = 0; //게시글의 개수
		int iTotPage = 0; //페이지 개수
		
		try {
			//게시물 개수 추출
			sql = "select count(*) as iTotCnt from viewbbs";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			
			//쿼리문을 실행하여 ResultSet 가져오미
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			iTotCnt = rs.getInt("iTotCnt");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
			}
		}
		
		//나머지가 0이면 몫이 페이지 수이고, 그렇지 않으면 몫 + 1 이 페이지 수
		if(iTotCnt%PAGESIZE == 0) iTotPage = iTotCnt/PAGESIZE;
		else iTotPage = iTotCnt/PAGESIZE + 1;
		return iTotPage;
	}
	
	//게시판 목록을 ArrayList<Bbs> 형식으로 가져옴
	//입력 파라미터는 현재 페이지를 의미
	public ArrayList<Bbs> getBbsList(int iPage) {
		
		//최종 조회 결과를 저장할 ArrayList, 결과를 Bbs DO 클래스
		
		ArrayList<Bbs> lists = new ArrayList<Bbs>();
		
		//커넥션풀을 이용한 데이터베이스 연결 객체
		conn = DbMan.getConnection();
		String sql; //쿼리문을 저장할 String 변수
		
		//게시판 목록에 대한 결과를 조회, 이미 viewbbs를 구축해 두었음
		//조회할 레코드 수는 PAGESIZE, 제외하여야 하는 레코드 수는 (iPage - 1) * PAGESIZE
		try {
			int iSkip = (iPage-1)*PAGESIZE;
			sql = "SELECT TOP " + PAGESIZE + " * FROM viewbbs "
					+ " where no not in (select TOP " + iSkip
					+ " no from viewbbs order by no desc) "
					+ " order by no desc";
			
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			
			//쿼리문 실행하여 ResultSet 가져옴
			ResultSet rs = pstmt.executeQuery();
			
			//게시글 수 만큼 반복 실행
			while(rs.next()) {
				//정보를 저장한 Bbs 객체 선언하여 정보를 저장
				Bbs bbs = new Bbs();
				bbs.setNo(rs.getInt("no"));
				bbs.setTitle(rs.getString("title"));
				bbs.setContents(rs.getString("contents"));
				bbs.setAuthor(rs.getString("author"));
				bbs.setUploaddate(rs.getString("uploadtime"));
				bbs.setHits(rs.getInt("hits"));
				bbs.setName(rs.getString("name"));
				
				//목록에 등록
				lists.add(bbs);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
			}
		}
		return lists;
	}
	
	/*
	 * 신규 글 등록
	 * 파라미터 Bbs bbs --> 등록할 글의 내용
	 * 반환값 --> 메시지 등록 성공 여부 (true/ false)
	 * */
	public boolean newArticle(Bbs bbs) {
		//반환값
		boolean returnVal = true;
		conn = DbMan.getConnection();
		String sql = "insert into bbs "
				+ " (title, contensts, author, uploadtime, hits) "
				+ "values (?,?,?,GETDATE(),?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbs.getTitle());
			pstmt.setString(2, bbs.getContents());
			pstmt.setString(3, bbs.getAuthor());
			pstmt.setInt(5, bbs.getHits());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			returnVal = false;
		} finally { 
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return returnVal;
	}
	
	/*
	 * 메시지 상세보기
	 * 파라미터 int no --> 상세보기할 글 번호
	 * 리턴 값 --> Bbs bbs --> 게시판 글 중 특정 레코드 하나
	 * */
	
	public Bbs getDetails(int no) {
		//리턴값 
		Bbs bbs = new Bbs();
		
		//커넥션 객체
		conn = DbMan.getConnection();
		
		//조회수 증가 쿼리문
		String sqlupdate = "update bbs set hits=hits+1 where no = ?";
		
		//상세보기 정보 조회 쿼리문
		String sqlselect = "select * from viewbbs where no = ?";
		
		try {
			//조회수 증가 실행
			pstmt = conn.prepareStatement(sqlupdate);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			//상세보기 증가 실행
			pstmt = conn.prepareStatement(sqlselect);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			//결과를 Bbs 클래스의 객체에 저장함
			while(rs.next()) {
				bbs.setNo(rs.getInt("no"));
				bbs.setTitle(rs.getString("title"));
				bbs.setContents(rs.getString("contents"));
				bbs.setAuthor(rs.getString("author"));
				bbs.setUploaddate(rs.getString("uploadtime"));
				bbs.setHits(rs.getInt("hits"));
				bbs.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bbs;
	}
	
	
	//메시지 삭제
	//메시지 수정
}
