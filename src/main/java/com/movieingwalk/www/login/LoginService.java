package com.movieingwalk.www.login;

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
	
	//아이디 존재 여부(회원가입중복)
	public MemberBean check_Id(String u_id) {
		return loginDao.check_Id(u_id);
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
	
	//비밀번호 찾기
	public int searchPw(MemberBean memberBean) {
		return loginDao.searchPw(memberBean);
	}
	//비밀번호 보여주기
	public MemberBean showPw(MemberBean memberBean) {
		return loginDao.showPw(memberBean);
	}
}



