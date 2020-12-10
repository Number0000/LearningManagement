package com.LibraryManagement.app.ServiceHelper;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Mysql.UserDao;
import com.LibraryManagement.app.Service.IUserService;
import com.LibraryManagement.app.Connection.Connections;
import com.LibraryManagement.app.Dao.IUserDao;
import com.LibraryManagement.app.Entity.*;

public class UserService implements IUserService {

	IUserDao userDao;
	Connection conn;

	public UserService() {
		userDao = new UserDao();
	}

	public List<User> getAllUser() {
		conn = Connections.connection();
		return userDao.findAll(conn);
	}

	public List<User> getUserById(int userId) {
		conn = Connections.connection();
		return userDao.findById(conn, userId);
	}
}
