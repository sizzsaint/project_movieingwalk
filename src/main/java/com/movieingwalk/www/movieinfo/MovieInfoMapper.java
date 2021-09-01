package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import com.movieingwalk.www.bean.MovieBean;


@Mapper
public interface MovieInfoMapper {
	
	final String SELECT_BY_NEW_REVIEW = "select distinct(m_idx) from review order by r_idx limit 5" ;
	
	@Select(SELECT_BY_NEW_REVIEW)
	@Results(id="queryResult", value= {
			@Result(property="m_idx", column="m_idx")
	})
	ArrayList<String> getReviewRank();

	
}
