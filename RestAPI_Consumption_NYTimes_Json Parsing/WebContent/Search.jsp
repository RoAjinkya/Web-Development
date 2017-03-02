<%@page import="edu.neu.csye6220.util.Driver"%>
<%@page import="org.json.JSONObject"%>
<%@page import= "java.text.SimpleDateFormat"%>

<%@page import= "java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
</head>
<body style="text-align: center;">

<form action="SearchServlet">
 
 <h2>Search the particular news</h2> 
 Search parameter
 <input type="text" id="Param" name="param">
<input type="submit" value="Search">
</form>
<hr>
<%
Driver driver = new Driver();
JSONObject json = new JSONObject();
json = driver.GetResponse("");
//out.println(json.get("response").toString());
JSONObject json1 = new JSONObject();

json1 = (JSONObject)json.get("response");
JSONObject json2 = new JSONObject(); 
for(int i=0;i<= json1.length() ;i++)
{
	   json2 =(JSONObject) json1.getJSONArray("docs").get(i);
	   //getJSONArray("docs").get(i);
	   
	   %>
		 <b>Sourse of The News :
		 <%  
		   out.println(json2.get("source").toString());
		  %>
		 
		  &nbsp;&nbsp;Published Date :
	  <%
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
	   Date date = formatter.parse(json2.get("pub_date").toString().replaceAll("Z$", "+0000"));
	   out.println(date);
	  // out.println(" d"+json2.get("pub_date").toString());
	   out.print("<br>");
	    JSONObject json3 = new JSONObject(); 
	    json3 =(JSONObject) json2.getJSONObject("headline");
	 %>
	 <h2><%
	    out.print(json3.get("main").toString());
		%>
		
		</h2><p><%
	    out.println("<br>");
	   
       out.println(json2.get("snippet").toString());
	   out.print("</b><br>");
	   out.println(json2.get("lead_paragraph").toString());
	   out.print("</b><br>");
	    out.println(json2.get("abstract").toString());
	    
	    out.println("<br><br>");
	    %><hr></p>
	    <% 
   }
   /* json1 =(JSONObject) json.getJSONArray("docs").get(0);
   
    out.print(json1.get("snippet").toString());
    */ //JsonParser().parse(request.getAttribute("obj").toString()).getAsJsonObject();
    out.flush();
%>


 

</body>
</html>