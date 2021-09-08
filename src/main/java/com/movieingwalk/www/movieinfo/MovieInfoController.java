package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.mypage.MypageService;


@Controller
@RequestMapping("/movieinfo")
public class MovieInfoController {
	
	@Autowired
	MovieInfoServiceImpl movieInfoService;
	@Autowired
	MypageService mypageService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MovieInfoController.class);
	//영화메인 페이지
	@RequestMapping(value="/Main", method = RequestMethod.GET)
	public String getReviewRank(Model model) {
		logger.debug("영화 정보 메인 페이지 호출");
		ArrayList<String> newReviewMList = movieInfoService.getReviewRank();
		model.addAttribute("newReviewMList", newReviewMList);
		
		return "/movieinfo/Main";
	}
	//영화 상세정보 페이지 
	@RequestMapping(value="/MovieDetail", method=RequestMethod.GET)
	public String getMovieDetail(Model model, @RequestParam("m_idx") int m_idx,String u_id) {
		logger.debug("영화 상세정보 페이지 호출");
		
		ArrayList<ReviewBean> reviewBeanList = movieInfoService.getReviewList(m_idx);
		ArrayList<CollectionBean> collectionBeanList = movieInfoService.getCollectionList(m_idx);
		model.addAttribute("m_idx",m_idx);
		model.addAttribute("reviewBeanList", reviewBeanList);
		model.addAttribute("collectionBeanList", collectionBeanList);
		MemberBean memberBean = mypageService.mypageMain(u_id);
		model.addAttribute("memberBean",memberBean);

		return "/movieinfo/MovieDetail";
	}

}
