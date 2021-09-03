package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;

public interface MovieInfoDao {
	
	//최근리뷰 등록된 영화
	ArrayList<String> getReviewRank();
	
	ArrayList<ReviewBean> getReviewList(int m_idx);

}
