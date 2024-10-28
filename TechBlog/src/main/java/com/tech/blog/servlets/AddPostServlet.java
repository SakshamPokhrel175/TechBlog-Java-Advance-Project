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
import java.sql.Connection;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;


@WebServlet("/addpostservlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddPostServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int cid= Integer.parseInt(request.getParameter("cid"));
		String pTitle=request.getParameter("pTitle");
		String pContent=request.getParameter("pContent");
		String pCode=request.getParameter("pCode");
		
		Part part = request.getPart("pic");
		//getting currentUser id
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("currentUser");
		user.getId();
		
//		out.println(pTitle);
//		out.println(part.getSubmittedFileName());
		
		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
		PostDao dao= new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
			
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
//			out.println("Saving file to: " + path); // Debugging

			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
			
			
		}else {
			out.println("error");
		}
		
	}
	

}
