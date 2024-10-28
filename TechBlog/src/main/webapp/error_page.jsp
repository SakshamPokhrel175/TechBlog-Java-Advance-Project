<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry ! Something went wrong...</title>
<!--bootstrap CSS  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.banner-background{
		/*website:https://bennettfeely.com/clippy/  */
		 	clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 91%, 70% 100%, 31% 92%, 0 100%, 0% 30%);
}
</style>
</head>
<body>
<div class="container text-center" >	
<img src="img/warning.png" class="img-fluid">
<h3 class="display-3">Sorry ! Something went wrong...</h3>
 <%= exception%>
<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
</div>
</body>
</html>