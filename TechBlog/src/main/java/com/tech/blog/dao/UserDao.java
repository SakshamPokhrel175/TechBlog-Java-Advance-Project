package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

	private Connection connection;

	public UserDao(Connection connection) {
		this.connection = connection;
	}

	// Method to insert user to the database
	public boolean saveUser(User user) {
		boolean f = false;

		try {
			// user -> database
			String query = "INSERT INTO users(name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = this.connection.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get user by userEMail and user Password:

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {

			String query = "select * from users WHERE email=? and password=?";
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			// Debugging output
			System.out.println("Query: " + query);
			System.out.println("Email: " + email);
			System.out.println("Password: " + password);

			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setRegister_date(set.getTimestamp("created_at"));
				user.setProfile(set.getString("profile"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

	public boolean updateUser(User user) {
		boolean f = false;

		try {

			String query = "UPDATE users SET name = ? , email = ? , password=? , gender=? , about=? , profile=? Where id=? ";
			PreparedStatement p = connection.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());

			p.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	
	 public User getUserByUserId(int userId) {
		
		User user=null;
		
		try {
			
		
		String q="Select * from users WHERE id=?";
		PreparedStatement ps= this.connection.prepareStatement(q);
		ps.setInt(1, userId);
		ResultSet set = ps.executeQuery();
		
		if (set.next()) {
			user = new User();
			user.setId(set.getInt("id"));
			user.setName(set.getString("name"));
			user.setEmail(set.getString("email"));
			user.setPassword(set.getString("password"));
			user.setGender(set.getString("gender"));
			user.setAbout(set.getString("about"));
			user.setRegister_date(set.getTimestamp("created_at"));
			user.setProfile(set.getString("profile"));
		}

				
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
}
