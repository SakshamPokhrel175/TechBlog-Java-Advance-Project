package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/registerservlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handle GET requests if needed
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String check = request.getParameter("check");

		if (check == null) {
			out.println("Checkbox not checked.");
		} else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			// Create a user object
			User user = new User(name, email, password, gender, about);

			// Create user DAO object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if (dao.saveUser(user)) {
				// Instead of returning HTML, return a simple 'done' message
				out.println("done");
			} else {
				// In case of an error, return a specific error message
				out.println("Error during registration.");
			}

		}
	}
}
