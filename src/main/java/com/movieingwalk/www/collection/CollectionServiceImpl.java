package com.movieingwalk.www.collection;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.CollectionBean;

@Service
public class CollectionServiceImpl {

	@Autowired
	CollectionDaoImpl collectionDao;
	
	public void insertCollection(CollectionBean collectionBean) {
		collectionDao.insertCollection(collectionBean);

	}
	
	public CollectionBean col_datail(int col_idx) {
		return collectionDao.col_datail(col_idx);
		
	}

	public ArrayList<CollectionBean> getCollectionList(int m_idx) {
		// TODO Auto-generated method stub
		return collectionDao.getCollectionList(m_idx);
	}
	
	public ArrayList<CollectionBean> getMainCollection(){
		return collectionDao.getMainCollection();
	}
	
	public int checkLike(int col_idx, String u_id) {
		return collectionDao.checkLike(col_idx, u_id);
	}
	
	public int likeUpdate(int col_idx) {
		return collectionDao.likeUpdate(col_idx);
	}
	
	public void likeInsert(int col_idx, String u_id) {
		collectionDao.likeInsert(col_idx,u_id);
	}
}
