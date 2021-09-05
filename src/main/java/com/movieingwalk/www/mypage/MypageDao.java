package com.movieingwalk.www.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;

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
}
