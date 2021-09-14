package com.movieingwalk.www.collection;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface CollectionMapper {
	
	//컬렉션 디테일
	final String CollectionDetail = " SELECT * from collection where col_idx=#{col_idx}";
	@Select(CollectionDetail)
	@Results(id="allResult", value= {
			@Result(property = "col_idx", column="col_idx"),
			@Result(property = "u_id", column="u_id"),
			@Result(property = "col_title", column="col_title"),
			@Result(property = "col_memo", column="col_memo"),
			@Result(property = "col_midx1", column="col_movie1_idx"),
			@Result(property = "col_midx2", column="col_movie2_idx"),
			@Result(property = "col_midx3", column="col_movie3_idx"),
			@Result(property = "col_midx4", column="col_movie4_idx"),
			@Result(property = "col_midx5", column="col_movie5_idx"),
			@Result(property = "col_midx6", column="col_movie6_idx"),
			@Result(property = "col_midx7", column="col_movie7_idx"),
			@Result(property = "col_midx8", column="col_movie8_idx"),
			@Result(property = "col_midx9", column="col_movie9_idx"),
			@Result(property = "col_midx10", column="col_movie10_idx")
	})
	CollectionBean col_datail(@Param("col_idx")int col_idx);
	
	
	//컬렉션 만들기
	
	final String INSERT_COLLECTION ="insert into collection(u_id, col_title, col_memo, col_movie1_idx, col_movie2_idx, col_movie3_idx, col_movie4_idx, col_movie5_idx, col_movie6_idx, col_movie7_idx, col_movie8_idx, col_movie9_idx, col_movie10_idx)"
									+"values (#{u_id}, #{col_title}, #{col_memo}, #{col_midx1}, #{col_midx2}, #{col_midx3}, #{col_midx4}, #{col_midx5}, #{col_midx6}, #{col_midx7}, #{col_midx8}, #{col_midx9}, #{col_midx10})";
	@Insert(INSERT_COLLECTION)
	void insertCollection(CollectionBean collectionBean);
	
	//컬렉션 리스트
	final String SELECT_COLLECTIONLIST = "select col_idx, u_id, col_title, col_memo, col_movie1_idx, col_movie2_idx, col_movie3_idx, col_movie4_idx, col_movie5_idx, col_movie6_idx, col_movie7_idx, col_movie8_idx, col_movie9_idx, col_movie10_idx from collection "
			+ "where col_movie1_idx = #{m_idx} or col_movie2_idx = #{m_idx} or col_movie3_idx = #{m_idx} or col_movie4_idx = #{m_idx} or col_movie5_idx = #{m_idx} or col_movie6_idx = #{m_idx} or col_movie7_idx = #{m_idx} or col_movie8_idx = #{m_idx} or col_movie9_idx = #{m_idx} or col_movie10_idx = #{m_idx}";
	
	@Select(SELECT_COLLECTIONLIST)
	@Results(id="colResult", value= {
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
	ArrayList<CollectionBean> getCollectionList(int m_idx);
	
	
	//컬렉션 메인
	final String SELECT_COL_LIKED = "select * from collection order by col_likes desc";
	@Select(SELECT_COL_LIKED)
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
	ArrayList<CollectionBean> getMainCollection();
	
	//좋아요 올리기
	final String SELECT_LIKES = "select count(*) from collectionlike where col_idx = #{col_idx} and u_id = #{u_id}";
	@Select(SELECT_LIKES)
	int checkLike(int col_idx, String u_id);
	
	final String INSERT_LIKES = "insert into collectionlike (col_idx, u_id) values( #{col_idx}, #{u_id} )";
	@Insert(INSERT_LIKES)
	void likeInsert(int col_idx, String u_id);
	
	final String UPDATE_LIKES = "update collection set col_likes = col_likes + 1 where col_idx = #{col_idx}";
	@Update(UPDATE_LIKES)
	int likeUpdate(int col_idx);
	

	
	
			}
