package com.LibraryManagement.app.ServiceHelper;

import java.sql.Connection;
import java.util.List;

import com.LibraryManagement.app.Connection.Connections;
import com.LibraryManagement.app.Dao.IPublisherDao;
import com.LibraryManagement.app.Entity.Publisher;
import com.LibraryManagement.app.Mysql.PublisherDao;
import com.LibraryManagement.app.Service.IPublisherService;

public class PublisherService implements IPublisherService {
	IPublisherDao publisherDao;

	public PublisherService() {
		publisherDao = new PublisherDao();
	}

	public List<Publisher> getPublisher() {
		Connection conn = Connections.connection();
		return publisherDao.findAll(conn);
	}

	public boolean addPublisher(Publisher publisher) {
		Connection conn = Connections.connection();
		return publisherDao.addPublisher(conn, publisher);
	}

	public List<Publisher> getPublisherById(int publisherId) {
		Connection conn = Connections.connection();
		return publisherDao.getPublisherById(conn, publisherId);
	}

	public Publisher getPublisherByIdReturn(int publisherId) {
		Connection conn = Connections.connection();
		return publisherDao.getPublisherByIdReturn(conn, publisherId);
	}

	public boolean updatePublisher(Publisher publisher) {
		Connection conn = Connections.connection();
		return publisherDao.updatePublisher(conn, publisher);
	}

	public boolean deletePublisher(Publisher publisher) {
		Connection conn = Connections.connection();
		return publisherDao.deletePublisherById(conn, publisher);
	}

	public List<Publisher> getSinglePublisher(int count) {
		Connection conn = Connections.connection();
		return publisherDao.getSinglePublisher(conn, count);
	}

}
