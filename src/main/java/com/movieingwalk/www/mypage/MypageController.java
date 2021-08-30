package com.movieingwalk.www.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.login.LoginController;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	MypageService mypageService;

	//mypage main
	@RequestMapping(value = "" , method= RequestMethod.GET)
	public String mypageMain(Model model, MemberBean memberBean) {
		logger.info("Mypage메인");
		model.addAttribute("memberBean", memberBean);

		return "mypage/mypageMain";
	}
	
	
// 수정폼 불러오기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyMember(Model model, @RequestParam("u_idx") String u_idx) {
		logger.debug("회원정보수정폼");
		MemberBean memberBean = mypageService.modifyMemberView(u_idx);

		model.addAttribute("u_idx", u_idx);
		model.addAttribute("memberBean", memberBean);
		return "mypage/modifyMember";
	}

	// 수정처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyMemberOK(MemberBean memberBean, @RequestParam("u_idx") int u_idx, Model model) {
		logger.info("회원정보수정처리");
		memberBean.setU_idx(u_idx);
		mypageService.modifyMember(memberBean);
		model.addAttribute("u_idx", u_idx);

		return "mypage/modifyMemberOK";
		
	}
}
