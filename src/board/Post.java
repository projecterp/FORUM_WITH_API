package board;

import java.util.ArrayList;

import javax.jdo.annotations.Index;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Post {
    @Index
	private String user_id;
    @Index
    private String str;
    @Index
    private String time;
    @Index
    private String sem;
    @Index
    private String sub;
    @Index
    private String topic;
	private ArrayList<String> comment = new ArrayList<String>();
	private int comment_count;
	private ArrayList<String> tag = new ArrayList<String>();
	@Index
	private float rating;
	private int rating_count;

	public  Post() {
		this.comment.add("");
		this.comment_count = 0;
	}

	public String getStr() {
		return str;
	}

	public void setComment(String str) {
		this.comment.add(str);
	}

	public ArrayList<String> getComment() {
		return comment;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public String getSem() {
		return sem;
	}

	public void setSem(String sem) {
		this.sem = sem;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
