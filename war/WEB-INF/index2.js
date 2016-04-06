
function getQueryParameter ( parameterName ) {
  var queryString = window.top.location.search.substring(1);
  var parameterName = parameterName + "=";
  if ( queryString.length > 0 ) {
    begin = queryString.indexOf ( parameterName );
    if ( begin != -1 ) {
      begin += parameterName.length;
      end = queryString.indexOf ( "&" , begin );
        if ( end == -1 ) {
        end = queryString.length
      }
      return unescape ( queryString.substring ( begin, end ) );
    }
  }
  return "null";
}

function init() {
                //Parameters are APIName,APIVersion,CallBack function,API Root 
                gapi.client.load('forumAPI', 'v1', null, 'http://localhost:8888/_ah/api');

document.getElementById("topics_table").onLoad()=function(){
                    ListPosts();
                    }

document.getElementById("add_new_post").onClick()=function(){
    AddNewPost();
    }


}

function ListPosts()
{
     var sem=getQueryParameter("sem");
     var sub=getQueryParameter("sub");
     var topic=getQueryParameter("topic");
     gapi.client.forumAPI.loadPosts(topic,sem,sub).execute(function(resp) {
          if (!resp.code) {
             resp.items = resp.items || [];
             var result = "";
             for (var i=0;i<resp.items.length;i++) {
                 result = result+ "<div id='my_div' class='feed'>" + "tags:";
                 for(var j=0;j<resp.items[i].tag.length;j++){
                 result=result + "<input type='Submit' class='btn' name='btn' class='view' onClick='' value='"  + resp.items[i].tag[j] + " '>"; 	 
                 }
                 result=result + "<br>" + resp.items[i].str + "<input type='Submit' name='btn' class='btn' class='view' onClick='ViewPost()' value='view'></div>"; 
             }
             document.getElementById("nav1").innerHTML = result;
          }
     });
}


function AddNewPost()
{
	var sem=getQueryParameter("sem");
    var sub=getQueryParameter("sub");
    var topic=getQueryParameter("topic");
    var str=document.getElementById("mytextarea").value;
    var tag=document.getelementById("tag").value;
    var user=getQueryParameter("user");
    gapi.client.forumAPI.addPost(user,topic,sem,sub,str,tag).execute(function(resp) {
        if (!resp.code) {
            location.reload();
        }
   });
    
}

function ViewPost(str)
{
	var sem=getQueryParameter("sem");
    var sub=getQueryParameter("sub");
    var topic=getQueryParameter("topic");
    var user=getQueryParameter("user");
    var type="Keyword";
    var search=str;
    gapi.client.forumAPI.getSearchedPost(topic,sem,sub,search,type,user).execute(function(resp) {
        if (!resp.code) {
        	resp.items = resp.items || [];
            var result = "";
            for (var i=0;i<resp.items.length;i++) {
                result = result+ "<div id='my_div' class='feed'>" + "tags:";
                for(var j=0;j<resp.items[i].tag.length;j++){
                    result=result + "<input type='Submit' class='btn' name='btn' class='view' onClick='' value='"  + resp.items[i].tag[j] + " '>"; 	 
                }
                result=result + "<br>" + resp.items[i].str + "<input type='Submit' name='btn' class='btn' class='view' onClick='' value='view'></div>"; 
                rerult=result + "<br>Comments:";
                for(var j=0;j<resp.items[i].comment.length;j++){
                    result=result +  resp.items[i].comment[j]; 	 
                }
               
                result=result + " <p style='float:right'>  Rating :" + resp.items[i].rating + " >/5</p>"
                                + "<input type='hidden' id='count' name='rating' value='0'>"     
                                + "<p>" + resp.items[i].comment_count + "</p>";
            
            }
            document.getElementById("post").innerHTML = result + document.getElementById("post").innerHTML;
        }
    });
}

function addRating()
{
  var reExp = /rating=\\d+/;
  var url = window.location.toString();
  var newUrl = url.replace(reExp, "rating=" + getElementById("count").value);
  window.location.assign(newUrl);
}  
function activate_new_post()
{
  document.getElementById("new_post").style.display="block";
}
function count_increment5()
{
   document.getElementById("count").value="5";
}
function count_increment4()
{
   document.getElementById("count").value="4";
}
function count_increment3()
{
  document.getElementById("count").value="3";
}
function count_increment2()
{
  document.getElementById("count").value="2";
}
function count_increment1()
{
  document.getElementById("count").value="1";
 }
function s1()
{
 document.getElementById("select").value="Latest";
 document.form.submit();
}
function s2()
{
 document.getElementById("select").value="Most Rated";
 document.form.submit();
}
function q1()
{
 document.getElementById("tag_search").style.display="none";
 document.getElementById("user_search").style.display="none";
 document.getElementById("name_search").style.display="block";

}
function q2()
{
 document.getElementById("user_search").style.display="none";
 document.getElementById("name_search").style.display="none";
 document.getElementById("tag_search").style.display="block";
}
function q3()
{
 document.getElementById("tag_search").style.display="none";
 document.getElementById("name_search").style.display="none";	
 document.getElementById("user_search").style.display="block";
}
