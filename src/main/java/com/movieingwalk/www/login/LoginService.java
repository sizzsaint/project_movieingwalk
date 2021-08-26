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
	
	}


