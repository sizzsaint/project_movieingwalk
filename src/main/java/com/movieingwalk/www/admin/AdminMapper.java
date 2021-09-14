package com.movieingwalk.www.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;

@Mapper
public interface AdminMapper {
	@Select("select count(*) from member where u_admin='Y'and u_id=#{u_id}")
	public int checkAdId(MemberBean memberBean);
	
	@Select("select u_id,u_password from MEMBER where u_id=#{u_id}")
	public MemberBean showAdId(MemberBean memberBean);
	
	//회원정보 검색
	@Select("select * from member where u_id like '%'#{u_id}'%'")
	public ArrayList<MemberBean> searchMember(String u_id);
	
	//회원삭제
	@Delete("delete from member where u_id=#{u_id}")
	public void deleteMember(String u_id);
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
	
	//리뷰별 수
	@Select("select* from review order by r_star desc")
	public ArrayList<ReviewBean> showReviewsInfo1();
	//리뷰등록날짜순
	@Select("select* from review order by r_date")
	public ArrayList<ReviewBean> showReviewsInfo2();
	//좋아요 수
	@Select("select* from review order by r_likes desc")
	public ArrayList<ReviewBean> showReviewsInfo3();
	//조회 수
	@Select("select* from review order by r_hits desc")
	public ArrayList<ReviewBean> showReviewsInfo4();
	//댓글 수
	@Select("select* from review order by r_comments desc")
	public ArrayList<ReviewBean> showReviewsInfo5();

}
