package com.movieingwalk.www.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class ReviewDao {
	
	@Autowired
	ReviewMapper mapper;

	public void writeReview(ReviewBean bean) {
		mapper.writeReview(bean);
	}
}
