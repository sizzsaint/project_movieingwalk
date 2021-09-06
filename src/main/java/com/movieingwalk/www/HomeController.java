package com.movieingwalk.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.mypage.MypageService;

@Controller
public class HomeController {
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/")
	public String index(Model model,String u_id) {
		MemberBean memberBean = mypageService.modifyMemberView(u_id);
		model.addAttribute("memberBean", memberBean);
		
		return "main/index";
	}
}
