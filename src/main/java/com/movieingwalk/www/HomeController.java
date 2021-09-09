package com.movieingwalk.www;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.login.LoginController;
import com.movieingwalk.www.mypage.MypageService;

@Controller
public class HomeController {
	
	@Autowired
	MypageService mypageService;
	@Autowired
	IndexService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/")
	public String index(Model model,String u_id) {
		MemberBean memberBean = mypageService.modifyMemberView(u_id);
		ArrayList<ReviewBean> mainRecent = service.mainpageReview();
		model.addAttribute("mainRecent",mainRecent);
		model.addAttribute("memberBean", memberBean);
		
		return "main/index";
	}
	
	
}
