package com.movieingwalk.www.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;

@Mapper
public interface MypageMapper {
	
	final String MYPAGE_MAIN = " SELECT * from member where u_id=#{u_id}";
	@Select(MYPAGE_MAIN)
	@Results(id="allResult", value= {
			@Result(property = "u_id", column="u_id"),
			@Result(property = "u_name", column="u_name"),
			@Result(property = "u_password", column="u_password"),
			@Result(property = "u_email", column="u_email"),
			@Result(property = "u_phone", column="u_phone"),
			@Result(property = "u_age", column="u_age"),
			@Result(property = "u_sex", column="u_sex"),
			@Result(property = "u_reviews", column="u_reviews"),
			@Result(property = "u_collections", column="u_collections"),
			@Result(property = "u_liked_collections", column="u_liked_collections"),
			@Result(property = "u_tickects", column="u_tickects"),
			@Result(property = "u_admin", column="u_admin")
	})
	MemberBean mypageMain(@Param("u_id")String u_id);
	
	final String VIEW_MEMBER = " SELECT u_id, u_name, u_password, u_email, u_phone, u_age, u_sex"
			+ " FROM MEMBER WHERE u_id=#{u_id} ";	
	@Select(VIEW_MEMBER)
	@Results( id= "queryResult", value= {
			@Result(property = "u_id", column="u_id"),
			@Result(property = "u_name", column="u_name"),
			@Result(property = "u_password", column="u_password"),
			@Result(property = "u_email", column="u_email"),
			@Result(property = "u_phone", column="u_phone"),
			@Result(property = "u_age", column="u_age"),
			@Result(property = "u_sex", column="u_sex")
	})
	MemberBean modifyMemberView(@Param("u_id") String u_id );
	
	final String MODIFY_MEMBER = " UPDATE MEMBER set u_password = #{u_password}, "
			+ "u_phone=#{u_phone},u_name=#{u_name}, u_email=#{u_email} where u_id = #{u_id}";
	@Update(MODIFY_MEMBER)
	void modifyMember(MemberBean memberBean);

	//탈퇴처리
	final String RESIGN_MEMBER = " DELETE FROM MEMBER WHERE u_id=#{u_id} and u_password=#{u_password}";
	@Delete(RESIGN_MEMBER)
	void resignMember(MemberBean memberBean);
	
	//마이페이지 리뷰리스트
	final String MYPAGE_REVIEWLIST = "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler from review where u_id = #{u_id}";
	@Select(MYPAGE_REVIEWLIST)
	@Results(id="mypagereview", value={
			@Result(property="r_idx",column="r_idx"),
			@Result(property="u_id",column="u_id"),
			@Result(property="m_idx",column="m_idx"),
			@Result(property="r_star",column="r_star"),
			@Result(property="r_date",column="r_date"),
			@Result(property="r_likes",column="r_likes"),
			@Result(property="r_hits",column="r_hits"),
			@Result(property="r_comments",column="r_comments"),
			@Result(property="r_memo",column="r_memo"),
			@Result(property="r_spoiler",column="r_spoiler")
	})
	ArrayList<ReviewBean> getMyReview(@Param("u_id")String u_id);

	//마이페이지 좋아요리스트
	/*
	 * final String MYPAGE_LIKE_REVIEW =
	 * "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler "
	 * + " from review where review.u_id = likereview.#{u_id}";
	 * 
	 * @Select(MYPAGE_LIKE_REVIEW)
	 * 
	 * @ResultMap("mypagereview") ArrayList<ReviewBean>
	 * getMyLikeReview(@Param("u_id")String u_id);
	 */
	
	
	
	
}



