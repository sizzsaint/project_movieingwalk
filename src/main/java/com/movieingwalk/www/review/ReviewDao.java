package com.movieingwalk.www.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.bean.RstarBean;

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
	
	public int checkLike(int r_idx, String u_id){
		return reviewmapper.checkLike(r_idx, u_id);
	}
	public int likeUpdate(int r_idx) {
		return reviewmapper.likeUpdate(r_idx);
	}
	
	public void likeInsert(int r_idx, String u_id) {
		reviewmapper.likeInsert(r_idx,u_id);
	}
	
	public RstarBean getRstar(int m_idx) {
		return reviewmapper.getRstar(m_idx);
	}
}
