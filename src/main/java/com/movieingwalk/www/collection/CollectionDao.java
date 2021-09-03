package com.movieingwalk.www.collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.CollectionBean;

@Service
public class CollectionDao {
	@Autowired
	private CollectionMapper colMaper;
	
	public CollectionBean col_datail(int col_idx) {
	return colMaper.col_datail(col_idx);
	}

}
