package com.movieingwalk.www.review;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.login.LoginController;
import com.movieingwalk.www.mypage.MypageService;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	ReviewService service;
	@Autowired
	MypageService mypageService;
	
	//리뷰쓰기 폼
	@GetMapping(value="/writeReview")
	public String writeReview(@RequestParam("m_idx") int m_idx, Model model, ReviewBean reviewBean){
		logger.debug("리뷰작성폼");
		
		model.addAttribute("m_idx",m_idx);
		model.addAttribute("reviewBean", reviewBean);
		return "review/writeReview";
	}
	
	//리뷰쓰기 처리
	@PostMapping(value="/writeReviewOK")
	public String writeReviewOK(ReviewBean bean, Model model, int m_idx) {
		logger.debug("리뷰작성완료");
		service.writeReview(bean);
		model.addAttribute("m_idx",m_idx);
		return "review/writeReviewOK";
	}

}
