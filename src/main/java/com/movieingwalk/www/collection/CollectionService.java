package com.movieingwalk.www.collection;

import org.springframework.beans.factory.annotation.Autowired;

import com.movieingwalk.www.bean.CollectionBean;

public class CollectionService {

	
	@Autowired
	private CollectionDao colDao;
	//콜렉션상세보기
	public CollectionBean col_datail(int col_idx) {
		return colDao.col_datail(col_idx);
	}
	
	
	
	
	
	
}
