package com.dollop.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dollop.model.Contact;
import com.dollop.util.DBConnection;

public class ContactInterfaceDAOImpl implements ContactInterfaceDAO {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public boolean createContact(Contact contact) {
		con = DBConnection.getConnection();
		if (con != null) {
			String Insert_Qury = "INSERT INTO contact(name, email, phone , uid)VALUES" + "('" + contact.getName()
					+ "', '" + contact.getEmail() + "', '" + contact.getPhone() + "','" + contact.getuId() + "')";
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

	public List<Contact> viewAllContact(Integer uid) {
		List<Contact> list = new ArrayList<>();
		Contact contact = null;
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from contact where uid=" + uid;
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				while (rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setName(rs.getString("name"));
					contact.setEmail(rs.getString("email"));
					contact.setPhone(rs.getBigDecimal("phone").toBigInteger());
					contact.setuId(rs.getInt("uid"));
					list.add(contact);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public Contact viewContactById(Integer id) {
		Contact contact = null;
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from contact where id=" + id;
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				if (rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setName(rs.getString("name"));
					contact.setEmail(rs.getString("email"));
					contact.setPhone(rs.getBigDecimal("phone").toBigInteger());
					contact.setuId(rs.getInt("uid"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return contact;
	}

	public boolean deleteContact(Integer id) {
		con = DBConnection.getConnection();
		if (con != null) {
			String Delete_Qury = "delete from contact where id=" + id;
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

	public boolean updateContact(Contact contact) {
		boolean flag = false;
		try {
			String Update_Qury = "UPDATE contact SET name = '" + contact.getName() + "', " + "email = '"
					+ contact.getEmail() + "', phone = '" + contact.getPhone() + "'," + " uid = '" + contact.getuId()
					+ "' where id=" + contact.getId();
			con = DBConnection.getConnection();
			pst = con.prepareStatement(Update_Qury);
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteAllById(String[] al) {
		// TODO Auto-generated method stub
		try {
            for(int i=0;i<al.length;i++) {
            	int value=Integer.parseInt(al[i]);
            	deleteContact(value);
            }
            return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<Contact> viewAllLike(String name) {
		// TODO Auto-generated method stub
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
