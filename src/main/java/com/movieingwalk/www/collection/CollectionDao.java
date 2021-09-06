package com.movieingwalk.www.collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.CollectionBean;

public interface CollectionDao {
	
	public CollectionBean col_datail(int col_idx);
	
	public void insertCollection(CollectionBean collectionBean);

}
