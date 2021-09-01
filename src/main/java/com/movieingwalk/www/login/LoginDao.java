package com.movieingwalk.www.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;

@Repository
public class LoginDao {

	@Autowired
	private LoginMapper loginMapper;
	
	public void registerMember(MemberBean memberBean) {
		loginMapper.registerMember(memberBean);
	}
	//회원가입중복
	public MemberBean check_Id(String u_id) {
		return loginMapper.check_Id(u_id);
	}
	
	public int checkId(MemberBean memberBean) {
		return loginMapper.checkId(memberBean);
	}
	
	public MemberBean loginMember(MemberBean memberBean) {
		return loginMapper.loginMember(memberBean);
	}
	
	public int searchId(MemberBean memberBean) {
		return loginMapper.searchId(memberBean);
	}
	public MemberBean showId(MemberBean memberBean) {
		return loginMapper.showId(memberBean);
	}
	
	public int searchPw(MemberBean memberBean) {
		return loginMapper.searchPw(memberBean);
	}
	
	public MemberBean showPw(MemberBean memberBean) {
		return loginMapper.showPw(memberBean);
	}
	
}
