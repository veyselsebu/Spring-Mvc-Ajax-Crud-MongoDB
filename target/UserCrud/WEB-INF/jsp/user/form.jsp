<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USer</title>
</head> 
<body>
<spring:url value="/user/save/" var="saveUrl"/>
<form:form action="/user/save" modelAttribute="userForm" method="POST">
<label>name : </label>
<form:input path="name"/><br/>
<button type="submit">save</button>
</form:form>
</body>
</html>