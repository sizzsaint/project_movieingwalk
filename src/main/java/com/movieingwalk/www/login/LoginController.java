package com.movieingwalk.www.login;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public @ResponseBody int idCheck(@RequestParam("u_id")MemberBean u_id) {
		int cnt = loginService.checkId(u_id);
		return cnt;
	}
	
	@RequestMapping(value="/loginMember", method = RequestMethod.GET)
	public String login(MemberBean bean) {
		return "login/login";
	}
	
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginOK(MemberBean bean,Model model,HttpSession session) {
		int checkId = loginService.checkId(bean);
		
		//입력한 아이디가 존재한다면
		if(checkId > 0) {
			MemberBean result=loginService.loginMember(bean);
			
			//result: DB에서 가져온 값이 들어있다.
			//bean: 내가 폼에서 입력한 값이 들어있다.
			
			//model에 데이터를 저장해서 loginOK.jsp에 값 전달!
	
			//LoginMapper.java에서 실행한 select문에 의해 추출된 u_password => result.getU_password()
			//내가 입력한 비밀번호가 일치하는지 확인.
			if(bean.getU_password().equals(result.getU_password())) {
				model.addAttribute("result","same");
				session.setAttribute("mvId", result.getU_id());
			}
			else{
				model.addAttribute("result","different");
			}
		}
		
		//입력한 아이디가 존재하지 않는다면
		else {
			model.addAttribute("result", "noID");
		}
		return "login/loginOK";
	}
	
	@RequestMapping(value="/searchInfo", method = RequestMethod.GET)
	public String search(MemberBean bean,Model model) {
		return "login/search";
	}
	
	@RequestMapping(value="/search_id_Info",method = RequestMethod.POST)
	public String id_searchOK(MemberBean bean,Model model) {
		int result = loginService.searchId(bean);
		
		//입력한 정보가 모두 일치하는 아이디가 존재한다.
		if(result == 1) {
			MemberBean showId = loginService.showId(bean);
			model.addAttribute("UserId",showId.getU_id());
		}
		else {
			model.addAttribute("UserId","none");
		}
		return "login/searchIdOK";
	}
	
	@RequestMapping(value="/search_pw_Info",method = RequestMethod.POST)
	public String pw_searchOK(MemberBean bean,Model model) {
		int result = loginService.searchPw(bean);
				
		//입력한 정보가 모두 일치하는 비밀번호가 존재한다.
		if(result == 1) {
			MemberBean showPw = loginService.showPw(bean);
			model.addAttribute("UserPw",showPw.getU_password());
		}
		else {
			model.addAttribute("UserPw","none");
		}
		return "login/searchPwOK";
	}
	
	@RequestMapping(value = "/logoutMember")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/logout";
	}
}
