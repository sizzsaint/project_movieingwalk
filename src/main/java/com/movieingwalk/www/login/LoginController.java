package com.movieingwalk.www.login;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.movieingwalk.www.bean.MemberBean;
@Controller
public class LoginController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginController.class);
	@Autowired
	LoginService loginservice;
	
	@RequestMapping(value="/registermember", method = RequestMethod.POST)
	public String index(Model model, MemberBean memberBean) {
		
			logger.debug("registerMember called!!!");
			loginservice.registerMember(memberBean);
			model.addAttribute("result",1); //뷰 폼값 자동 매핑
			
		
		return "login/register";
	}

	
	
	
	
	
	
	
	
	
	
}
