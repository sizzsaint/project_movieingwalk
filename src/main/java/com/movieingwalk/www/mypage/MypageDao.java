package com.movieingwalk.www.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;

@Repository
public class MypageDao {
	@Autowired
	private MypageMapper mypageMapper;
	
	public MemberBean modifyMemberView(String u_idx) {
		return mypageMapper.modifyMemberView(u_idx);
	}
	
	public  void modifyMember(MemberBean memberBean) {
		 mypageMapper.modifyMember(memberBean);
		}
	

}
