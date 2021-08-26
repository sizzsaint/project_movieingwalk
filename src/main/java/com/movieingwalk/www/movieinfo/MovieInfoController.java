package com.movieingwalk.www.movieinfo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/movieinfo")
public class MovieInfoController {
	
	//@Autowired
	//MovieServiceImpl MovieService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MovieInfoController.class);
	
	@RequestMapping(value="/Main", method = RequestMethod.GET)
	public String Main(Model model,MovieBean movieBean) {
		logger.debug("영화 정보 메인 페이지 호출");
		model.addAttribute("movieBean",movieBean);
		return "/movieinfo/Main";
	}

}
