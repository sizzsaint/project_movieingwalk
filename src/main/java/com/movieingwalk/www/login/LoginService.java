package com.movieingwalk.www.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.MemberBean;

@Service
public class LoginService {
	
	@Autowired
	private LoginDao loginDao;
	
	//회원가입
	public void registerMember(MemberBean memberBean) {
		loginDao.registerMember(memberBean);
	}
	
	//아이디 존재 여부
	public int checkId(MemberBean memberBean) {
		return loginDao.checkId(memberBean);
	}
	
	//로그인
	public MemberBean loginMember(MemberBean memberBean) {
		return loginDao.loginMember(memberBean);
	}
	
	//아이디 찾기
	public int searchId(MemberBean memberBean) {
		return loginDao.searchId(memberBean);
	}
	//아이디 보여주기
	public MemberBean showId(MemberBean memberBean) {
		return loginDao.showId(memberBean);
	}
}



