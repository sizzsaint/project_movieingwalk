package com.movieingwalk.www.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.login.LoginController;
import com.movieingwalk.www.login.LoginService;
import com.movieingwalk.www.review.Paging;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	MypageService mypageService;
	@Autowired
	LoginService loginService;

	//mypage main
	@RequestMapping(value = "" , method= RequestMethod.GET)
	public String mypageMain(Model model, MemberBean memberBean,@RequestParam(required = false)String u_id,
			HttpSession session) {
		logger.info("Mypage메인");
		MemberBean memberBeanMain = mypageService.mypageMain(u_id);
		model.addAttribute("memberBean", memberBeanMain);
		model.addAttribute("u_id", u_id);
		session.setAttribute("u_id", u_id);
		return "mypage/mypageMain";
	}
	
	
	// 수정폼 불러오기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyMember(Model model, @RequestParam("u_id") String u_id ) {
	
		
		logger.info("회원정보수정폼");
		MemberBean memberBean = mypageService.modifyMemberView(u_id);
		model.addAttribute("u_id", u_id);
		model.addAttribute("memberBean", memberBean);
		return "mypage/modifyMember";
	}

	// 수정처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyMemberOK( @ModelAttribute MemberBean memberBean, Model model) {
		logger.info("회원정보수정처리");

		mypageService.modifyMember(memberBean);
		model.addAttribute("memberBean",memberBean);

		return "mypage/modifyMemberOK";
	}
	
	//탈퇴폼
	@RequestMapping(value = "/resign", method = RequestMethod.GET)
	public String resignMember(Model model, @RequestParam("u_id") String u_id) {
		logger.info("회원탈퇴폼");
		MemberBean memberBean = mypageService.resignMember(u_id);
		model.addAttribute("u_id", u_id);
		model.addAttribute("memberBean", memberBean);
		return "mypage/resignMember";
	}
	
	//탈퇴처리
	@RequestMapping(value = "/resign", method = RequestMethod.POST)
	public String resignMemberOK(
			MemberBean memberBean,
			Model model,
			HttpSession session) {
		logger.info("회원탈퇴처리");
		MemberBean u_id1 = loginService.loginMember(memberBean);
		String existPw = u_id1.getU_password();
		String inputPw = memberBean.getU_password();
		
		if(existPw.equals(inputPw)) {
			mypageService.resignMemberOK(memberBean);
			model.addAttribute("result","same");
			model.addAttribute("memberBean", memberBean);
			session.invalidate();
		}else {
			model.addAttribute("result","diff");
		}
		return "mypage/resignMemberOK";
	}
	
	//마이리뷰 메뉴
	@RequestMapping(value="/myreviewlist", method =RequestMethod.GET)
	public String myReviewList(Model model, @RequestParam("u_id")String u_id) {
		logger.info("마이페이지 리뷰");
		ArrayList<ReviewBean> myReviewList = mypageService.getMyReview(u_id);
		ArrayList<ReviewBean> getMyLikeReview = mypageService.getMyLikeReview(u_id);
		model.addAttribute("u_id",u_id);
		model.addAttribute("myReviewList",myReviewList);
		model.addAttribute("getMyLikeReview",getMyLikeReview);

		return "mypage/myreviewlist";
	}
	//내가쓴 리뷰
	@RequestMapping(value="/myreviewall", method = RequestMethod.GET)
	public String myReviewAll(Model model, @RequestParam("u_id")String u_id, @RequestParam(defaultValue="1") int curPage) {
		ArrayList<ReviewBean> myReviewList = mypageService.getMyReview(u_id);
		model.addAttribute("myReviewList",myReviewList);
		model.addAttribute("u_id",u_id);

		int listCnt = myReviewList.size();
		Paging paging = new Paging(listCnt, curPage);
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("paging",paging);
		return "mypage/myReviewAll";
	}
	
	// 내가좋아요한 리뷰
	@RequestMapping(value="/likesreviewall", method = RequestMethod.GET)
	public String likesReviewAll(Model model, @RequestParam("u_id")String u_id, @RequestParam(defaultValue="1") int curPage) {
		ArrayList<ReviewBean> getMyLikeReview = mypageService.getMyLikeReview(u_id);
		model.addAttribute("getMyLikeReview",getMyLikeReview);
		model.addAttribute("u_id",u_id);

		int listCnt = getMyLikeReview.size();
		Paging paging = new Paging(listCnt, curPage);
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("paging",paging);
		return "mypage/likesReviewAll";
	}
	
	//마이콜렉션 메뉴
	@RequestMapping(value="/mycollection", method=RequestMethod.GET)
	public String myCollection(Model model, @RequestParam("u_id")String u_id) {
		List<CollectionBean> myCollectionList = mypageService.getMyCollection(u_id);
		model.addAttribute("u_id",u_id);
		model.addAttribute("myCollectionList",myCollectionList);
		
				
		return "mypage/mycollectionlist";
	}
	
	
}
