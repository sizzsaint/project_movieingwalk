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

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	LoginService loginService;

	@RequestMapping(value="/registmember", method = RequestMethod.GET)
	public String register(Model model, MemberBean memberBean) {
			logger.debug("registerMember called!!!");
			model.addAttribute("memberBean",memberBean); //뷰 폼값 자동 매핑
		return "login/register";
	}
	
	@RequestMapping(value = "/registmember", method = RequestMethod.POST)
	public String registerOK(Model model, MemberBean memberBean) {
		logger.debug("registerMember called!!!");
		loginService.registerMember(memberBean);
		model.addAttribute("result", 1); // 뷰 폼값 자동 매핑
		return "login/registerOK";
	}
	
	@RequestMapping(value="/loginMember", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginOK() {
		return "login/loginOK";
	}

	
	
}
