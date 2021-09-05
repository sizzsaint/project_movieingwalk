package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;


@Mapper
public interface MovieInfoMapper {
	//리뷰순서로 영화 추출
	final String SELECT_BY_NEW_REVIEW = "select distinct(m_idx) from review order by r_idx limit 5" ;
	
	@Select(SELECT_BY_NEW_REVIEW)
	@Results(id="queryResult", value= {
			@Result(property="m_idx", column="m_idx")
	})
	ArrayList<String> getReviewRank();

	
	//영화 리뷰 추출
	final String SELECT_REVIEW_BY_MIDX = "select r_idx, u_id, m_idx, r_star, r_date, r_likes, r_hits, r_comments, r_memo, r_spoiler from review where m_idx = #{m_idx}";
	
	@Select(SELECT_REVIEW_BY_MIDX)
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
	ArrayList<ReviewBean> getRevieList(@Param("m_idx") int m_idx);

	
	//영화가 담긴 컬렉션 추출
	final String SELECT_COLLECTION_BY_MIDX = "select col_idx, u_id, col_title, col_memo, col_movie1_idx, col_movie2_idx, col_movie3_idx, col_movie4_idx, col_movie5_idx, col_movie6_idx, col_movie7_idx, col_movie8_idx, col_movie9_idx, col_movie10_idx from collection "
			+ "where col_movie1_idx = #{m_idx} or col_movie2_idx = #{m_idx} or col_movie3_idx = #{m_idx} or col_movie4_idx = #{m_idx} or col_movie5_idx = #{m_idx} or col_movie6_idx = #{m_idx} or col_movie7_idx = #{m_idx} or col_movie8_idx = #{m_idx} or col_movie9_idx = #{m_idx} or col_movie10_idx = #{m_idx}";
	
	@Select(SELECT_COLLECTION_BY_MIDX)
	@Results(id="colResult", value= {
			@Result(property="col_idx",column="col_idx"),
			@Result(property="u_id",column="u_id"),
			@Result(property="col_title",column="col_title"),
			@Result(property="col_memo",column="col_memo"),
			@Result(property="col_movie1_idx",column="col_movie1_idx"),
			@Result(property="col_movie2_idx",column="col_movie2_idx"),
			@Result(property="col_movie3_idx",column="col_movie3_idx"),
			@Result(property="col_movie4_idx",column="col_movie4_idx"),
			@Result(property="col_movie5_idx",column="col_movie5_idx"),
			@Result(property="col_movie6_idx",column="col_movie6_idx"),
			@Result(property="col_movie7_idx",column="col_movie7_idx"),
			@Result(property="col_movie8_idx",column="col_movie8_idx"),
			@Result(property="col_movie9_idx",column="col_movie9_idx"),
			@Result(property="col_movie10_idx",column="col_movie10_idx")
	})
	ArrayList<CollectionBean> getCollectionList(@Param("m_idx") int m_idx);
			
			
}
