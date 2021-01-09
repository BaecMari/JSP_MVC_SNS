/**
 * 파일명 : Reply.java
 * 날짜 : Jan 10, 2021
 * 설명 :
 */
package sns.sns;

/**
 * @author tardi
 *
 */
public class Reply {
	
	private int rid; // 답글 시퀀스 id
	private int mid; // 원본글 id
	private String reply; // 답글 내용
	private String uid; // 답글 작성자
	private String uploaddate; // 답글 작성일자
	/**
	 * @return the rid
	 */
	public int getRid() {
		return rid;
	}
	/**
	 * @param rid the rid to set
	 */
	public void setRid(int rid) {
		this.rid = rid;
	}
	/**
	 * @return the mid
	 */
	public int getMid() {
		return mid;
	}
	/**
	 * @param mid the mid to set
	 */
	public void setMid(int mid) {
		this.mid = mid;
	}
	/**
	 * @return the reply
	 */
	public String getReply() {
		return reply;
	}
	/**
	 * @param reply the reply to set
	 */
	public void setReply(String reply) {
		this.reply = reply;
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
	 * @return the uploaddate
	 */
	public String getUploaddate() {
		return uploaddate;
	}
	/**
	 * @param uploaddate the uploaddate to set
	 */
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	
	
}
