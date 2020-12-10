package com.LibraryManagement.app.ServiceHelper;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Connection.Connections;
import com.LibraryManagement.app.Dao.IBorrowerDao;
import com.LibraryManagement.app.Entity.Borrower;
import com.LibraryManagement.app.Mysql.BorrowerDao;
import com.LibraryManagement.app.Service.IBorrowerService;

public class BorrowerService implements IBorrowerService {
	IBorrowerDao borrowerDao;

	public BorrowerService() {
		borrowerDao = new BorrowerDao();
	}

	public List<Borrower> getBorrower() {
		Connection conn = Connections.connection();
		return borrowerDao.findAll(conn);
	}

	public boolean addBorrower(Borrower borrower) {
		Connection conn = Connections.connection();
		return borrowerDao.addBorrower(conn, borrower);
	}

	public List<Borrower> getBorrowerById(int cardNo) {
		Connection conn = Connections.connection();
		return borrowerDao.getBorrowerById(conn, cardNo);
	}

	public Borrower getBorrowerByIdReturn(int cardNo) {
		Connection conn = Connections.connection();
		return borrowerDao.getBorrowerByIdReturn(conn, cardNo);
	}

	public boolean updateBorrower(Borrower borrower) {
		Connection conn = Connections.connection();
		return borrowerDao.updateBorrower(conn, borrower);
	}

	public boolean deleteBorrower(Borrower borrower) {
		Connection conn = Connections.connection();
		return borrowerDao.deleteBorrowerById(conn, borrower);
	}

	public List<Borrower> getSingleBorrower(int count) {
		Connection conn = Connections.connection();
		return borrowerDao.getSingleBorrower(conn, count);
	}

}
