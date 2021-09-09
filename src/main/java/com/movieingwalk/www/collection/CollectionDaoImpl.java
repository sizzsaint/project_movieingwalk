package com.movieingwalk.www.collection;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.ReviewBean;

@Repository

public class CollectionDaoImpl implements CollectionDao {


	@Autowired
	private CollectionMapper collectionMapper;
	
	@Override
	public CollectionBean col_datail(int col_idx) {
		// TODO Auto-generated method stub

		return collectionMapper.col_datail(col_idx);
	}

	public void insertCollection(CollectionBean collectionBean) {
		collectionMapper.insertCollection(collectionBean);
	}

	public ArrayList<CollectionBean> getCollectionList(int m_idx) {
		// TODO Auto-generated method stub
		return collectionMapper.getCollectionList(m_idx);
	}

	public ArrayList<CollectionBean> getMainCollection(){
		return collectionMapper.getMainCollection();
	}
	
	public int checkLike(int col_idx, String u_id){
		return collectionMapper.checkLike(col_idx, u_id);
	}
	public int likeUpdate(int col_idx) {
		return collectionMapper.likeUpdate(col_idx);
	}
	
	public void likeInsert(int col_idx, String u_id) {
		collectionMapper.likeInsert(col_idx,u_id);
	}
	

	
}
