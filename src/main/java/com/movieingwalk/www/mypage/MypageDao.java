package com.movieingwalk.www.mypage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class MypageDao {
	@Autowired
	private MypageMapper mypageMapper;
	
	public MemberBean mypageMain(String u_id) {
		return mypageMapper.mypageMain(u_id);
	}
	
	public MemberBean modifyMemberView(String u_id) {
		return mypageMapper.modifyMemberView(u_id);
	}
	
	public  void modifyMember(MemberBean memberBean) {
		 mypageMapper.modifyMember(memberBean);
		}
	
	//회원탈퇴
	public MemberBean resignMember(String u_id) {
		return mypageMapper.mypageMain(u_id);
	}
	
	//탈퇴처리
	public void resignMemberOK(MemberBean memberBean) {
		mypageMapper.resignMember(memberBean);
	}
	
	//마이페이지 리뷰
	public ArrayList<ReviewBean> getMyReview(String u_id){
		return mypageMapper.getMyReview(u_id);
	}
	
	
}
