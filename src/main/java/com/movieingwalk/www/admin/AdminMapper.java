package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;

@Mapper
public interface AdminMapper {
	@Select("select count(*) from member where u_admin='Y'and u_id=#{u_id}")
	public int checkAdId(MemberBean memberBean);
	
	@Select("select u_id,u_password from MEMBER where u_id=#{u_id}")
	public MemberBean showAdId(MemberBean memberBean);
	
	//회원등록일순
	@Select("select * from MEMBER order by u_date desc")
	public ArrayList<MemberBean> showMembersInfo();
	
	//영화제목순
	@Select("select* from movie order by m_title asc")
	public ArrayList<MovieBean> showMoviesInfo();
	
	//리뷰등록날짜순
	@Select("select* from review order by r_date asc")
	public ArrayList<ReviewBean> showReviewsInfo();
}
