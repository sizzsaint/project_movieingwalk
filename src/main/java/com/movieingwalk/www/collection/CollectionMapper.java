package com.movieingwalk.www.collection;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface CollectionMapper {

	final String CollectionDetail = " SELECT * from collection where u_id=#{u_id}";
	@Select(CollectionDetail)
	@Results(id="allResult", value= {
			@Result(property = "col_idx", column="col_idx"),
			@Result(property = "u_id", column="u_id"),
			@Result(property = "col_title", column="col_title"),
			@Result(property = "col_memo", column="col_memo"),
			@Result(property = "col_movie1_idx", column="col_movie1_idx"),
			@Result(property = "col_movie2_idx", column="col_movie2_idx"),
			@Result(property = "col_movie3_idx", column="col_movie3_idx"),
			@Result(property = "col_movie4_idx", column="col_movie4_idx"),
			@Result(property = "col_movie5_idx", column="col_movie5_idx"),
			@Result(property = "col_movie6_idx", column="col_movie6_idx"),
			@Result(property = "col_movie7_idx", column="col_movie7_idx"),
			@Result(property = "col_movie8_idx", column="col_movie8_idx"),
			@Result(property = "col_movie9_idx", column="col_movie9_idx"),
			@Result(property = "col_movie10_idx", column="col_movie10_idx")
	})
	CollectionBean col_datail(@Param("col_idx")int col_idx);
	
	
	
	
	
	
}
