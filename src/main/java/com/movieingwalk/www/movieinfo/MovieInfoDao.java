package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import com.movieingwalk.www.bean.MovieBean;

public interface MovieInfoDao {
	
	//최근리뷰 등록된 영화
	ArrayList<String> getReviewRank();

}
