package com.movieingwalk.www.login;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.movieingwalk.www.bean.MemberBean;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/registmember", method = RequestMethod.GET)
	public String register(Model model, MemberBean memberBean) {
		logger.info("registerMember called!!!");
		model.addAttribute("memberBean",memberBean); 
		return "login/register";
	}
	
	@RequestMapping(value = "/registmember", method = RequestMethod.POST)
	public String registerOK(Model model, MemberBean memberBean) {
		logger.info("registerMember called!!!");
		loginService.registerMember(memberBean);
		model.addAttribute("result", 1); 
		return "login/registerOK";
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public  int idCheck(@RequestBody String u_id, Model model) {
		int result = loginService.check_Id(u_id);
		System.out.println(result);
		model.addAttribute("u_id",u_id);
		model.addAttribute("result",result);
		System.out.println("u_id=" + u_id);

		return result;

	}
	
	@RequestMapping(value="/loginMember", method = RequestMethod.GET)
	public String login(MemberBean bean) {
		return "login/login";
	}
	
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginOK(MemberBean bean,Model model,HttpSession session) {
		int checkId = loginService.checkId(bean);
			
		//????????? ???????????? ???????????????
		if(checkId > 0) {
			MemberBean result=loginService.loginMember(bean);
			
			//result: DB?????? ????????? ?????? ????????????.
			//bean: ?????? ????????? ????????? ?????? ????????????.
			
			//model??? ???????????? ???????????? loginOK.jsp??? ??? ??????!
	
			//LoginMapper.java?????? ????????? select?????? ?????? ????????? u_password => result.getU_password()
			//?????? ????????? ??????????????? ??????????????? ??????.
			if(bean.getU_password().equals(result.getU_password())) {
				model.addAttribute("result","same");
				session.setAttribute("mvId", result.getU_id());
			}
			else{
				model.addAttribute("result","different");
			}
		}
		
		//????????? ???????????? ???????????? ????????????
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
		
		//????????? ????????? ?????? ???????????? ???????????? ????????????.
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
				
		//????????? ????????? ?????? ???????????? ??????????????? ????????????.
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
