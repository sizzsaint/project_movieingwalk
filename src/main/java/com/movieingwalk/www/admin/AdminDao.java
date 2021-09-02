package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;

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

	public ArrayList<MemberBean> showMembersInfo1(){
		return adminMapper.showMembersInfo1();
	}
	public ArrayList<MemberBean> showMembersInfo2(){
		return adminMapper.showMembersInfo2();
	}
	public ArrayList<MemberBean> showMembersInfo3(){
		return adminMapper.showMembersInfo3();
	}
	
	public ArrayList<MovieBean> showMoviesInfo(){
		return adminMapper.showMoviesInfo();
	}
	
	public ArrayList<ReviewBean> showReviewsInfo(){
		return adminMapper.showReviewsInfo();
	}
}
