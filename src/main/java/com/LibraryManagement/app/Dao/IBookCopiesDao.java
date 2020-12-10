package com.LibraryManagement.app.Dao;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Entity.BookCopies;

public interface IBookCopiesDao {
	public List<BookCopies> findAll(Connection conn);

	public boolean addBookCopies(Connection conn, BookCopies bookCopies);

	public List<BookCopies> getBookCopiesById(Connection conn, int bookId, int bookCopiesId);

	public BookCopies getBookCopiesByIdReturn(Connection conn, int bookId, int bookCopiesId);

	public boolean updateBookCopies(Connection conn, BookCopies bookCopies);

	public boolean deleteBookCopiesById(Connection conn, BookCopies bookCopies);

	public List<BookCopies> getSingleBookCopies(Connection conn, int count);

}
