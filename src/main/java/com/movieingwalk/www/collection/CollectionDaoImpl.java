package com.movieingwalk.www.collection;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class CollectionDaoImpl {

	@Autowired
	private CollectionMapper collectionMapper;
	
	public void insertCollection(CollectionBean collectionBean) {
		collectionMapper.insertCollection(collectionBean);
	}

	
}
