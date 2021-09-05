package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;

@Repository
public class MovieInfoDaoImpl implements MovieInfoDao{
	
	@Autowired
	private MovieInfoMapper movieInfoMapper;
	
	
	public ArrayList<String> getReviewRank() {
		return movieInfoMapper.getReviewRank();
	}
	
	public ArrayList<ReviewBean> getReviewList(int m_idx){
		return movieInfoMapper.getRevieList(m_idx);
	}
	
	public ArrayList<CollectionBean> getCollectionList(int m_idx){
		return movieInfoMapper.getCollectionList(m_idx);
	}

}
