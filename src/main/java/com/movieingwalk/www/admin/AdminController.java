package com.movieingwalk.www.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.movieingwalk.www.bean.MemberBean;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	//로그인전 관리자 메인페이지
	@RequestMapping(value="/beforeIndex",method = RequestMethod.GET)
	public String adBeforeIndex() {
		return "admin/beforeIndex";
	}
	
	@RequestMapping(value="/loginAdmin", method = RequestMethod.GET)
	public String adLogin(MemberBean bean) {
		return "admin/adLogin";
	}
	
	@RequestMapping(value="/loginAdmin", method = RequestMethod.POST)
	public String adLoginOK(MemberBean bean, Model model, HttpSession session){
		int checkId = adminService.checkAdId(bean);
		
		if(checkId > 0) {
			MemberBean result = adminService.showAdId(bean);
			
			if(bean.getU_password().equals(result.getU_password())) {
				model.addAttribute("result","same");
				session.setAttribute("mvAdId", result.getU_id());
			}
			else {
				model.addAttribute("result", "different");
			}
		}
		else {
			model.addAttribute("result", "noID");
		}
		return "admin/adLoginOK";
	}
}
