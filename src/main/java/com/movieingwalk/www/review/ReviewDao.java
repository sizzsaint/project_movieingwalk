package com.movieingwalk.www.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class ReviewDao {
	
	@Autowired
	ReviewMapper reviewmapper;
	//리뷰작성
	public void writeReview(ReviewBean bean) {
		reviewmapper.writeReview(bean);
	}
	//리뷰리스트
	public ArrayList<ReviewBean> getReviewList(int m_idx){
		return reviewmapper.getReviewList(m_idx);
	}
	
	public ReviewBean getReviewDetail(int r_idx) {
		return reviewmapper.getReviewDetail(r_idx);
	}
	
	public int hitup(int r_idx) {
		return reviewmapper.hitup(r_idx);
	}
	
	public int likeUpdate(int r_idx) {
		return reviewmapper.likeUpdate(r_idx);
	}
}
