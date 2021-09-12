package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.bean.RstarBean;

@Service
public class MovieInfoServiceImpl {
	
	//비지니스 레이어
	@Autowired
	public MovieInfoDaoImpl movieInfoDao;
	
	public ArrayList<String> getReviewRank() {
		return movieInfoDao.getReviewRank();
	}
	
	public ArrayList<ReviewBean> getReviewList(int m_idx){
		return movieInfoDao.getReviewList(m_idx);
	}
	
	public ArrayList<CollectionBean> getCollectionList(int m_idx){
		return movieInfoDao.getCollectionList(m_idx);
	}
	
	public RstarBean getRstar(int m_idx) {
		return movieInfoDao.getRstar(m_idx);
	}
}
