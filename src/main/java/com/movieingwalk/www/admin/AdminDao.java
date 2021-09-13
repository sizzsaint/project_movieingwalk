package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class AdminDao {

	@Autowired
	private AdminMapper adminMapper;
	
	public int checkAdId(MemberBean memberBean) {
		return adminMapper.checkAdId(memberBean);
	}
	
	public MemberBean showAdId(MemberBean memberBean) {
		return adminMapper.showAdId(memberBean);
	}

	public ArrayList<MemberBean> searchMember(String u_id) {
		return adminMapper.searchMember(u_id);
	}
	
	public void deleteMember(String u_id) {
		adminMapper.deleteMember(u_id);
		return;
	}
	public void deleteReview(String r_idx) {
		adminMapper.deleteReview(r_idx);
		return;
	}
	
	
	public ArrayList<MemberBean> showMembersInfo1(){
		return adminMapper.showMembersInfo1();
	}
	public ArrayList<MemberBean> showMembersInfo2(){
		return adminMapper.showMembersInfo2();
	}
	public ArrayList<MemberBean> showMembersInfo3(){
		return adminMapper.showMembersInfo3();
	}
	
	
	public ArrayList<ReviewBean> showReviewsInfo1(){
		return adminMapper.showReviewsInfo1();
	}
	public ArrayList<ReviewBean> showReviewsInfo2(){
		return adminMapper.showReviewsInfo2();
	}
	public ArrayList<ReviewBean> showReviewsInfo3(){
		return adminMapper.showReviewsInfo3();
	}
	public ArrayList<ReviewBean> showReviewsInfo4(){
		return adminMapper.showReviewsInfo4();
	}
	public ArrayList<ReviewBean> showReviewsInfo5(){
		return adminMapper.showReviewsInfo5();
	}
}
