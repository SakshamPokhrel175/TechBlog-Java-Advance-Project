package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	
	Connection connection ;

	public PostDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category>list=new ArrayList<>();
		
		
			try {
				
				String q= "select * from categories";
				Statement st = this.connection.createStatement();
				ResultSet set = st.executeQuery(q);
				
				while(set.next()) {
					int cid=set.getInt("cid");
					String name=set.getString("name");
					String description=set.getString("description");
					Category c= new Category(cid , name , description);
					list.add(c);
					
				}
				
				
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		
		
		
		return list;
		
	}
	
	
	
	public boolean savePost(Post p) {
		boolean f=false;
		
		
		try {
			String q="INSERT INTO posts (pTitle, pContent, pCode, pPic, catId, userId) values (? , ? , ? , ? , ? , ?)";
			PreparedStatement pstmt=connection.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	
	
	//get all the post
	public List<Post>getAllPosts(){
		List<Post>list = new ArrayList<>();
		//Fetch all the post
		
		try {
			
			PreparedStatement p = connection.prepareStatement("Select * from posts order by pid desc");
			ResultSet set= p.executeQuery();
			
			while(set.next()) {
				int pid= set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int catId= set.getInt("catId");
				int userId= set.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				list.add(post);
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public List<Post> getPostByCatId(int catId){
		List<Post>list = new ArrayList<>();
		//Fetch all post by id
try {
			
			PreparedStatement p = connection.prepareStatement("Select * from posts WHERE catId=?");
			p.setInt(1, catId);
			ResultSet set= p.executeQuery();
			
			while(set.next()) {
				int pid= set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId= set.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				list.add(post);
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public Post getPostByPostId(int postId) {
		
		Post post=null;
		try {
			
	
		String q = "Select * from posts where pid=?";
		PreparedStatement p = this.connection.prepareStatement(q);
		p.setInt(1, postId);
		
		ResultSet set=p.executeQuery();
		
		if(set.next()) {
			
			int pid= set.getInt("pid");
			String pTitle = set.getString("pTitle");
			String pContent = set.getString("pContent");
			String pCode = set.getString("pCode");
			String pPic = set.getString("pPic");
			Timestamp pDate = set.getTimestamp("pDate");
			int cid = set.getInt("catId");
			int userId= set.getInt("userId");
			
			
			post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, cid, userId);
			
		}
		
		
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return post;
		
	
	}


}
