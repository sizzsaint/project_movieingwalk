package com.movieingwalk.www.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.MemberBean;

@Service
public class LoginService {
	
	@Autowired
	private LoginDao loginDao;
	
	public void registerMember(MemberBean memberBean) {
		loginDao.registerMember(memberBean);

	}
	public void loginMember(MemberBean memberBean) {
		loginDao.loginMember(memberBean);
	}
	
	public int idCheck(String u_id) {
		int cnt = loginDao.idCheck(u_id);
		return cnt;
	}
	
	
	
	
}



