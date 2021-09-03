package com.movieingwalk.www.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.login.LoginController;

@Controller
@SessionAttributes("u_id")
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	MypageService mypageService;

	//mypage main
	@RequestMapping(value = "" , method= RequestMethod.GET)
	public String mypageMain(Model model, MemberBean memberBean,@RequestParam(required = false)String u_id) {
		logger.info("Mypage메인");
		MemberBean memberBeanMain = mypageService.mypageMain(u_id);
		model.addAttribute("memberBean", memberBeanMain);
		model.addAttribute("u_id", u_id);
		return "mypage/mypageMain";
	}
	
	
	// 수정폼 불러오기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyMember(Model model, @RequestParam("u_id") String u_id ) {
	
		
		logger.debug("회원정보수정폼");
		MemberBean memberBean = mypageService.modifyMemberView(u_id);
		model.addAttribute("u_id", u_id);
		model.addAttribute("memberBean", memberBean);
		return "mypage/modifyMember";
	}

	// 수정처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyMemberOK(MemberBean memberBean, @RequestParam("u_id") String u_id, Model model) {
		logger.info("회원정보수정처리");
		memberBean.setU_id(u_id);
		mypageService.modifyMember(memberBean);
		model.addAttribute("u_id", u_id);

		return "mypage/modifyMemberOK";
		
	}
	//리뷰 목록 처리
	@RequestMapping(value = "/myreviewlist", method = RequestMethod.GET)
	public String myReview(ReviewBean ReviewBean, Model model, @RequestParam("u_id")String u_id) {
		MemberBean memberBean = mypageService.mypageMain(u_id);
		model.addAttribute("memberBean", memberBean);
		return "mypage/myreviewlist";
	}
	// 콜렉션 목록 처리
	@RequestMapping(value = "/mycollectionlist", method = RequestMethod.GET)
	public String myReview(CollectionBean collectionBean, Model model, @RequestParam("u_id")String u_id) {
		MemberBean memberBean = mypageService.mypageMain(u_id);
		model.addAttribute("memberBean", memberBean);
		return "mypage/myreviewlist";
	}
}
