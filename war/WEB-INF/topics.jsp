<%@ page import="java.io.IOException"
import ="java.util.ArrayList"
import ="java.util.Iterator"
import ="com.google.appengine.api.datastore.Entity"
import ="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"
import ="querymanager.Query_All"
import ="com.google.appengine.api.users.User"
import ="com.google.appengine.api.users.UserService"
import ="com.google.appengine.api.users.UserServiceFactory"

%>

<script type="text/javascript">
function activate_new_topic()
{
   document.getElementById("new_topic").style.display="block";
}
</script>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script>
 var color_array=["info","success","warning","danger","active"];
</script>

<script>

function init() {
                //Parameters are APIName,APIVersion,CallBack function,API Root 
                gapi.client.load('forumAPI', 'v1', null, 'http://localhost:8888/_ah/api');

document.getElementById("topics_table").onLoad()=function(){
                    ListTopics();
                    }
}

function ListTopics()
{
    var requestData = {};
                requestData.sem ="fourth";
                requestData.sub ="daa";
                
     gapi.client.forumAPI.loadTopics("fourth","daa").execute(function(resp) {
                        if (!resp.code) {
                                resp.items = resp.items || [];
                                var result = "";
                                for (var i=0;i<resp.items.length;i++) {
                                        result = result+ "<tr id='tr' class='active'>" +"<td>" + (i+1) + "</td>" + "<td style='text-align:left'><input type='Submit' name='topic' height='10' style='width:auto' class='view' value='" + resp.items[i].topic + "'>"
                                        + "</td>"
                                        +"<td>" + resp.items[i].time +"</td></tr>";  
                                }
                                document.getElementById('sample').innerHTML = result;
                        }
                });
}

</script>                  
                  
                  

<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/cosmo/bootstrap.min.css" >
<title>The Topics are...</title>
<style>
input[type=submit].view {
    margin: 0;
    border: 5px;
    background:transparent;
    color: black;
    width:100px;
    height:30px;
    text-decoration: underline;
    cursor: pointer;
    overflow: visible;
}

@charset "utf-8";

*{
	margin:0px;
	padding:0px;
}

body{

 background:  url("img/2.jpg") no-repeat fixed center; 
 margin-top:0px;
 margin-left:0px;
}


#menu ul{
	list-style:none;	
}

#menu ul li{
	background-color:black;
	border-radius:10px;
	border:1px solid grey;
	width:160px;
	height:50px;
	line-height:15px;
	text-align:center;
	float:left;
	position:relative;
	padding:10;
}

#menu ul li a{
	text-decoration:none;
	color:white;
	display: block;
    padding:10;
}


#menu ul li a:hover{
	background-color:grey;
	color:#0000CD;
    border-radius:8px;
}

#menu ul ul
{
	position:absolute;
	display:none;
	
}
#menu ul li:hover > ul
{
	display:block;
}

#header {
    background-color:black;
    color:white;
    text-align:center;
    font-size:40;
    width:auto;
    height:auto;
    padding:20px;
    border: 1px solid #BDBDBD;
    border-radius: 3px;
    box-shadow: 0 0 2px #d8d8d8;
}

#nav {
    height:auto;
    width:800px;
    float:left;
    margin-left:33px;	      

}
#section {
    width:100px;
    height:auto;
    content-align:center;
    float:left;
    margin-left:100px;
    padding:15px;	 	 
}

#footer {
    background-color:black;
    color:white;
    clear:both;
    width:auto;
    height:40px;
    text-align:center;
    padding:5px;
    margin-bottom:0;	 	 
    border: 1px solid #BDBDBD;
    border-radius: 3px;
    box-shadow: 0 0 2px #d8d8d8;
}

textarea {
  border: 1px solid #BDBDBD;
  border-radius: 3px;
  box-shadow: 0 0 2px #d8d8d8;
  color:black;
  display: block;
  height: 50px;
  margin: 16px 0 0 0;
  padding: 10px;
  width: 280px;
}

