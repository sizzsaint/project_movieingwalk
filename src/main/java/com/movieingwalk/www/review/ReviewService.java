package com.movieingwalk.www.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.ReviewBean;

@Service
public class ReviewService {

	@Autowired
	ReviewDao reviewdao;
	//리뷰작성
	public void writeReview(ReviewBean bean) {
		reviewdao.writeReview(bean);
	}
	//리뷰리스트
	public ArrayList<ReviewBean> getReviewList(int m_idx){
		return reviewdao.getReviewList(m_idx);
	}
	
	public ReviewBean getReviewDetail(int r_idx) {
		return reviewdao.getReviewDetail(r_idx);
	}
	
	public int hitup(int r_idx) {
		return reviewdao.hitup(r_idx);
	}
	
	public int likeUpdate(int r_idx) {
		return reviewdao.likeUpdate(r_idx);
	}
	

}
