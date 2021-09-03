package com.movieingwalk.www.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.MemberBean;



@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;
	//마이페이지메인
	public MemberBean mypageMain(String u_id) {
		return mypageDao.mypageMain(u_id);
	}
	//회원정보 불러오기
	public MemberBean modifyMemberView(String u_id) {
		return mypageDao.modifyMemberView(u_id);
		
	}
	// 회원정보수정처리
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
	
}
