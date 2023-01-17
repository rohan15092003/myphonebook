package com.dollop.dao;

import java.util.List;

import com.dollop.model.User;

public interface UserInterfaceDAO {
	public User loginUser(User user);
	public boolean createUser(User user);
	public List<User> viewAllUser();
	public User viewUserById(Integer id);
	public boolean deleteUser(Integer id);
	public boolean updateUserImage(User user);
	public boolean changePassword(int id , String pass);
	public boolean updateUser(User user);
}
