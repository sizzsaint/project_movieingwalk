package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;

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
	
	public ArrayList<MemberBean> showMembersInfo() {
		return adminDao.showMembersInfo();
	}
	
	public ArrayList<MovieBean> showMoviesInfo(){
		return adminDao.showMoviesInfo();
	}
	
	public ArrayList<ReviewBean> showReviewsInfo(){
		return adminDao.showReviewsInfo();
	}
}
