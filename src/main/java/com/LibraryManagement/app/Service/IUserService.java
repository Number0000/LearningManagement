package com.LibraryManagement.app.Service;

import java.util.List;
import com.LibraryManagement.app.Entity.User;

public interface IUserService {

	public List<User> getAllUser();

	public List<User> getUserById(int userId);

}
