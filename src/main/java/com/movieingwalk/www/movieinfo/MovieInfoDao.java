package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.bean.RstarBean;

public interface MovieInfoDao {
	
	//최근리뷰 등록된 영화
	ArrayList<String> getReviewRank();
	//리뷰리스트
	ArrayList<ReviewBean> getReviewList(int m_idx);
	//컬렉션리스트
	ArrayList<CollectionBean> getCollectionList(int m_idx);
	
	RstarBean getRstar(int m_idx);
}
