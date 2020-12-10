package com.LibraryManagement.app.Service;

import java.util.List;

import com.LibraryManagement.app.Entity.Borrower;

public interface IBorrowerService {

	public List<Borrower> getBorrower();

	public boolean addBorrower(Borrower borrower);

	public List<Borrower> getBorrowerById(int cardNo);

	public Borrower getBorrowerByIdReturn(int cardNo);

	public boolean updateBorrower(Borrower borrower);

	public boolean deleteBorrower(Borrower borrower);

	public List<Borrower> getSingleBorrower(int count);

}