.btn {
  border-radius: 4px;
  cursor: pointer;
  display: inline-block;
  font-size: 20px;
  margin: 18px 0 0 0;
  padding: 5px 14px;
  text-decoration: none;
  background-color:lighgrey;
}

#nickname{
 align="right";
 margin-right:25px;
 color:#F9CCCA;
}
.circle
{
width:50px;
height:50px;
border-radius:50%;
font-size:20px;
color:#fff;
line-height:50px;
text-align:center;
background:#000;
float:right;
margin-right:30px;
box-shadow: inset 0 0 10px 0 #999;
}


</style>

</head>

<body>
<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

String var=user.getNickname();
int index=var.indexOf("@");
String start=var.substring(0,1);
if(index!=-1)
{var=var.substring(0,index);}

%>

<div id="header">
    WELCOME TO Virtual ClassRoom
<div class="circle" style="text-transform:uppercase"><b><%=start%></p></b></div>
<font size="5" color="white" align="right">
<div id="nickname"><%=var%></div>
</font>
</div>


<input type="hidden" size="0" name="flag" value="false">
<input type="hidden" size="0" name="rating" value="0">
<input type="hidden" size="0" name="sem" value="<%=request.getParameter("sem")%>">
<input type="hidden" size="0" name="sub" value="<%=request.getParameter("sub")%>">


<div style="float:right">
 <form action="forum_v1" method="get" class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" name="search" class="form-control" placeholder="Search">
          <input type="hidden" size="0" name="flag" value="false">
          <input type="hidden" size="0" name="rating" value="0">
          <input type="hidden" size="0" name="sem" value="<%=request.getParameter("sem")%>">
          <input type="hidden" size="0" name="sub" value="<%=request.getParameter("sub")%>">

        </div>
        <button type="submit" name="btn" class="btn btn-default" style="background-color:lightgrey;color:blue;" value="Search">Search</button>
 </form>
 </div>
 <br>     
<strong>
<font color="lightgrey" size="5">
<div style="margin-left:33px">
<br>
<br>
<p>Your Topics are:-</p>
</div>
</font>
<form action="forum_v1" method="get">
<form action="javascript:void(0);">
<div id="table">
<table class="table table-striped table-hover" style="width:800px;">
  <thead>
    <tr class="warning">
      <th>#</th>
      <th>Topic Name</th>
      <th>Date Added</th>
    </tr>
  </thead>
  <div id="topics_table">
  </div>
  <tbody>
  </tbody>
</table>
</div>
</form>
<div id="nav">
<%
if(request.getParameter("btn").equals("Search"))
{
      temp=query.getSearchedTopics(request.getParameter("sem"),request.getParameter("sub"),request.getParameter("search"));		   
		  for(Entity xyz:temp)
		  {  
%>
    <tr id="tr1" class="active">
      <td><%=i%></td>
      <td><input type="Submit" name="btn" style="width:auto" height="10" class="view" value="<%=xyz.getProperty("topic")%>"></td>
      <td><%=xyz.getProperty("time")%></td>
    </tr>
<script>
var i = 0||i;
$('#id td1').attr('id', function(i) {
   return 'id'+(i+1);
});
</script>    
<%
i++;
}   
} 
%>


  </tbody>
</table> 
</div>
<div id="section" style="color:white">
<input class="btn" type="button" style="color:blue" value="NEW TOPIC" onClick="activate_new_topic()">
<div id="new_topic" style="display:none;">
<br>
<textarea  name="topic_str"></textarea>
<br>
<br>
<input type="hidden" size="0" name="flag" value="false">
<input type="hidden" size="0" name="rating" value="0">
<input type="hidden" size="0" name="search" value="">
<input type="hidden" size="0" name="sem" value="<%=request.getParameter("sem")%>">
<input type="hidden" size="0" name="sub" value="<%=request.getParameter("sub")%>">
<input class="btn" type="Submit" name="btn" style="color:blue" value="ADD NEW TOPIC">
</div>
</div>
</div>
<!--<div id="footer">
Copyright © ProjectERP
</div>
-->
</form>
</body>
</html>