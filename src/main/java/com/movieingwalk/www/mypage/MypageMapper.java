package com.movieingwalk.www.mypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;

@Mapper
public interface MypageMapper {

	final String MYPAGE_MAIN = " SELECT * from member where u_id=#{u_id}";

	@Select(MYPAGE_MAIN)
	@Results(id = "allResult", value = {
			@Result(property = "u_id", column = "u_id"),
			@Result(property = "u_name", column = "u_name"),
			@Result(property = "u_password", column = "u_password"),
			@Result(property = "u_email", column = "u_email"),
			@Result(property = "u_phone", column = "u_phone"),
			@Result(property = "u_age", column = "u_age"),
			@Result(property = "u_sex", column = "u_sex"),
			@Result(property = "u_reviews", column = "u_reviews"),
			@Result(property = "u_collections", column = "u_collections"),
			@Result(property = "u_liked_collections", column = "u_liked_collections"),
			@Result(property = "u_tickects", column = "u_tickects"),
			@Result(property = "u_admin", column = "u_admin") })
	MemberBean mypageMain(@Param("u_id") String u_id);

	final String VIEW_MEMBER = " SELECT u_id, u_name, u_password, u_email, u_phone, u_age, u_sex"
			+ " FROM MEMBER WHERE u_id=#{u_id} ";

	@Select(VIEW_MEMBER)
	@Results(id = "queryResult", value = {
			@Result(property = "u_id", column = "u_id"),
			@Result(property = "u_name", column = "u_name"),
			@Result(property = "u_password", column = "u_password"),
			@Result(property = "u_email", column = "u_email"),
			@Result(property = "u_phone", column = "u_phone"),
			@Result(property = "u_age", column = "u_age"),
			@Result(property = "u_sex", column = "u_sex") })
	MemberBean modifyMemberView(@Param("u_id") String u_id);

	final String MODIFY_MEMBER = " UPDATE MEMBER set u_password = #{u_password}, "
			+ "u_phone=#{u_phone},u_name=#{u_name}, u_email=#{u_email} where u_id = #{u_id}";

	@Update(MODIFY_MEMBER)
	void modifyMember(MemberBean memberBean);

	// 탈퇴처리
	final String RESIGN_MEMBER = " DELETE FROM MEMBER WHERE u_id=#{u_id} and u_password=#{u_password}";

	@Delete(RESIGN_MEMBER)
	void resignMember(MemberBean memberBean);

	// 마이페이지 리뷰리스트
	final String MYPAGE_REVIEWLIST = "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler from review where u_id = #{u_id}";

	@Select(MYPAGE_REVIEWLIST)
	@Results(id = "mypagereview", value = {
			@Result(property = "r_idx", column = "r_idx"),
			@Result(property = "u_id", column = "u_id"),
			@Result(property = "m_idx", column = "m_idx"),
			@Result(property = "r_star", column = "r_star"),
			@Result(property = "r_date", column = "r_date"),
			@Result(property = "r_likes", column = "r_likes"),
			@Result(property = "r_hits", column = "r_hits"),
			@Result(property = "r_comments", column = "r_comments"),
			@Result(property = "r_memo", column = "r_memo"),
			@Result(property = "r_spoiler", column = "r_spoiler") })
	ArrayList<ReviewBean> getMyReview(@Param("u_id") String u_id);

	// 마이페이지 좋아요리스트
	
	  final String MYPAGE_LIKE_REVIEW =
	  "select review.r_idx, review.u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler"
	  + " from review inner join reviewlike"
	  + " where review.r_idx = reviewlike.r_idx and reviewlike.u_id = #{u_id}";
	  
	  @Select(MYPAGE_LIKE_REVIEW)
	  @ResultMap("mypagereview") ArrayList<ReviewBean>
	  getMyLikeReview(@Param("u_id")String u_id);
	 
	  //마이페이지 콜렉션
	  final String MYPAGE_COLLECTIONLIST = "  SELECT * from collection where u_id=#{u_id}";
	  @Select(MYPAGE_COLLECTIONLIST)
	  @Results(id="mainResult", value= {
				@Result(property="col_idx",column="col_idx"),
				@Result(property="u_id",column="u_id"),
				@Result(property="col_title",column="col_title"),
				@Result(property="col_memo",column="col_memo"),
				@Result(property="col_midx1",column="col_movie1_idx"),
				@Result(property="col_midx2",column="col_movie2_idx"),
				@Result(property="col_midx3",column="col_movie3_idx"),
				@Result(property="col_midx4",column="col_movie4_idx"),
				@Result(property="col_midx5",column="col_movie5_idx"),
				@Result(property="col_midx6",column="col_movie6_idx"),
				@Result(property="col_midx7",column="col_movie7_idx"),
				@Result(property="col_midx8",column="col_movie8_idx"),
				@Result(property="col_midx9",column="col_movie9_idx"),
				@Result(property="col_midx10",column="col_movie10_idx")
		})
	  List<CollectionBean> getMyCollection(@Param("u_id") String u_id);
	  
	  //마이페이지 내가좋아한 콜렉션
	  final String MYPAGE_LIKE_COLLECTION = "select collection.col_idx, collection.u_id, col_movie1_idx, col_title "
	  		+ "from collection inner join collectionlike "
	  		+ " where collection.col_idx = collectionlike.col_idx and collectionlike.u_id = #{u_id}";
	  @Select(MYPAGE_LIKE_COLLECTION)
	  @Results(id="collectionlike", value= {
				@Result(property="col_idx",column="col_idx"),
				@Result(property="u_id",column="u_id"),
				@Result(property="col_title",column="col_title"),
				@Result(property="col_midx1",column="col_movie1_idx")
	  })
	  List<CollectionBean> getMyLikeCol(@Param("u_id")String u_id);

}
