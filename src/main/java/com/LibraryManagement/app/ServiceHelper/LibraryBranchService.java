package com.LibraryManagement.app.ServiceHelper;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Connection.Connections;
import com.LibraryManagement.app.Dao.ILibraryBranchDao;
import com.LibraryManagement.app.Entity.LibraryBranch;
import com.LibraryManagement.app.Mysql.LibraryBranchDao;
import com.LibraryManagement.app.Service.ILibraryBranchService;

public class LibraryBranchService implements ILibraryBranchService {
	ILibraryBranchDao libraryBranchDao;

	public LibraryBranchService() {
		libraryBranchDao = new LibraryBranchDao();
	}

	public List<LibraryBranch> getLibraryBranch() {
		Connection conn = Connections.connection();
		return libraryBranchDao.findAll(conn);
	}

	public boolean addLibraryBranch(LibraryBranch libraryBranch) {
		Connection conn = Connections.connection();
		return libraryBranchDao.addLibraryBranch(conn, libraryBranch);
	}

	public List<LibraryBranch> getLibraryBranchById(int branchId) {
		Connection conn = Connections.connection();
		return libraryBranchDao.getLibraryBranchById(conn, branchId);
	}

	public LibraryBranch getLibraryBranchByIdReturn(int branchId) {
		Connection conn = Connections.connection();
		return libraryBranchDao.getLibraryBranchByIdReturn(conn, branchId);
	}

	public boolean updateLibraryBranch(LibraryBranch libraryBranch) {
		Connection conn = Connections.connection();
		return libraryBranchDao.updateLibraryBranch(conn, libraryBranch);
	}

	public boolean deleteLibraryBranch(LibraryBranch libraryBranch) {
		Connection conn = Connections.connection();
		return libraryBranchDao.deleteLibraryBranchById(conn, libraryBranch);
	}

	public List<LibraryBranch> getSingleLibraryBranch(int count) {
		Connection conn = Connections.connection();
		return libraryBranchDao.getSingleLibraryBranch(conn, count);
	}

}
