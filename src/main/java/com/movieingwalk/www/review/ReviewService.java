package com.movieingwalk.www.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.ReviewBean;

@Service
public class ReviewService {

	@Autowired
	ReviewDao dao;
	
	public void writeReview(ReviewBean bean) {
		dao.writeReview(bean);
	}
}
