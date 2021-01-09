/**
 * 파일명 : Message.java
 * 날짜 : Jan 10, 2021
 * 설명 :
 */
package sns.sns;

/**
 * @author tardi
 *
 */
public class Message {
	
	private int mid; // 게시글 시퀀스 id
	private String uid; // 게시글 작성자
	private String msg; // 게시글 내용
	private String uploaddate; // 게시글 작성일, 시간
	private int favoritecnt; // 좋아요 회수
	private int replycnt; // 댓글 개수
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
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
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
	/**
	 * @return the favoritecnt
	 */
	public int getFavoritecnt() {
		return favoritecnt;
	}
	/**
	 * @param favoritecnt the favoritecnt to set
	 */
	public void setFavoritecnt(int favoritecnt) {
		this.favoritecnt = favoritecnt;
	}
	/**
	 * @return the replycnt
	 */
	public int getReplycnt() {
		return replycnt;
	}
	/**
	 * @param replycnt the replycnt to set
	 */
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	
}
