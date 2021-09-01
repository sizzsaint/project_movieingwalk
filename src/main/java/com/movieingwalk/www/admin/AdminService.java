package com.movieingwalk.www.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.MemberBean;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	public int checkAdId(MemberBean memberBean) {
		return adminDao.checkAdId(memberBean);
	}
	
	public MemberBean showAdId(MemberBean memberBean) {
		return adminDao.showAdId(memberBean);
	}
}
