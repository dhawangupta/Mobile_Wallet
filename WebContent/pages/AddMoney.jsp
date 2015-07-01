<%@page import="com.psl.model.AddMoney"%>
<%@page import="javax.swing.JCheckBox"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>

<div>
Balance : 
</div>

<div>
<%
com.psl.model.Wallet w = (com.psl.model.Wallet)session.getAttribute("w");
if(w!=null){
out.println(w.getBalance());
}
%>
</div>

<div>
Add Money :
</div>

<div>
<%
out.println(((com.psl.model.AddMoney)(session.getAttribute("a"))).getAmount());
%>
</div>











</body> 
</html>