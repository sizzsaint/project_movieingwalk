package com.movieingwalk.www.movieinfo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;


@Controller
@RequestMapping("/movieinfo")
public class MovieInfoController {
	
	@Autowired
	MovieInfoServiceImpl movieInfoService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MovieInfoController.class);
	
	@RequestMapping(value="/Main", method = RequestMethod.GET)
	public String getReviewRank(Model model) {
		logger.debug("영화 정보 메인 페이지 호출");
		ArrayList<String> newReviewMList = movieInfoService.getReviewRank();
		//String[] genreList = {"18,80", "10749", "35", "28", "9648", "14", "99", "16"};
		//String[] genreNameList = {"crimeThriller","romance", "comedy", "action", "mystery", "fantasy", "documentary","animation"};
		//ArrayList<String[]>  genreList = new ArrayList<String[]>(Arrays.asList("18,80", "10749", "35", "28", "9648", "14", "99", "16"));
		//ArrayList<String[]> genreNameList = new ArrayList<String[]>(Arrays.asList("crimeThriller","romance", "comedy", "action", "mystery", "fantasy", "documentary","animation"));
		model.addAttribute("newReviewMList", newReviewMList);
		//model.addAttribute("genreList", genreList);
		//model.addAttribute("genreNameList", genreNameList);
		return "/movieinfo/Main";
	}
	
	@RequestMapping(value="/MovieDetail", method=RequestMethod.GET)
	public String getMovieDetail(Model model, @RequestParam("m_idx") String m_idx) {
		model.addAttribute("m_idx",m_idx);
		return "/movieinfo/MovieDetail";
	}

}
