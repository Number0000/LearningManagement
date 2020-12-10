package com.LibraryManagement.app.Dao;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Entity.User;

public interface IUserDao {

	public List<User> findAll(Connection conn);

	public List<User> findById(Connection conn, int userId);
}
