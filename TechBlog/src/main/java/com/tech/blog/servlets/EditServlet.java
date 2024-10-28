package com.tech.blog.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@WebServlet("/editservlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

//		fetch all data
		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user-about");

//		for profile fetch
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();

//		get the user from the session
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile = user.getProfile();
		user.setProfile(imageName);

		// Update user in the database
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.updateUser(user);

		if (ans) {
			// Use ServletContext to get the real path
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/") + "pics" + File.separator + user.getProfile();

//		    delete code
			String pathOldFile = context.getRealPath("/") + "pics" + File.separator + oldFile;
			if (!oldFile.equals("default.png")) {

				Helper.deleteFile(pathOldFile);
			}

			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("Profile Updated...");

				Message msg = new Message("Profile details updated...", "success", "alert-success");
				s.setAttribute("msg", msg);
				// Optionally, you can write the file to this path if needed
				out.println("Updated to Database. File path: " + path);
				System.out.println("Updated to Database. File path: " + path);

			}

		} else {
			out.println("Not Updated..");

			Message msg = new Message("Something went wrong", "error", "alert-danger");
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");

	}

}
