/**
 * 파일명 : Member.java
 * 날짜 : Jan 7, 2021
 * 설명 :
 */
package sns.member;

import java.sql.Date;

/**
 * @author tardi
 *
 */
public class Member {
	
	private String name;
	private String uid;
	private String passwd;
	private String email;
	private Date joindate;
	private int age;
	
	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}
	/**
	 * @param uid the uid to set
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}
	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the joindate
	 */
	public Date getJoindate() {
		return joindate;
	}
	/**
	 * @param joindate the joindate to set
	 */
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
	
}
