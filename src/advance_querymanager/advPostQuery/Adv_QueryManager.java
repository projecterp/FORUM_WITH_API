package advance_querymanager.advPostQuery;

import java.util.ArrayList;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.Query.Filter;

public class Adv_QueryManager {
    AdvFilter af= new AdvFilter();
    DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	public ArrayList<Entity> getLatestPosts(String sem,String sub,String topic)
	{
		Filter semFilter=af.semFilter(sem,FilterOperator.EQUAL);
		Filter subFilter=af.subFilter(sub,FilterOperator.EQUAL);	
		Filter topicFilter=af.topicFilter(topic,FilterOperator.EQUAL);
		int count=0;
		Filter validFilter = CompositeFilterOperator.and(semFilter, subFilter,topicFilter);
		Query q = new Query("Post").setFilter(validFilter).addSort("time",
				SortDirection.DESCENDING);
		PreparedQuery pq = ds.prepare(q);
		ArrayList<Entity> result = new ArrayList<Entity>();
		for(Entity xyz:pq.asIterable())
		{
			if(count==15)
			{
				break;
			}
			result.add(xyz);
		}
		return result;
	}
	
	public ArrayList<Entity> getMostRatedPosts(String sem,String sub,String topic)
	{
		Filter semFilter=af.semFilter(sem,FilterOperator.EQUAL);
		Filter subFilter=af.subFilter(sub,FilterOperator.EQUAL);	
		Filter topicFilter=af.topicFilter(topic,FilterOperator.EQUAL);
		Filter ratingFilter=af.ratingFilter("2.5",FilterOperator.GREATER_THAN_OR_EQUAL);
		int count=0;
		Filter validFilter = CompositeFilterOperator.and(semFilter, subFilter,topicFilter,ratingFilter);
		Query q = new Query("Post").setFilter(validFilter).addSort("rating",
				SortDirection.DESCENDING);
		PreparedQuery pq = ds.prepare(q);
		ArrayList<Entity> result = new ArrayList<Entity>();
		for(Entity xyz:pq.asIterable())
		{
			if(count==10)
			{
				break;
			}
			result.add(xyz);
		}
		return result;
	}
	
	public ArrayList<Entity> getNamePosts(String sem,String sub,String topic,String Name)
	{
		Filter semFilter=af.semFilter(sem,FilterOperator.EQUAL);
		Filter subFilter=af.subFilter(sub,FilterOperator.EQUAL);	
		Filter topicFilter=af.topicFilter(topic,FilterOperator.EQUAL);
		Filter postFilter=af.postFilter("<p>"+Name,FilterOperator.GREATER_THAN_OR_EQUAL);
		Filter post2Filter=af.postFilter("<p>"+Name+"\ufffd",FilterOperator.LESS_THAN_OR_EQUAL);
		int count=0;
		Filter validFilter = CompositeFilterOperator.and(semFilter, subFilter,topicFilter,postFilter,post2Filter);
		Query q = new Query("Post").setFilter(validFilter).addSort("str",
				SortDirection.DESCENDING);
		PreparedQuery pq = ds.prepare(q);
		ArrayList<Entity> result = new ArrayList<Entity>();
		for(Entity xyz:pq.asIterable())
		{
			if(count==10)
			{
				break;
			}
			result.add(xyz);
		}
		return result;
	}

	public ArrayList<Entity> getTagPosts(String sem,String sub,String topic,String tag)
	{
		Filter semFilter=af.semFilter(sem,FilterOperator.EQUAL);
		Filter subFilter=af.subFilter(sub,FilterOperator.EQUAL);	
		Filter topicFilter=af.topicFilter(topic,FilterOperator.EQUAL);
        Filter tagFilter=af.tagFilter(tag,FilterOperator.EQUAL);
		int count=0;
		Filter validFilter = CompositeFilterOperator.and(semFilter, subFilter,topicFilter,tagFilter);
		Query q = new Query("Post").setFilter(validFilter).addSort("time",
				SortDirection.DESCENDING);
		PreparedQuery pq = ds.prepare(q);
		ArrayList<Entity> result = new ArrayList<Entity>();
		for(Entity xyz:pq.asIterable())
		{
			if(count==10)
			{
				break;
			}
			result.add(xyz);
		}
		return result;
	}

	public ArrayList<Entity> getUserPosts(String sem,String sub,String topic,String user_id)
	{
		Filter semFilter=af.semFilter(sem,FilterOperator.EQUAL);
		Filter subFilter=af.subFilter(sub,FilterOperator.EQUAL);	
		Filter topicFilter=af.topicFilter(topic,FilterOperator.EQUAL);
        Filter idFilter=af.idFilter(user_id,FilterOperator.EQUAL);
		int count=0;
		Filter validFilter = CompositeFilterOperator.and(semFilter, subFilter,topicFilter,idFilter);
		Query q = new Query("Post").setFilter(validFilter).addSort("time",
				SortDirection.DESCENDING);
		PreparedQuery pq = ds.prepare(q);
		ArrayList<Entity> result = new ArrayList<Entity>();
		for(Entity xyz:pq.asIterable())
		{
			if(count==10)
			{
				break;
			}
			result.add(xyz);
		}
		return result;
	}
 
	
}	
