/**
 * 파일명 : MessageDAO.java
 * 날짜 : Jan 10, 2021
 * 설명 :
 */
package sns.sns;

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
public class MessageDAO {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	final int PAGESIZE = 5; // 한 화면에 표시할 글의 수

	// 메시지 목록의 수를 조회하여 총 페이지 수를 계산하여 반환함 -- > 페이징 기능
	// 특정 사용자가 지정될 경우 검색 조건 추가
	// 메시지 목록 개수를 조회하고, 이를 PAGESIZE로 나누어 총 페이지 수를 계산

	public int iMsgPages(Object suid) {

		// 커넥션풀을 이용한 데이터베이스 연결 객체
		conn = DbMan.getConnection();
		String sql;
		int iTotCnt = 0; // 게시글의 개수
		int iTotPage = 0; // 페이지 개수

		try {
			// 게시물 개수를 추출함
			sql = "select count(*) as iTotCnt from message ";
			if (suid != null) {
				sql += "where uid ='" + suid.toString() + "'";
			}
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);

			// 쿼리문 실행하여 ResultSet 가져옴
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
		
		//나머지가 0이면 몫이 페이지 수, 그렇지 않으면 몫 + 1 이 페이지 수
		if (iTotCnt % PAGESIZE == 0) 
			iTotPage = (iTotCnt/PAGESIZE == 0) ? 1 : iTotCnt / PAGESIZE;
		else iTotPage = iTotCnt / PAGESIZE + 1;
		
		return iTotPage;
	}
	
	// 메시지와 댓글의 목록을 ArrayList 형식으로 가져옴
	// 파라미터 int iPage -- > 메시지 목록에 표시할 현재 페이지
	// 파라미터 String suid -- > 특정 사용자 (specific user id), 친구목록을 누를 경우
	public ArrayList<MessageSet> getAll(int iPage, String suid) {
		
		//최종 조회 결과를 저장할 ArrayList, 결과는 MessageSet DO 클래스
		//MessageSet -- > Message + Reply List
		
		ArrayList<MessageSet> datas = new ArrayList<MessageSet>();
		
		//데이터베이스 연결 객체
		conn = DbMan.getConnection();
		String sql;
		try {
			int iSkip = (iPage-1) * PAGESIZE;
			
			sql = "select TOP " + PAGESIZE + " * FROM message"
					+ " WHERE mid not in (SELECT TOP " + iSkip
					+ " mid from message order by mid desc)";
			
			//특정 사용자가 지정된 경우 검색 조건 추가
			//메인 메뉴로 접근 -- > 특정 사용자 지정 없음
			//sidebar 로 접근 --> 특정 사용자 지정
			
			if(suid != null) {
				sql += " and uid ='" + suid + "'"; 
			}
			
			//검색 조건 추가
			sql += " order by mid desc";
			
			System.out.println("sql : " + sql);
			
			pstmt = conn.prepareStatement(sql);
			
			ResultSet mrs = pstmt.executeQuery();
			
			//메시지 번호 mid 는 댓글 개수 및 댓글 목록을 조회할 때 필요
			int mid;
			
			while(mrs.next()) {
				MessageSet ms = new MessageSet();
				
				Message m = new Message();
				
				m.setMid(mid=mrs.getInt("mid"));
				m.setMsg(mrs.getString("msg"));
				m.setUploaddate(mrs.getString("uploaddate"));
				m.setFavoritecnt(mrs.getInt("favoritecnt"));
				m.setUid(mrs.getString("uid"));
				
				//DO 클래스인 Message 에 추가된 필드인 댓글 개수 구하기
				String csql = "select count(rid) as rcnt from reply " 
						+ "where mid =?";
				
				pstmt = conn.prepareStatement(csql);
				pstmt.setInt(1, mid);
				ResultSet crs = pstmt.executeQuery();
				
				int rcnt = 0;
				if (crs.next()) {					
					m.setReplycnt(rcnt);
				}
				crs.close();
				System.out.println("r count = " + rcnt);
				m.setReplycnt(rcnt); //댓글 개수 
				
				//해당 메시지에 달린 댓글 목록 조회
				ArrayList<Reply> rlist = new ArrayList<Reply>();
				
				//해당 메시지의 댓글을 읽어와서 rlist에 설정
				String rsql = "select * from reply where mid=? "
						+ "order by rid desc";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, mid);
				ResultSet rrs = pstmt.executeQuery();
				
				//댓글 개수만큼 반복
				while (rrs.next()) {
					Reply r = new Reply();
					r.setRid(rrs.getInt("rid"));
					r.setUid(rrs.getString("uid"));
					r.setReply(rrs.getString("reply"));
					r.setUploaddate(rrs.getString("uploaddate"));
					rlist.add(r);
				}
				rrs.close();
				
				//MessageSet DO 클래스에 값을 할당하고, 이를 반환할 data 객체에 추가
				ms.setMessage(m);
				ms.setRlist(rlist);
				datas.add(ms);
			}
			mrs.close();
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
		return datas;
	}
}
