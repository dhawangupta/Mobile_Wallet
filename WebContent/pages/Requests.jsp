<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>
	 
	Requests
	
	<table border="2">
<tr>
<td>RequestID</td>
<td>UserID</td>
<td>Receive</td>
<td>Send</td>
<td>Amount</td>
</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/mobilewallet";
String username="root";
String password="12345";
String query="select * from transactions where id ="+ w.getId();
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    <tr><td><%=rs.getInt("tid") %></td>
    <td><%=rs.getInt("id") %></td>
    <td><%=rs.getInt("receive") %></td>
    <td><%=rs.getInt("send") %></td>
     <td><%=rs.getInt("amount") %></td></tr>
        <%

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }

%>

</body> 