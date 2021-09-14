package com.movieingwalk.www.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.MemberBean;
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
	
	//회원아이디로 검색-->회원정보 출력
	@RequestMapping(value="/searchInfo", method=RequestMethod.POST)
	public String searchInfo(Model model, @RequestParam(value="id")String id) {
		/* System.out.println(id); */
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
		memberList = adminService.searchMember(id);
		model.addAttribute("membersInfo", memberList);
		return "admin/memberManagement";
	}
	
	
	//회원삭제
	@RequestMapping(value="/deleteMember", method = RequestMethod.GET)
	public String deleteMember(Model model, @RequestParam String u_id) {
		adminService.deleteMember(u_id);
		model.addAttribute("remove", "member");
		return "admin/removeOK";
	}
	//리뷰삭제
	@RequestMapping(value="/deleteReview", method = RequestMethod.GET)
	public String deleteReview(Model model, @RequestParam String r_idx) {
		adminService.deleteReview(r_idx);
		model.addAttribute("remove", "review");
		return "admin/removeOK";
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
	
	
	@RequestMapping(value="/rInfo_rstarSort")
	public String reviewManagement1(Model model) {
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		reviewList = adminService.showReviewsInfo1();
		model.addAttribute("reviewsInfo", reviewList);
		return "admin/reviewManagement";
	}
	@RequestMapping(value="/rInfo_rdateSort")
	public String reviewManagement2(Model model) {
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		reviewList = adminService.showReviewsInfo2();
		model.addAttribute("reviewsInfo", reviewList);
		return "admin/reviewManagement";
	}
	@RequestMapping(value="/rInfo_rlikesSort")
	public String reviewManagement3(Model model) {
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		reviewList = adminService.showReviewsInfo3();
		model.addAttribute("reviewsInfo", reviewList);
		return "admin/reviewManagement";
	}
	@RequestMapping(value="/rInfo_rhitsSort")
	public String reviewManagement4(Model model) {
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		reviewList = adminService.showReviewsInfo4();
		model.addAttribute("reviewsInfo", reviewList);
		return "admin/reviewManagement";
	}
	@RequestMapping(value="/rInfo_rcommentsSort")
	public String reviewManagement5(Model model) {
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		reviewList = adminService.showReviewsInfo5();
		model.addAttribute("reviewsInfo", reviewList);
		return "admin/reviewManagement";
	}
}
