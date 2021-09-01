package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.MovieBean;

@Service
public class MovieInfoServiceImpl {
	
	//비지니스 레이어
	@Autowired
	public MovieInfoDaoImpl movieInfoDao;
	
	public ArrayList<String> getReviewRank() {
		return movieInfoDao.getReviewRank();
	}
}
