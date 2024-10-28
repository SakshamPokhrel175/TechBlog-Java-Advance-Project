package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/loginsevlet")
public class LoginSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginSevlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// fetch username and password from request
		PrintWriter out = response.getWriter();

		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");

		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		if (u == null) {
			// login.........
			// error
//			out.println("Invalid Details..try again");
			Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		} else {
			// login Success
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}
	}

}
