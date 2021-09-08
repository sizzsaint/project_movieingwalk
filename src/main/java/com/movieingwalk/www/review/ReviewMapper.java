package com.movieingwalk.www.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.ReviewBean;

/*int r_idx, m_idx, r_star, r_likes, r_hits, r_comments;
String u_id, r_date, r_memo, r_spoiler;*/

@Mapper
public interface ReviewMapper {
	
	
	final String WRITEREVIEW  ="INSERT INTO REVIEW ( m_idx, r_star, u_id, r_date, r_memo, r_spoiler)"
			+ "values ( #{m_idx}, #{r_star}, #{u_id}, now(), #{r_memo}, #{r_spoiler})";
	@Insert(WRITEREVIEW)
	void writeReview(ReviewBean bean);
	
	final String SELECT_REVIEWLIST = "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler from review where m_idx = #{m_idx}";
	
	@Select(SELECT_REVIEWLIST)
	@Results(id="reviewResult", value={
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
	ArrayList<ReviewBean> getReviewList(@Param("m_idx") int m_idx);
	
	final String SELECT_REVIEWDETAIL = "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler from review where r_idx = #{r_idx}";
	
	@Select(SELECT_REVIEWDETAIL)
	@ResultMap("reviewResult")
	ReviewBean getReviewDetail(@Param("r_idx") int r_idx);
	

}
