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

	
	public void loginMember(MemberBean memberBean) {
		loginMapper.loginMember(memberBean);
	}
	
	public int idCheck(String u_id) {
		int cnt = loginMapper.idCheck(u_id);
		return cnt;
	}

}
