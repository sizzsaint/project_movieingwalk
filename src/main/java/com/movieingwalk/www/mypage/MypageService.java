package com.movieingwalk.www.mypage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;



@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;
	//마이페이지메인
	public MemberBean mypageMain(String u_id) {
		return mypageDao.mypageMain(u_id);
	}
	//글수정 불러오기
	public MemberBean modifyMemberView(String u_id) {
		return mypageDao.modifyMemberView(u_id);
		
	}
	
	public void modifyMember(MemberBean memberBean) {
		mypageDao.modifyMember(memberBean);
		
	}
	
	//회원탈퇴
	public MemberBean resignMember(String u_id) {
		// TODO Auto-generated method stub
		return mypageDao.resignMember(u_id);
	}
	
	//탈퇴처리
	public void resignMemberOK(MemberBean memberBean) {
		mypageDao.resignMemberOK(memberBean);
	}
	
	//마이페이지 리뷰
	public ArrayList<ReviewBean> getMyReview(String u_id){
		return mypageDao.getMyReview(u_id);
	}
	
	//마이페이지 리뷰좋아요
	public ArrayList<ReviewBean> getMyLikeReview(String u_id){
		return mypageDao.getMyLikeReview(u_id);
	}
	
	//마이페이지 콜렉션
	public List<CollectionBean> getMyCollection(String u_id){
		return mypageDao.getMyCollection(u_id);
	}
	//마이페이지 좋아요 
	public List<CollectionBean> getMyLikeCol(String u_id){
		return mypageDao.getMyLikeCol(u_id);
	}
}
