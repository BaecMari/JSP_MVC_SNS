/**
 * 파일명 : MessageSet.java
 * 날짜 : Jan 10, 2021
 * 설명 :
 */
package sns.sns;

import java.util.ArrayList;

/**
 * @author tardi
 *
 */
public class MessageSet {

	//메시지
	private Message message;
	
	// 해당 메시지에 대한 댓글 목록
	private ArrayList<Reply> rlist = new ArrayList<Reply>();

	/**
	 * @return the message
	 */
	public Message getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(Message message) {
		this.message = message;
	}

	/**
	 * @return the rlist
	 */
	public ArrayList<Reply> getRlist() {
		return rlist;
	}

	/**
	 * @param rlist the rlist to set
	 */
	public void setRlist(ArrayList<Reply> rlist) {
		this.rlist = rlist;
	}
	
	
}
