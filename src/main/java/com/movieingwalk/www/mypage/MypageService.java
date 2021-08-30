package com.movieingwalk.www.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.MemberBean;



@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;
	//글수정 불러오기
	public MemberBean modifyMemberView(String u_idx) {
		return mypageDao.modifyMemberView(u_idx);
		
	}
	
	public void modifyMember(MemberBean memberBean) {
		mypageDao.modifyMember(memberBean);
		
	}
	
}
