package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
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
	
	//회원삭제
	@Delete("delete from member where u_id=#{u_id}")
	public void deleteMember(String u_id);
	//영화삭제
	@Delete("delete from movie where m_title=#{m_title}")
	public void deleteMovie(String m_title);
	//리뷰삭제
	@Delete("delete from review where r_idx=#{r_idx}")
	public void deleteReview(String r_idx);
	
	//등록날짜
	@Select("select * from MEMBER order by u_date")
	public ArrayList<MemberBean> showMembersInfo1();
	//회원명
	@Select("select * from MEMBER order by u_name")
	public ArrayList<MemberBean> showMembersInfo2();
	//아이디
	@Select("select * from MEMBER order by u_id")
	public ArrayList<MemberBean> showMembersInfo3();	
	/*--------------------------------------------------------------*/
	
	//개봉일
	@Select("select* from movie order by m_date")
	public ArrayList<MovieBean> showMoviesInfo1();
	//영화코드
	@Select("select* from movie order by m_idx")
	public ArrayList<MovieBean> showMoviesInfo2();
	//영화명
	@Select("select* from movie order by m_title")
	public ArrayList<MovieBean> showMoviesInfo3();
	/*--------------------------------------------------------------*/
	
	//리뷰등록날짜순
	@Select("select* from review order by r_idx")
	public ArrayList<ReviewBean> showReviewsInfo1();
	@Select("select* from review order by r_date")
	public ArrayList<ReviewBean> showReviewsInfo2();

}
