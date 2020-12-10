package com.LibraryManagement.app.ServiceHelper;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Connection.Connections;
import com.LibraryManagement.app.Dao.IBookLoanDao;
import com.LibraryManagement.app.Entity.BookLoan;
import com.LibraryManagement.app.Mysql.BookLoanDao;
import com.LibraryManagement.app.Service.IBookLoanService;

public class BookLoanService implements IBookLoanService {
	IBookLoanDao bookLoanDao;

	public BookLoanService() {
		bookLoanDao = new BookLoanDao();
	}

	public List<BookLoan> getBookLoan() {
		Connection conn = Connections.connection();
		return bookLoanDao.findAll(conn);
	}

	public List<BookLoan> getBookLoanByCardNo(int cardNo) {
		Connection conn = Connections.connection();
		return bookLoanDao.findAllByCardNo(conn, cardNo);
	}

	public boolean addBookLoan(BookLoan bookLoan) {
		Connection conn = Connections.connection();
		return bookLoanDao.addBookLoan(conn, bookLoan);
	}

	public List<BookLoan> getBookLoanById(int bookId, int branchId, int cardNo) {
		Connection conn = Connections.connection();
		return bookLoanDao.getBookLoanById(conn, bookId, branchId, cardNo);
	}

	public BookLoan getBookLoanByIdReturn(int bookId, int branchId, int cardNo) {
		Connection conn = Connections.connection();
		return bookLoanDao.getBookLoanByIdReturn(conn, bookId, branchId, cardNo);
	}

	public boolean updateBookLoan(BookLoan bookLoan) {
		Connection conn = Connections.connection();
		return bookLoanDao.updateBookLoan(conn, bookLoan);
	}

	public boolean deleteBookLoan(BookLoan bookLoan) {
		Connection conn = Connections.connection();
		return bookLoanDao.deleteBookLoanById(conn, bookLoan);
	}

	public List<BookLoan> getSingleBookLoan(int count) {
		Connection conn = Connections.connection();
		return bookLoanDao.getSingleBookLoan(conn, count);
	}

}
