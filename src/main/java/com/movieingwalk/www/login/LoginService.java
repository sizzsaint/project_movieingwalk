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
<<<<<<< HEAD
	}
	public void loginMember(MemberBean memberBean) {
		loginDao.loginMember(memberBean);
	}
}
=======

	}
	
	}
>>>>>>> 9b4de4f47d48f7fcaec887cb1183d660801b9378


