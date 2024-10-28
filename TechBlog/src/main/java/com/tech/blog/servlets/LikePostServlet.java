package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/likepostservlet")
public class LikePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LikePostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();

	    String operation = request.getParameter("operation");
	    int uid = Integer.parseInt(request.getParameter("uid"));
	    int pid = Integer.parseInt(request.getParameter("pid"));

//      out.println("data from server");
//      out.println(operation);
//      out.println(uid);
//      out.println(pid);
      LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
      if (operation.equals("like")) {
          boolean f=ldao.insertLike(pid, uid);
          out.println(f);
	    }
	}


}
