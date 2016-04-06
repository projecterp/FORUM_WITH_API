package board;

import java.util.ArrayList;

import javax.jdo.annotations.Index;
import javax.persistence.Entity;

@Entity
public class Topics {

	@Index
	private String sem;
	@Index
	private String sub;
	@Index
	private String time;
	@Index
	private String topic;

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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

}
