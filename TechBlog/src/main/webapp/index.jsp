<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Index Page</title>
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
	/* Responsive Styling */
	@media (max-width: 768px) {
		.jumbotron h3.display-3 {
			font-size: 2rem;
		}
		.jumbotron p {
			font-size: 0.875rem;
		}
		.jumbotron .btn {
			font-size: 0.875rem;
			padding: 0.5rem 1rem;
		}
		.card-title {
			font-size: 1rem;
		}
		.card-text {
			font-size: 0.875rem;
		}
		.container {
			padding: 0 1rem;
		}
	}
	@media (max-width: 576px) {
		.jumbotron h3.display-3 {
			font-size: 1.75rem;
		}
		.jumbotron p {
			font-size: 0.8rem;
		}
		.jumbotron .btn {
			font-size: 0.75rem;
		}
		.card-title {
			font-size: 0.875rem;
		}
		.card-text {
			font-size: 0.75rem;
		}
	}
</style>
</head>
<body>
	<!--NavBar  -->
	<%@ include file="normal_navbar.jsp"%>

	<!--Banner  -->
	<div class="container_fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Tech Blog</h3>
				<h3></h3>
				<p>Welcome to technical blog, world of technology A programming language is a system of notation for writing computer programs.[1] Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables, and mechanisms for error handling.</p>
				<p>Computer architecture has strongly influenced the design of programming languages, with the most common type (imperative languages—which implement operations in a specified order) developed to perform well on the popular von Neumann architecture. Over time they have developed more abstraction for greater simplicity.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span> Start! It's Free
				</button>
				<a href="<%=application.getContextPath()%>/login_page.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<!--Cards  -->
	<div class="container">
		<!-- Row 1 -->
		<div class="row mb-2">
			<!-- Card 1 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
			<!-- Card 2 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Python Programming Language</h5>
						<p class="card-text">Explore more about the versatile Python language and its wide range of uses in modern technology.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
			<!-- Card 3 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">JavaScript Programming Language</h5>
						<p class="card-text">Learn about JavaScript, the language of the web, and how it powers dynamic user experiences.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Row 2 -->
		<div class="row">
			<!-- Card 4 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">C++ Programming Language</h5>
						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
			<!-- Card 5 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Ruby Programming Language</h5>
						<p class="card-text">Learn how Ruby offers simplicity and productivity in application development.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
			<!-- Card 6 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Swift Programming Language</h5>
						<p class="card-text">Explore Swift, Apple's powerful and intuitive programming language for macOS and iOS applications.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="script.jsp"%>
</body>
</html>
