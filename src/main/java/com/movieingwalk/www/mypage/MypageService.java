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
	//글수정 불러오기
	public MemberBean modifyMemberView(String u_id) {
		return mypageDao.modifyMemberView(u_id);
		
	}
	
	public void modifyMember(MemberBean memberBean) {
		mypageDao.modifyMember(memberBean);
		
	}
	
}
