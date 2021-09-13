package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	public int checkAdId(MemberBean memberBean) {
		return adminDao.checkAdId(memberBean);
	}
	
	public MemberBean showAdId(MemberBean memberBean) {
		return adminDao.showAdId(memberBean);
	}
	
	public ArrayList<MemberBean> searchMember(String u_id) {
		return adminDao.searchMember(u_id);
	}
	
	public void deleteMember(String u_id) {
		adminDao.deleteMember(u_id);
		return;
	}
	public void deleteReview(String r_idx) {
		adminDao.deleteReview(r_idx);
		return;
	}
	
	
	public ArrayList<MemberBean> showMembersInfo1() {
		return adminDao.showMembersInfo1();
	}
	public ArrayList<MemberBean> showMembersInfo2() {
		return adminDao.showMembersInfo2();
	}
	public ArrayList<MemberBean> showMembersInfo3() {
		return adminDao.showMembersInfo3();
	}
	
	
	public ArrayList<ReviewBean> showReviewsInfo1(){
		return adminDao.showReviewsInfo2();
	}
	public ArrayList<ReviewBean> showReviewsInfo2(){
		return adminDao.showReviewsInfo2();
	}
	public ArrayList<ReviewBean> showReviewsInfo3(){
		return adminDao.showReviewsInfo3();
	}
	public ArrayList<ReviewBean> showReviewsInfo4(){
		return adminDao.showReviewsInfo4();
	}
	public ArrayList<ReviewBean> showReviewsInfo5(){
		return adminDao.showReviewsInfo5();
	}
}
