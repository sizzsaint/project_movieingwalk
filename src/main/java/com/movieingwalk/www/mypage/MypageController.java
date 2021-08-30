package com.movieingwalk.www.mypage;

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
	
	@RequestMapping(value ="/modify" , method=RequestMethod.GET)
	public String modifyMember(Model model, 
			@RequestParam("u_id") String u_id) {
		logger.debug("회원정보수정폼");
		MemberBean memberBean = mypageService.modifyMember(u_id);
		
		model.addAttribute("u_id",u_id);
		model.addAttribute("memberBean",memberBean);
		return "mypage/modifyMember";
		
		/*
		 * @RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET) public
		 * String updateBoard(
		 * 
		 * @RequestParam("memo_id") String memo_id,
		 * 
		 * @RequestParam("current_page") String current_page, Model model ) {
		 * logger.info("updateBoard called!"); BoardBean boardBean =
		 * boardService.getEditView(memo_id);
		 * 
		 * model.addAttribute("memo_id",memo_id); model.addAttribute("current_page",
		 * current_page); model.addAttribute("boardBean", boardBean); return
		 * "updateBoard"; }
		 */
		
		
		
		
	}
	
	

}
