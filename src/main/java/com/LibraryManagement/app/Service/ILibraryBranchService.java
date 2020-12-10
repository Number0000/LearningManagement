package com.LibraryManagement.app.Service;

import java.util.List;

import com.LibraryManagement.app.Entity.LibraryBranch;

public interface ILibraryBranchService {

	public List<LibraryBranch> getLibraryBranch();

	public boolean addLibraryBranch(LibraryBranch libraryBranch);

	public List<LibraryBranch> getLibraryBranchById(int branchId);

	public LibraryBranch getLibraryBranchByIdReturn(int branchId);

	public boolean updateLibraryBranch(LibraryBranch libraryBranch);

	public boolean deleteLibraryBranch(LibraryBranch libraryBranch);

	public List<LibraryBranch> getSingleLibraryBranch(int count);

}
