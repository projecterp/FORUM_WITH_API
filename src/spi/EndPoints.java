package spi;

import java.util.ArrayList;
import java.util.Date;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.api.server.spi.config.ApiMethod.HttpMethod;
import com.google.api.server.spi.config.Named;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;

import querymanager.*;
import advance_querymanager.advPostQuery.Adv_QueryManager;
import board.*;
import consts.Constants;

@Api(name = "forumAPI", version = "v1", scopes = { Constants.EMAIL_SCOPE} , clientIds = {
		Constants.WEB_CLIENT_ID, Constants.API_EXPLORER_CLIENT_ID }, description = "API for the MNIT ERP  FORUM Backend application.")

public class EndPoints {
	
	private String userId;
	private String displayName;
	
	Query_All qa=new Query_All();
	Adv_QueryManager aq=new Adv_QueryManager();
	
	@SuppressWarnings("deprecation")
	private static String generateDate() {
		Date date = new Date();
		int dd = date.getDate();
		int mm = date.getMonth() + 1;
		int yyyy = date.getYear() + 1900;
		int hours = date.getHours();
		int mins = date.getMinutes();
		int secs = date.getSeconds();
		String time = dd + "-" + mm + "-" + yyyy + " " + hours + ":" + mins
				+ ":" + secs;
		return time;

	}

	
// used in the topics.jsp
	
	@ApiMethod(name = "loadTopics", path = "loadTopics", httpMethod="POST" )
	public ArrayList<Entity> loadTopics(Topics obj)
	{
		ArrayList<Entity> topics=qa.getTopics(obj.getSem(),obj.getSub());
		return topics;
	}
	
	@ApiMethod(name = "addTopic", path = "addTopic")
	public void addTopic(@Named("topic_name")String topic,@Named("sem") String sem,@Named("sub") String sub)
	{
		Entity new_topic=qa.addTopic(topic, sem, sub);
	}
  
	@ApiMethod(name="getSearchedTopics",path="getSearchedTopics")
	public ArrayList<Entity> getSearchedTopics(Topics obj)
	{
		ArrayList<Entity> topics=qa.getSearchedTopics(obj.getSem(),obj.getSub(),obj.getTopic());
		return topics;
	}
	

// used in the index2.jsp
	
	@ApiMethod(name = "loadPosts", path = "loadPosts")
	public ArrayList<Entity> getPosts(@Named("topic")String topic,@Named("sem") String sem,@Named("sub") String sub)
	{
		ArrayList<Entity>posts=qa.getPosts(sub, sem, topic);
		return posts;
		
	}
	
	@ApiMethod(name = "addPost", path = "addPost")
	public Entity addPost(@Named("user")String user,@Named("topic_name")String topic,@Named("sem") String sem,@Named("sub") String sub,@Named("post") String str,@Named("tag")String tag)
	{
		Entity new_post=qa.addPost(user, sub, sem, topic, str, tag);
		return new_post;
	}
	
	@ApiMethod(name="getSearchedPost",path="getSearchedPost")
	public ArrayList<Entity> getSearchedPosts(@Named("topic")String topic,@Named("sem")String sem,@Named("sub")String sub,@Named("search")String search,@Named("type")String type,final User user)
	{
	    if(type.equals("Latest"))	
	    {  
	    	return aq.getLatestPosts(sem, sub, topic);
	    }
	    else if(type.equals("Most Rated"))
	    {
	    	return aq.getMostRatedPosts(sem, sub, topic);
	    }
	    else if(type.equals("Keyword"))
	    {
	    	return aq.getNamePosts(sem, sub, topic,search);
	    }
	    else if(type.equals("Tag"))
	    {
	    	return aq.getTagPosts(sem, sub, topic,search);
	    }
	    else
	    {
	    	return aq.getUserPosts(sem, sub, topic,user.getNickname());
	    }
	}
}
