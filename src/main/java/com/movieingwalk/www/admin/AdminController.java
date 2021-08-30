package com.movieingwalk.www.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/beforeIndex",method = RequestMethod.GET)
	public String adBeforeIndex() {
		logger.debug("로그인 전-관리자페이지 호출");
		return "admin/beforeIndex";
	}
}
