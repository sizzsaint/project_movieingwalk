package com.movieingwalk.www;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class IndexDao {

	@Autowired
	IndexMapper mapper;
	
	public ArrayList<ReviewBean> mainpageReview(){
		return mapper.mainpageReview();
	}
}
