package querymanager;

import java.util.ArrayList;

import board.Topics;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;

import querymanager.QueryManager;

public class Query_All {

	QueryManager query = new QueryManager();

	public ArrayList<Entity> getSearchedTopics(String sem, String sub,
			String search) {

		return (ArrayList<Entity>) query.getSearchedTopic(sem, sub, search);

	}

	public void addRating(String time, String sem, String rating) {
		if (!query.isRepeatedRating(rating)) {
			query.addRatingToPost(time, sem, rating);
		}
	}

	public Entity getPostByTime(String time, String sem) {

		return query.getPostEntity(time, sem);
	}

	public Entity addPost(String user_id, String sub, String sem, String topic,
			String str, String tag) {
		if (!(query.isPostRepeat(user_id, str))) {
			return query.addPostToEntity(user_id, sem, sub, topic, str, tag);
		}
		return null;
	}

	public void addComment(String user_id, String comment, String time,
			String sem) {
		if (!(query.isCommentRepeat(user_id, time, comment))) {
			Entity result = query.getPostEntity(time, sem);
			query.addCommentToEntity(result, comment, user_id);
		}
	}

	public ArrayList<Entity> getPosts(String sub, String sem, String topic) {
		return  query.getPostIterable(sub, sem, topic); 
	}

	public ArrayList<Entity> getTopics(String sem, String sub) {
		return ((ArrayList<Entity>) query.getTopicEntities(sem, sub));
	}

	public Entity addTopic(String topic_str, String sem, String sub) {
		if ((query.isTopicRepeat(sem, sub, topic_str))==false) {
			return query.addTopicToEntity(topic_str, sem, sub);
		}
		return null;
	}

}
