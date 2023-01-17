package com.dollop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dollop.model.User;
import com.dollop.util.DBConnection;

public class UserInterfaceDAOImpl implements UserInterfaceDAO {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	@Override
	public boolean createUser(User user) {
		// TODO Auto-generated method stub
		con = DBConnection.getConnection();
		if (con != null) {
			String Insert_Qury = "INSERT INTO user(name, email, address, image, password)VALUES"
					+ "('"+user.getName()+"', '"+user.getEmail()+"', '"+user.getAddress()+"', '"+user.getImage()+"', '"+user.getPassword()+"')";
			try {
				pst = con.prepareStatement(Insert_Qury);
				if (pst.executeUpdate() > 0)
					return true;
				return false;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return false;
	}

	@Override
	public List<User> viewAllUser() {
		List<User> list = new ArrayList<>();
		User user = null;
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from user";
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				while (rs.next()) {
					user = new User();
					user.setUid(rs.getInt("id"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setAddress(rs.getString("address"));
					user.setPassword(rs.getString("password"));
					list.add(user);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public User viewUserById(Integer id) {
		User user = null;
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from user where id="+id;
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				if (rs.next()) {
					user = new User();
					user.setUid(rs.getInt("id"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setAddress(rs.getString("address"));
					user.setPassword(rs.getString("password"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}

	@Override
	public boolean deleteUser(Integer id) {
		// TODO Auto-generated method stub
		con = DBConnection.getConnection();
		if (con != null) {
			String Delete_Qury = "delete from user where id="+id;
			try {
				pst = con.prepareStatement(Delete_Qury);
				if (pst.executeUpdate() > 0)
					return true;
				return false;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean updateUserImage(User user) {
		boolean flag = false;
		try {
			con = DBConnection.getConnection();
			String Update_Qury ="update user set image=? where id=?";
			pst = con.prepareStatement(Update_Qury);
			pst.setString(1, user.getImage());
			pst.setInt(2, user.getUid());
			pst.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public User loginUser(User user) {
		// TODO Auto-generated method stub
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from user";
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				while (rs.next()) {
					if(rs.getString("name").equals(user.getName())&&rs.getString("password").equals(user.getPassword()))
					{
						
						user.setUid(rs.getInt("id"));
						user.setName(rs.getString("name"));
						user.setEmail(rs.getString("email"));
						user.setAddress(rs.getString("address"));
						user.setPassword(rs.getString("password"));
						user.setImage(rs.getString("image"));
						System.out.println("user"+user);
						System.out.println("login success");
						return user;
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;
	}
	
	
	@Override
	public boolean changePassword(int id, String pass) {
		// TODO Auto-generated method stub
		con = DBConnection.getConnection();
		if(con!=null)
		{
			String Update_Query = "update user set password=? where id =?";
			try {
				pst = con.prepareStatement(Update_Query);
				pst.setString(1, pass);
				pst.setInt(2, id);
				if (pst.executeUpdate() > 0)
					return true;
				return false;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		con = DBConnection.getConnection();
		if(con!=null)
		{
			String Update_user = "update user set name=? , email=? , address=? , password=? , image=? where id=?";
			try {
				pst = con.prepareStatement(Update_user);
				pst.setString(1, user.getName());
				pst.setString(2, user.getEmail());
				pst.setString(3, user.getAddress());
				pst.setString(4, user.getPassword());
				pst.setString(5, user.getImage());
				pst.setInt(6, user.getUid());
				if(pst.executeUpdate()>0)
					return true;
				return false;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return false;
	}
	
}
