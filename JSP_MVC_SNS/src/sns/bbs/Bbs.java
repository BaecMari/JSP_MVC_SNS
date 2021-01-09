/**
 * 파일명 : Bbs.java
 * 날짜 : Jan 9, 2021
 * 설명 :
 */
package sns.bbs;

/**
 * @author tardi
 *
 */
public class Bbs {

	private int no;
	private String title;
	private String contents;
	private String author;
	private String uploaddate;
	private int hits;
	private String name;
	/**
	 * @return the no
	 */
	public int getNo() {
		return no;
	}
	/**
	 * @param no the no to set
	 */
	public void setNo(int no) {
		this.no = no;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the contents
	 */
	public String getContents() {
		return contents;
	}
	/**
	 * @param contents the contents to set
	 */
	public void setContents(String contents) {
		this.contents = contents;
	}
	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
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
	 * @return the hits
	 */
	public int getHits() {
		return hits;
	}
	/**
	 * @param hits the hits to set
	 */
	public void setHits(int hits) {
		this.hits = hits;
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
}
