package com.movieingwalk.www.review;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.login.LoginController;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	ReviewService service;
	
	@GetMapping(value="/write")
	public String writeReview(@RequestParam("u_id")String u_id,int m_idx, int r_star,Model model){
		MemberBean memberBean = new MemberBean();
		model.addAttribute("member",memberBean);
		model.addAttribute("u_id",u_id);
		model.addAttribute("m_idx",m_idx);
		model.addAttribute("r_star",r_star);
		logger.debug("리뷰작성폼");
		return "review/writeReview";
	}
	
	@PostMapping(value="/write")
	public String writeReviewOK(ReviewBean bean) {
		logger.debug("리뷰작성완료");
		service.writeReview(bean);
		return null;
	}

}
