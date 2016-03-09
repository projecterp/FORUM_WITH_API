<%@ page import="java.io.IOException"
import ="java.util.ArrayList"
import ="java.util.Iterator"
import ="com.google.appengine.api.datastore.Entity"
import ="com.google.appengine.api.datastore.PreparedQuery"
import ="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"
import ="querymanager.Query_All"
import ="advance_querymanager.advPostQuery.Adv_QueryManager"
%>

<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>The Posts are...</title>
   <!-- FOR RATING PART-->
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
   <link href="http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
   <!-- END OF RATING PART-->

   <script src="https://cdn.tinymce.com/4/tinymce.min.js" type="text/javascript"></script>

   <script type="text/javascript">
       tinymce.init({
         selector: '#mytextarea'
       });
   </script>

   <script type="text/javascript">
     var timeout = setTimeout("location.reload(true);",300000);
     function resetTimeout() {
       clearTimeout(timeout);
       timeout = setTimeout("location.reload(true);",300000);
     }
   </script>
<!--javascript functions-->
   <script type="text/javascript">
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
	       
</script>

<!--MENU CSS-->

<style>
  #cssmenu,
  #cssmenu ul,
  #cssmenu li,
  #cssmenu a {
    border: none;
    line-height: 1;
    margin: 0;
    padding: 0;
  }
  #cssmenu {
    height: 37px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
    width:447px;
    border-color: #080808;
    margin: 0;
    padding: 0;
    float:none;
  }
  #cssmenu > ul {
    list-style: inside none;
    margin: 0;
    padding: 0;
  }
  #cssmenu > ul > li {
    list-style: inside none;
    float: left;
    display: inline-block;
    position: relative;
    margin: 0;
    padding: 0;
  }
  #cssmenu.align-center > ul {
    text-align: center;
  }
  #cssmenu.align-center > ul > li {
    float: none;
    margin-left: -3px;
  }
  #cssmenu.align-center ul ul {
    text-align: left;
  }
  #cssmenu.align-center > ul > li:first-child > button {
    border-radius: 0;
  }
  #cssmenu > ul > li > a {
    outline: none;
    display: block;
    position: relative;
    text-align: center;
    text-decoration: none;
    text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.4);
    font-weight: 700;
    font-size: 13px;
    font-family: Arial, Helvetica, sans-serif;
    border-right: 1px solid #080808;
    color: #ffffff;
    padding: 12px 20px;
  }
  #cssmenu > ul > li:first-child > a{
    border-radius: 5px 0 0 5px;
  }
  #cssmenu > ul > li > a:after {
    content: "";
    position: absolute;
    border-right: 1px solid;
    top: -1px;
    bottom: -1px;
    right: -2px;
    z-index: 99;
    border-color: #3c3c3c;
  }
  #cssmenu ul li.has-sub:hover > a:after {
    top: 0;
    bottom: 0;
  }
  #cssmenu > ul > li.has-sub > a:before {
    content: "";
    position: absolute;
    top: 18px;
    right: 6px;
    border: 5px solid transparent;
    border-top: 5px solid #ffffff;
  }
  #cssmenu > ul > li.has-sub:hover > a:before {
    top: 19px; 
  }
  #cssmenu > ul > li.has-sub:hover > a{
    padding-bottom: 14px;
    z-index: 999;
    border-color: #3f3f3f;
  }
  #cssmenu ul li.has-sub:hover > ul,
  #cssmenu ul li.has-sub:hover > div {
    display: block; 
  }
  #cssmenu > ul > li.has-sub > a:hover,
  #cssmenu > ul > li.has-sub:hover > a {
    background: #3f3f3f;
    border-color: #3f3f3f;
  }
  #cssmenu ul li > ul,
  #cssmenu ul li > div {
    display: none;
    width: auto;
    position: absolute;
    top: 38px;
    background: #3f3f3f;
    border-radius: 0 0 5px 5px;
    z-index: 999;
    padding: 10px 0;
  }
  #cssmenu ul li > ul {
    width: 200px;
  }
  #cssmenu ul ul ul {
    position: absolute;
  }
  #cssmenu ul ul li:hover > ul {
    left: 100%;
    top: -10px;
    border-radius: 5px;
  }
  #cssmenu ul li > ul li {
    display: block;
    list-style: inside none;
    position: relative;
    margin: 0;
    padding: 0;
  }
  #cssmenu ul li > ul li a {
    outline: none;
    display: block;
    position: relative;
    font: 10pt Arial, Helvetica, sans-serif;
    color: #ffffff;
    text-decoration: none;
    text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.5);
    margin: 0;
    padding: 8px 20px;
  }
  #cssmenu,
  #cssmenu ul ul > li:hover > a,
  #cssmenu ul ul li a:hover {
    background: #3c3c3c;
    background: -moz-linear-gradient(top, #3c3c3c 0%, #222222 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3c3c3c), color-stop(100%, #222222));
    background: -webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
    background: -o-linear-gradient(top, #3c3c3c 0%, #222222 100%);
    background: -ms-linear-gradient(top, #3c3c3c 0%, #222222 100%);
    background: linear-gradient(top, #3c3c3c 0%, #222222 100%);
  }
  #cssmenu > ul > li > a:hover {
    background: #080808;
    color: #ffffff; 
  }
  #cssmenu ul ul a:hover {
    color: #ffffff;
  }
  #cssmenu > ul > li.has-sub > a:hover:before {
    border-top: 5px solid #ffffff;
  }

