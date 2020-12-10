package com.LibraryManagement.app.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.LibraryManagement.app.Entity.Book;

@Repository
@Transactional
public interface BookRepository extends JpaRepository<Book, Integer> {

	Page<Book> findAll(Pageable pageRequest);

}
