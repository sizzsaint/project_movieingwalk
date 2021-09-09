package com.movieingwalk.www;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.ReviewBean;

@Service
public class IndexService {

	@Autowired
	IndexDao dao;
	
	public ArrayList<ReviewBean> mainpageReview(){
		return dao.mainpageReview();
	}
}