</style>

<!-- MAIN CSS-->

<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);

body { 
    background:  url("6918865-black-background-wood.jpg") no-repeat fixed center; 
}
p{
   max-height:60px;
   height:auto;
}
div {
    padding: 15px;
}
#header {
    background-color:black;
    color:white;
    text-align:center;
    width:auto;
    height:60px;
}
#nav1 {
    height:300px;
    width:100px;
    float:left;	      
}
#section {
    width:880px;
    height:490px;
    content-align:center;
    float:left;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    width:auto;
    height:20px;
    text-align:center;
    padding:0px;	 	 
}

input[type=submit].view {
    margin: 0;
    border: 0;
    background: transparent;
    color: blue;
    text-decoration: underline;
    cursor: pointer;
    overflow: visible;
}
.btn {
  border-radius: 4px;
  cursor: pointer;
  display: inline-block;
  font-size: 10px;
  margin: 18px 0 0 0;
  padding: 5px 14px;
  text-decoration: none;
  background-color:lightblue;
}

textarea {
  border: 1px solid #BDBDBD;
  border-radius: 3px;
  box-shadow: 0 0 2px #d8d8d8;
  display: block;
  height: 100px;
  margin: 16px 0 0 0;
  padding: 10px;
  width: 280px;
}

.feed {
  background: #fff;
  border: 1px solid #BDBDBD;
  border-radius: 3px;
  box-shadow: 0 0 2px #d8d8d8;
  margin: 10px 0 10px 0;
}

</style>

<!--RATING CSS-->


