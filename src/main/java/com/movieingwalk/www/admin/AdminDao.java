package com.movieingwalk.www.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;

@Repository
public class AdminDao {

	@Autowired
	private AdminMapper adminMapper;
	
	public int checkAdId(MemberBean memberBean) {
		return adminMapper.checkAdId(memberBean);
	}
	
	public MemberBean showAdId(MemberBean memberBean) {
		return adminMapper.showAdId(memberBean);
	}
}
