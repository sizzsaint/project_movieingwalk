package com.movieingwalk.www.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.MovieBean;
import com.movieingwalk.www.bean.ReviewBean;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	//로그인전 관리자 메인페이지
	@RequestMapping(value="/adIndex",method = RequestMethod.GET)
	public String adBeforeIndex() {
		return "admin/adIndex";
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
	
	@RequestMapping(value="/adLogout")
	public String adLogout(HttpSession session) {
		session.invalidate();
		return "admin/adLogout";
	}
	
	@RequestMapping(value="/mInfo_udateSort")
	public String memberManagement1(Model model) {
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		memberList=adminService.showMembersInfo1();
		model.addAttribute("membersInfo", memberList);
		return "admin/memberManagement";
	}
	@RequestMapping(value="/mInfo_unameSort")
	public String memberManagement2(Model model) {
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		memberList=adminService.showMembersInfo2();
		model.addAttribute("membersInfo", memberList);
		return "admin/memberManagement";
	}
	@RequestMapping(value="/mInfo_uidxSort")
	public String memberManagement(Model model) {
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		memberList=adminService.showMembersInfo3();
		model.addAttribute("membersInfo", memberList);
		return "admin/memberManagement";
	}
	
	@RequestMapping(value="/moviesInfo")
	public String movieManagement(Model model) {
		ArrayList<MovieBean> movieList = new ArrayList<MovieBean>();
		movieList = adminService.showMoviesInfo();
		model.addAttribute("moviesInfo", movieList);
		return "admin/movieManagement";
	}
	
	@RequestMapping(value="/reviewsInfo")
	public String reviewManagement(Model model) {
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		reviewList = adminService.showReviewsInfo();
		model.addAttribute("reviewsInfo", reviewList);
		return "admin/reviewManagement";
	}
}
