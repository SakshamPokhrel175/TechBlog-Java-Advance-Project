<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getpTitle()%> || TechBlog by Saksham</title>
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

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.post-user-info {
	font-size: 20px;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding-top: 15px;
}

body {
	background-image: url(img/bg-image.jpg);
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
}
</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v5.0">
</script>

</head>
<body>

	<!--Starting of NavBar  -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand"
			href="<%=application.getContextPath()%>/index.jsp"><samp
				class="fa fa-asterisk"></samp>TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<%=application.getContextPath()%>/profile.jsp"><samp
							class="fa fa-home"></samp> Home <span class="sr-only">(current)</span></a>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-list-alt"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-card-o"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span> Do Post</a></li>
			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle "></span> <%=user.getName()%>
				</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=application.getContextPath()%>/logoutservlet"><span
						class="fa fa-user-plus"></span> Logout</a></li>
			</ul>

		</div>
	</nav>

	<!--End of NavBar  -->



	<!--Main Content of Body Start  -->



	<div class="container">
		<div class="row my-4">

			<div class="col-md-8 offset-md-2">
				<div class="card">

					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%=p.getpTitle()%></h4>

					</div>

					<div class="card-body">
						<img class="card-img-top my-2"
							src="<%=application.getContextPath()%>/blog_pics/<%=p.getpPic()%>"
							alt="Card image cap">


						<div class="row my-3 row-user">
							<div class="col-md-8">
								<%
								UserDao ud = new UserDao(ConnectionProvider.getConnection());
								%>
								<p class="post-user-info">
									<a href="#!"><%=ud.getUserByUserId(p.getUserId()).getName()%></a>
									has posted:
								</p>
							</div>

							<div class="col-md-4">
								<p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getpDate())%>
								</p>
							</div>

						</div>

						<p class="post-content"><%=p.getpContent()%></p>
						<br> <br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>

					</div>

					<div class="card-footer primary-background text-center">
					
					<%
					LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
					
					%>
					
						<a href="#" onclick="doLike(<%=p.getPid()%>, <%=user.getId()%>)"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=ld.countLikeonPost(p.getPid()) %></span></a> <a href="#"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"></i> <span>20</span></a>
					</div>
					
			
					
				</div>
			</div>
		</div>
	</div>












	<!--Main Content of Body End  -->



























	<!--Start Profile Model -->



	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!--Details  -->

						<div id="profile-details">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getRegister_date().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>



						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="<%=application.getContextPath()%>/editservlet"
								method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>">
										</td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Status:</td>
										<td><textarea rows="3" class="form-control"
												name="user-about"><%=user.getAbout()%>
										</textarea></td>
									</tr>
									<tr>
										<td>Update Profile:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>

						</div>


					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>


	<!--ENd of Profile Model -->




	<!--Start Post Modal  -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="addpostservlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title"
								class="form-control" />
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 200px;" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control"
								style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic..</label> <br> <input type="file"
								name="pic">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post
							</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>


	<!--END add post modal-->





	<!--End Post Modal  -->







	<%@include file="script.jsp"%>
</body>
</html>