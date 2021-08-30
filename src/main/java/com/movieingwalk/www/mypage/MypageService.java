package com.movieingwalk.www.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.MemberBean;



@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;
	
	public MemberBean modifyMember(String u_id) {
		return mypageDao.modifyMember(u_id);
		
	}
}
