package com.movieingwalk.www.collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.CollectionBean;

@Service
public class CollectionServiceImpl {

	@Autowired
	CollectionDaoImpl collectionDao;
	
	public void writeCollection(CollectionBean collectionBean) {
		collectionDao.writeCollection(collectionBean);

	}
}
