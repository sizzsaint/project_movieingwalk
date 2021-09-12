package com.movieingwalk.www.ticketing;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.TicketBean;

@Controller
public class TicketingController {
	
	@Autowired	
	TicketingService ticketingService ;
	
	// 로그
	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	// 메인
	@RequestMapping(value="/ticket", method = RequestMethod.GET)
	public String ticketing(TicketBean ticketBean) {
			logger.debug("ticketing called!!!");	
		return "ticketing/ticketingMain";
	}
	
	// 상영작
	@RequestMapping(value="/ticketScr", method = RequestMethod.GET)
	public String ticketScr(TicketBean ticketBean) {
			logger.debug("ticketingScreen called!!!");
		return "ticketing/ticketingScreen";
	
	}		
	// 개봉예정작
	@RequestMapping(value="/ticketSch", method = RequestMethod.GET)
	public String ticketSch(TicketBean ticketBean) {
			logger.debug("ticketingScheduled called!!!");
		return "ticketing/ticketingScheduled";
	}
	// 예매 폼
	@RequestMapping(value="/ticketings", method = RequestMethod.GET)
	public String ticketings(Model model,TicketBean ticketBean) {
			logger.debug("ticketingScheduled called!!!");			
			model.addAttribute("ticketBean", ticketBean) ;  // 뷰 폼값 자동 매핑 			
		return "ticketing/ticketing";
	}

	// 예매
	@PostMapping("/ticketings")
	public String ticketDetails(
			@ModelAttribute("ticketBean")TicketBean ticketbean,
			@RequestParam("u_id") String u_id,
			Model model) {
		ticketingService.insertTicketing(ticketbean);
	
		System.out.println(ticketbean.toString());
		
//		TicketBean tb = ticketbean.toEntity();
		/*Integer a = ticketbean.getT_idx();
		String b = ticketbean.getU_id();
		Integer c = ticketbean.getM_idx();
		Integer d = ticketbean.getTheater_idx();
		Integer e = ticketbean.getSeat_idx();
		String f = ticketbean.getT_date();	*/
		return "ticketing/ticketDetails";
	}
	//예매처리 
/*	@RequestMapping(value = "/ticketings", method = RequestMethod.POST )
	public String ticketDetails(Model model, TicketBean ticketBean,
			@RequestParam("u_id") String u_id) { //여기서는 u_id도 받아오셔야할것같고
		logger.debug("ticketingScheduled called!!!");
		ticketingService.insertTicketing(ticketBean, u_id);
		model.addAttribute("result", 1) ; // 뷰 폼값 자동 매핑 		
		model.addAttribute("u_id",u_id);
		return "ticketing/ticketDetails";
	}
	*/
	// 예매내역확인 viewBoard.do
	/*@RequestMapping(value = "/viewBoard.do", method = RequestMethod.GET )
	public String viewBoard(Model model,
		 @RequestParam("memo_id") String memo_id
		,@RequestParam("current_page") String current_page) {
	
	logger.debug("글보기가 호출 되었습니다");
	System.out.println("memo_id : "+memo_id);
	TicketBean ticketBean =  TicketingService.getView(memo_id) ;
	
	model.addAttribute("memo_id", memo_id ) ;
	model.addAttribute("current_page",current_page) ; 
	model.addAttribute("ticketBean",ticketBean) ; 
	
	return "viewBoard";
	}*/
}
