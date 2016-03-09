package advance_querymanager.advPostQuery;

import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class AdvFilter {

	public Filter tagFilter(String tag, FilterOperator op) {
		return new FilterPredicate("tag", op, tag);
	}
	
	public Filter postFilter(String post, FilterOperator op) {
		return new FilterPredicate("str", op, post);
	}

	public Filter idFilter(String user_id, FilterOperator op) {
		return new FilterPredicate("user_id", op, user_id);
	}

	public Filter timeFilter(String time, FilterOperator op) {
		return new FilterPredicate("time", op, time);
	}

	public Filter ratingFilter(String rating, FilterOperator op) {
		return new FilterPredicate("rating", op, Double.parseDouble(rating));
	}

	public Filter semFilter(String sem, FilterOperator op) {
		return new FilterPredicate("sem",op, sem);
	}

	public Filter subFilter(String sub, FilterOperator op) {
		return new FilterPredicate("sub", op, sub);
	}

	public Filter topicFilter(String topic, FilterOperator op) {
		return new FilterPredicate("topic", op, topic);
	}

	public Filter rating_countFilter(String rating_count, FilterOperator op) {
		return new FilterPredicate("rating_count", op, Long.parseLong(
				rating_count, 10));
	}
}
