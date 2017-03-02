<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
.center {
    margin: auto;
    width: 30%;
    border: 3px solid #73AD21;
    padding: 10px;
}
h3{
 margin: auto;
    width: 30%;
}
</style>
<title>First Jsp</title>
</head>
<body>
<h3>Personal Information</h3>
<table frame="box" class="center">
<tr><td>
First name</td><td> <%= request.getParameter("firstName") %></td></tr>
<tr><td>
Middle Name</td><td><%= request.getParameter("middleName") %></td></tr>
<tr><td>
Last Name</td><td><%= request.getParameter("lastName") %></td></tr>
<tr><td>
Gender</td><td><%= request.getParameter("gender") %></td></tr>
<tr><td>
Date of Birth</td><td><%= request.getParameter("dateOfBirth") %></td></tr>
<tr><td>
Address</td><td><%= request.getParameter("address") %></td></tr>
<tr><td>
City</td><td><%= request.getParameter("city") %></td></tr>
<tr><td>
State</td><td><%= request.getParameter("state") %></td></tr>
<tr><td>
Pin</td><td><%= request.getParameter("pin") %></td></tr>

</table>
</body>
</html>