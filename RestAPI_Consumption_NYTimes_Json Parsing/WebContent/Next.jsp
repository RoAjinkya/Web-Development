<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONObject"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
</head>
<body>
<form action="SearchServlet">
 
 <h2>Search the particular news</h2> 
 Search parameter
 <input type="text" id="Param" name="param">
<input type="submit" value="Search">
</form>
<hr>

<h1><b>Related News</b></h1><br>

<%
    JSONObject json = new JSONObject();
    json = (JSONObject)request.getAttribute("obj");
   
   JSONObject json1 = new JSONObject(); 
   for(int i=0;i<json.length() ;i++)
   {
	   json1 =(JSONObject) json.getJSONArray("docs").get(i);
	 %>
	 <b>Sourse of The News :
	
	 <%  
	   out.println(json1.get("source").toString());
	  %>
	  &nbsp;&nbsp; Published Date :
	  <%
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
	   Date date = formatter.parse(json1.get("pub_date").toString().replaceAll("Z$", "+0000"));
	   out.println(date);
	   out.print("<br>");
	    JSONObject json2 = new JSONObject(); 
	    json2 =(JSONObject) json1.getJSONObject("headline");
	 %>
	 <h2><%
	 out.print(json2.get("main").toString());
	// out.print(json2.get("print_headline").toString());
		%>
		
		</h2><p><%
	    out.println("<br>");
	   
       out.println(json1.get("snippet").toString());
	   out.print("</b><br>");
	   out.println(json1.get("lead_paragraph").toString());
	   out.print("</b><br>");
	    out.println(json1.get("abstract").toString());
	    
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