<style>

 * {
    margin: 0;
    padding: 0;
    font-family: roboto;
   }

  div.stars {
    width: 150px;
    display: inline-block;
  }
  
  input.star { display: none; }
  
  label.star {
    float: right;
    padding: 10px;
    font-size: 20px;
    color: #444;
    transition: all .2s;
  }

  input.star:checked ~ label.star:before {
    content: '\f005';
    color: #FD4;
    transition: all .25s;
  }

  input.star-5:checked ~ label.star:before {
    color: #FE7;
    text-shadow: 0 0 20px #952;
  }

  input.star-1:checked ~ label.star:before { color: #F62; }

  label.star:hover { transform: rotate(-15deg) scale(1.3); }

  label.star:before {
    content: '\f006';
    font-family: FontAwesome;
}

</style>

</head>

<!-- JSP CODE-->

<body>
  <div id="header">
     WELCOME TO Virtual ClassRoom<br>
  <form action="adv_query" method="get" name="form">
    <input type="hidden" name="flag" id="flag" height="0px" value="show">
    <input type="hidden" name="rating" height="0px" value="0">
    <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
    <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
    <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">
    <div id='cssmenu'>
    <ul>
       <li><a href='#' onClick="document.form.submit();"><span>Home</span></a></li>
       <li class='active has-sub'><a href='#'><span>Filters</span></a>
         <ul> 
            <input type="hidden" name="select" id="select" value="">
            <li class='has-sub'><a href='#' onClick="s1()"><span>Latest</span></a>
            </li>
            <li class='has-sub'><a href='#' onClick="s2()"><span>Most Rated</span></a>
            </li>
         </ul>
       </li>
   
       <li class='active has-sub'><a href='#'><span>Custom Search</span></a>
         <ul>
           <li class='has-sub'><a href='#' onClick="q1()"><span>By Name</span></a>
           </li>
           <li class='has-sub'><a href='#' onClick="q2()"><span>By Tag</span></a>
           </li>
           <li class='has-sub'><a href='#' onClick="q3()"><span>By User Name</span></a>
              <ul>
                <li><a href='#' onClick="document.form.submit();"><span>Sub Product</span></a></li>
                <li class='last'><a href='#' onClick="document.form.submit();"><span>Sub Product</span></a></li>
              </ul>
           </li>
         </ul>
       </li>
       <li><a href='#' onClick="document.form.submit();"><span>About</span></a></li>
       <li class='last'><a href='#' onClick="document.form.submit();"><span>Contact</span></a></li>
    </ul>
    </div><!-- cssmenu-->
  </form>
  </div><!--header-->


  <div id="nav1" style="width:400px;height:490px;overflow:auto;background-color:lightgrey;" class="feed">
    <strong>
    <font color="red">
    <p>Your posts are:-</p>
    </font>
    </strong>
    <%
        Query_All query=new Query_All();
        String topic;  
        topic=request.getParameter("topic");     
        PreparedQuery pq =query.getPosts(request.getParameter("sub"),request.getParameter("sem"),topic);
        for (Entity result : pq.asIterable()) {	
    %>			
          <div id="my_div" class="feed">
            <form action="tag" method="get">
            tags:
    <%
            ArrayList<String> tag=new ArrayList();
            tag=(ArrayList)result.getProperty("tag");
            for(String str:tag)
            {
    %> 
              <input type="Submit" class="btn" name="btn" class="view" value="<%=str%>">
    <%
            }
    %>
              <input type="hidden" name="time" height="0px" value="<%=result.getProperty("time")%>">
              <input type="hidden" name="flag" height="0px" value="true">
              <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
              <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
              <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
              <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">

              <p><%=result.getProperty("str")%></p>
              <input type="Submit" name="btn" class="btn" class="view" value="view">
            </form>  
          </div><!--my_div-->
    <%
        }
    %>
    <br>    
  </div><!--nav1-->
  
  
  <div id="section" style="overflow:auto;background-color:grey;" class="feed">
    <form action="forum_v1" method="get">
    
        <input type="hidden" name="flag"height="0px" value="false">
        <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
        <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
        <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
        <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">

        <input type="button" class="btn" value="ADD NEW POST" onClick="activate_new_post()">

     <div id="new_post" style="display:none;background-color:none;width: 800px;" class="feed">
       <p>NEW POST:-</p>
       <p><textarea id="mytextarea" name="post">Hello World!</textarea></p>
       <br><br><br><br><br><br><br><br><br><br>
       <p>tags:<input type="text" name="tag"></p>
       <p><input type="Submit" name="btn" class="btn" value="ADD POST"></p>
     </div>
    </form>

    <form id="1" action="tag" method="get">
        <input type="hidden" name="flag" height="0px" value="search">
        <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
        <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
        <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
        <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">
        
        <div id="name_search" style="display:none">
          <input type="hidden" name="search_type" value="Name">
          Keyword:<input type="search" name="search">
          <input type="Submit" name="btn" class="btn" value="Find">
        </div>
    </form>
    <form id="2" action="tag" method="get">
        <input type="hidden" name="flag" height="0px" value="search">
        <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
        <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
        <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
        <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">
            
        <div id="tag_search" style="display:none">
          <input type="hidden" name="search_type" value="Tag">
          Tag:<input type="search" name="search">
          <input type="Submit" name="btn" class="btn" value="Find">
        </div>
    </form>    
    <form id="3" action="tag" method="get">
        <input type="hidden" name="flag" height="0px" value="search">
        <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
        <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
        <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
        <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">
        
        
        <div id="user_search" style="display:none">
          <input type="hidden" name="search_type" value="User">
          User_name:<input type="search" name="search">
          <input type="Submit" name="btn" class="btn" value="Find">
        </div>        
    </form>     
    
    <% if(request.getParameter("flag").equals("true"))
       {
    %>
         <div id="post" style="background-color:none" class="feed">
         <form action="tag" method="get">
    <%
         Entity result=query.getPostByTime(request.getParameter("time"),request.getParameter("sem"));
         ArrayList<String> tag=new ArrayList();
         tag=(ArrayList)result.getProperty("tag");
         for(String str:tag)
         {
    %>
            
             <input type="Submit" class="btn" name="btn" value="<%=str%>">    
    <%
         }
    %>
         <p><%=result.getProperty("str")%></p>
         <br>
    <%
         ArrayList<String> comments =(ArrayList<String>)result.getProperty("comment");  
         for(String cmnt:comments)
         { 
    %>   
           <p><%=cmnt%></p>
    <%
         } 
    %>
         <p style="float:right">Rating : <%=result.getProperty("rating")%>/5</p>
         <input type="hidden" id="count" name="rating" value="0">     
         <p><%=result.getProperty("comment_count")%>comments</p>   
   
         <input class="star star-5" id="star-5-2" type="radio" onclick="count_increment5()" name="star"/>
         <label class="star star-5" for="star-5-2"></label>
         <input class="star star-4" id="star-4-2" type="radio" onclick="count_increment4()" name="star"/>
         <label class="star star-4" for="star-4-2"></label>
         <input class="star star-3" id="star-3-2" type="radio" onclick="count_increment3()" name="star"/>
         <label class="star star-3" for="star-3-2"></label>
         <input class="star star-2" id="star-2-2" type="radio" onclick="count_increment2()" name="star"/>
         <label class="star star-2" for="star-2-2"></label>
         <input class="star star-1" id="star-1-2" type="radio" onclick="count_increment1()" name="star"/>
         <label class="star star-1" for="star-1-2"></label>
  
         <br>      
         <p><input type="Submit" class="btn" name="btn" value="rate" style="float:right"></p>   
         <br>
         <textarea  name="comment"></textarea><br>
         <br>

         <input type="hidden" name="time" height="0px" value="<%=result.getProperty("time")%>">
         <input type="hidden" name="sem"  height="0px" value="<%=request.getParameter("sem")%>">
         <input type="hidden" name="sub"  height="0px" value="<%=request.getParameter("sub")%>">
         <input type="hidden" name="flag" height="0px" value="true">
         <input type="hidden" name="topic"  height="opx" value="<%=topic%>"> 
         <input type="Submit" name="btn" class="btn" value="PostComment">
         </form>
         </div><!--post-->     
    <%
       }
    %>

    <%
        Adv_QueryManager aq = new Adv_QueryManager();
        ArrayList<Entity> temp=new ArrayList<Entity>();

        if(request.getParameter("flag").equals("show"))
        {  
          String sem=request.getParameter("sem");
          String sub=request.getParameter("sub");
          String topic_str=request.getParameter("topic");
          if(request.getParameter("select").equals("Latest"))
          {
            temp=(ArrayList<Entity>)aq.getLatestPosts(sem,sub,topic_str);
          }
          if(request.getParameter("select").equals("Most Rated"))
          {
            temp=(ArrayList<Entity>)aq.getMostRatedPosts(sem,sub,topic_str);
          }
    %>
          <p>Your posts are:-</p>
    <%          
          for (Entity result :temp) 
          {	
    %>
            <div id="my_div" class="feed">
            <form action="tag" method="get">
              tags: 
    <%
              ArrayList<String> tag=new ArrayList();
              tag=(ArrayList)result.getProperty("tag");
              for(String str:tag)
              {
    %> 
                <input type="Submit" class="btn" name="btn" class="view" value="<%=str%>">
    <%
              }
    %>
              <input type="hidden" name="time" height="0px" value="<%=result.getProperty("time")%>">
              <input type="hidden" name="flag" height="0px" value="true">
              <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
              <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
              <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
              <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">

              <p><%=result.getProperty("str")%></p> 
              <input type="Submit" name="btn" class="btn" class="view" value="view">
            </form> 
            </div><!--my_div-->
    <%
          } 
        }
    %>


    <%
        if(request.getParameter("flag").equals("search"))
        {
          if(request.getParameter("search_type").equals("Name"))
          {
            temp=(ArrayList<Entity>)aq.getNamePosts(request.getParameter("sem"),request.getParameter("sub"),request.getParameter("topic"),request.getParameter("search"));
          }
          else if(request.getParameter("search_type").equals("Tag"))
          {
            temp=(ArrayList<Entity>)aq.getTagPosts(request.getParameter("sem"),request.getParameter("sub"),request.getParameter("topic"),request.getParameter("search"));
          }
          else
          {
            temp=(ArrayList<Entity>)aq.getUserPosts(request.getParameter("sem"),request.getParameter("sub"),request.getParameter("topic"),request.getParameter("search"));
          }
    %>
          <p>Your posts are:-</p>
    <%     
          for (Entity result :temp) 
          {	
    %>
            <div id="my_div" class="feed">
            <form action="tag" method="get">
              tags: 
    <%
              ArrayList<String> tag=new ArrayList();
              tag=(ArrayList)result.getProperty("tag");
              for(String str:tag)
              {
    %> 
                <input type="Submit" class="btn" name="btn" class="view" value="<%=str%>">
    <%
              }
    %>
              <input type="hidden" name="time" height="0px" value="<%=result.getProperty("time")%>">
              <input type="hidden" name="flag" height="0px" value="true">
              <input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
              <input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
              <input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
              <input type="hidden" name="topic" value="<%=request.getParameter("topic")%>">

              <p><%=result.getProperty("str")%></p> 
              <input type="Submit" name="btn" class="btn" class="view" value="view">
            </form> 
            </div><!--my_div-->
    <%
          } 
        }
    %>
  </div><!--section-->
<div id="footer">
Copyright © ProjectERP
</div>
</body>
</html>