package com.tech.blog.dao;
import java.sql.*;
public class LikeDao {
	Connection connection;
	
	
	public LikeDao(Connection connection) {
		super();
		this.connection = connection;
	}


	public boolean insertLike(int pid , int uid) {
		
		boolean f=false;
		try {
			String q="Insert into liked(pid, uid) values(? , ?)";
			PreparedStatement p=this.connection.prepareStatement(q);
			//Value set
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;	
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
		
	}

	
	
	public int countLikeonPost(int pid) {
		int count=0;
		
		try {
			String q="Select count(*) from liked WHERE pid=?";
			PreparedStatement p=this.connection.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet set=p.executeQuery();
			if(set.next()) {
				
				count=set.getInt("count(*)");
				
			}
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
		return count;
	}

	
	public boolean isLikedByUser(int pid, int uid) {
		boolean f=false;
		
		try {
			
			PreparedStatement p=this.connection.prepareStatement("Select * from liked WHERE pid=? and uid=? ");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet set= p.executeQuery();
			
			if(set.next()) {
				f=true;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}

	
	public boolean deleteLike(int pid, int uid) {
		
		boolean f=false;
		
		try {
			PreparedStatement p=connection.prepareStatement("delete from liked Where pid=? and uid=? ");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}


	


}
