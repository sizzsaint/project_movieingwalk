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
import org.apache.ibatis.annotations.Update;

import com.movieingwalk.www.bean.ReviewBean;

/*int r_idx, m_idx, r_star, r_likes, r_hits, r_comments;
String u_id, r_date, r_memo, r_spoiler;*/

@Mapper
public interface ReviewMapper {
	
	//리뷰 작성
	final String WRITEREVIEW  ="INSERT INTO REVIEW ( m_idx, r_star, u_id, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler)"
			+ "values ( #{m_idx}, #{r_star}, #{u_id}, now(), 0, 0, 0, #{r_memo}, #{r_spoiler})";
	@Insert(WRITEREVIEW)
	void writeReview(ReviewBean bean);
	
	
	//리뷰리스트
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
	
	
	//리뷰 상세정보
	final String SELECT_REVIEWDETAIL = "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler from review where r_idx = #{r_idx}";
	
	@Select(SELECT_REVIEWDETAIL)
	@ResultMap("reviewResult")
	ReviewBean getReviewDetail(@Param("r_idx") int r_idx);
	
	
	//조회수 올리기
	final String UPDATE_HITS = "update review set r_hits = r_hits + 1 where r_idx = #{r_idx}";
	
	@Update(UPDATE_HITS)
	int hitup(int r_idx);
	
	
	//좋아요 올리기
	final String SELECT_LIKES = "select count(*) from reviewlike where r_idx = #{r_idx} and u_id = #{u_id}";
	@Select(SELECT_LIKES)
	int checkLike(int r_idx, String u_id);
	
	final String INSERT_LIKES = "insert into reviewlike (r_idx, u_id) values( #{r_idx}, #{u_id} )";
	@Insert(INSERT_LIKES)
	void likeInsert(int r_idx, String u_id);
	
	final String UPDATE_LIKES = "update review set r_likes = r_likes + 1 where r_idx = #{r_idx}";
	@Update(UPDATE_LIKES)
	int likeUpdate(int r_idx);
	
	
}
