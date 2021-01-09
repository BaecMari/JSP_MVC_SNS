/**
 * 파일명 : DbMan.java
 * 날짜 : Jan 7, 2021
 * 설명 : DB 연결 관련 코드
 */
package sns.util;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author tardi
 *
 */
public class DbMan {
	/*
	 * 커넥션 풀을 이용하여 Connection 객체 리턴
	 * */
	
	public static Connection getConnection() {
		Connection conn;
		try {
			//커넥션풀 활용
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/mssql");
			conn = ds.getConnection();
			
			//커넥션풀이 아닌 경우
			/*
			 * String jdbc_drvier = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			String jdbc_url = "jdbc:sqlserver://127.0.0.1:1433; DataBaseName=JspSNS";
			String jdbc_user = "User";
			String jdbc_passwd = "1";
			
			//JDBC Driver 로딩
			Class.forName(jdbc_drvier);
			
			//Connection 객체 생성
			conn = DriverManager.getConnection(jdbc_url, jdbc_user, jdbc_passwd);*/
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return null;
		}
		return conn;
	}
}
