<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<!--bootstrap CSS  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	/*website:https://bennettfeely.com/clippy/  */
	clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 91%, 70% 100%, 31% 92%, 0 100%, 0%
		30%);
}
</style>
</head>
<body>

	<%@include file="normal_navbar.jsp"%>

	<main class="primary-background banner-background"
		style="padding-bottom: 80px;">
		<didv class="container">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<!--header  -->
				<div class="card-header text-center primary-background text-white">
					<span class="fa fa-user-circle fa-3x"></span> <br> Register
					here
				</div>
				<!--body  -->
				<div class="card-body">
					<form id="reg-form"
						action="<%=application.getContextPath()%>/registerservlet"
						method="post">
						<div class="form-group">
							<label for="user_name">UserName</label> <input type="text"
								name="user_name" class="form-control" id="user_name"
								aria-describedby="emailHelp" placeholder="Enter username">
						</div>


						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" name="user_email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email"> <small id="emailHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>


						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" name="user_password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>

						<div class="form-group">
							<label for="gender">Gender</label> <br> <input type="radio"
								id="gender" name="gender" value="male">Male <input
								type="radio" id="gender" name="gender" value="female">Female
						</div>

						<div class=form-group>
							<textarea name="about" class="form-control" rows="5" cols=""
								placeholder="Enter something about yourself"></textarea>
						</div>



						<div class="form-check">
							<input type="checkbox" name="check" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">agree terms and conditions</label>
						</div>

						<br>
						<div class="container text-center" id="loader"
							style="display: none;">
							<span class="fa fa-refresh fa-spin fa-4x"></span>
							<h4>Please wait...</h4>
						</div>

						<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>

					</form>
				</div>

			</div>
		</div>
		</didv>
	</main>





	<%@include file="script.jsp"%>

</body>
</html>