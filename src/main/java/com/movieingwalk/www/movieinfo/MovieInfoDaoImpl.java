package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.MovieBean;

@Repository
public class MovieInfoDaoImpl implements MovieInfoDao{
	
	@Autowired
	private MovieInfoMapper movieInfoMapper;
	
	
	public ArrayList<String> getReviewRank() {
		return movieInfoMapper.getReviewRank();
	}

}
