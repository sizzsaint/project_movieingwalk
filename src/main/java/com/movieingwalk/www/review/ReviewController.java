package com.movieingwalk.www.review;

import java.util.List;
import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestMethod;
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
	ReviewService reviewservice;
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
		reviewservice.writeReview(bean);
		model.addAttribute("m_idx",m_idx);
		return "review/writeReviewOK";
	}
	
	//리뷰 리스트
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList(Model model, @RequestParam("m_idx") int m_idx,  @RequestParam(defaultValue="1") int curPage) {
		logger.debug("리뷰리스트 페이지 호출");
		ArrayList<ReviewBean> reviewBeanList = reviewservice.getReviewList(m_idx);
		model.addAttribute("m_idx",m_idx);
		model.addAttribute("reviewBeanList", reviewBeanList);
		
		int listCnt = reviewBeanList.size();
		Paging paging = new Paging(listCnt, curPage);
		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("paging", paging);
		return "review/reviewList";
	}
	
	//리뷰 상세보기
	@RequestMapping(value="/reviewDetail", method=RequestMethod.GET)
	public String reviewDetail(Model model, @RequestParam("r_idx") int r_idx, @RequestParam("u_id") String u_id) {
		logger.debug("리뷰 상세보기 페이지 호출");
		
		ReviewBean reviewBean = reviewservice.getReviewDetail(r_idx);
		model.addAttribute("r_idx", r_idx);
		model.addAttribute("u_id", u_id);
		model.addAttribute("reviewBean",reviewBean);
		int hits = reviewservice.hitup(r_idx);
		model.addAttribute("hits", hits);
		
		int checkLikes = reviewservice.checkLike(r_idx, u_id);
		model.addAttribute("checkLikes", checkLikes);
		
		return "review/reviewDetail";
	}
	
		//좋아요 처리
		@RequestMapping(value="/likeUpdate", method=RequestMethod.GET)
		public String likeUpdate(Model model, @RequestParam("r_idx") int r_idx, @RequestParam("u_id") String u_id) {
			logger.debug("리뷰 좋아요 처리페이지 호출");

			int likes = reviewservice.likeUpdate(r_idx);
			
			reviewservice.likeInsert(r_idx,u_id);
			
			model.addAttribute("r_idx", r_idx);
			model.addAttribute("u_id", u_id);
			model.addAttribute(likes);
			
			return "review/likeUpdate";
		}
		

}
