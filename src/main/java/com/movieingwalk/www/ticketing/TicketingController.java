package com.movieingwalk.www.ticketing;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.TicketBean;

@Controller
public class TicketingController {
	
	@Autowired	
	TicketingService ticketingService ;	

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
	@GetMapping(value = "/ticketings")
	public String ticketings(@RequestParam("m_idx")int m_idx, Model model, TicketBean ticketbean) {
			logger.debug("예매폼호출");	
			
			model.addAttribute("m_idx", m_idx);
			model.addAttribute("ticketbean", ticketbean) ; 			
		return "ticketing/ticketing";
	}

	// 예매처리
	@PostMapping(value = "/ticketings2")
	public String ticketingOK(TicketBean ticketbean, Model model, int m_idx){
		logger.debug("예매완료");
		ticketingService.insertTicketing(ticketbean);
		model.addAttribute("m_idx", m_idx);
		return "ticketing/ticketings2";
	}

	// 예매내역보기 
	@RequestMapping(value = "/ticketdetails", method = RequestMethod.GET )
	public String viewBoard(Model model,
		 @RequestParam("u_id") String u_id) {
	
	logger.debug("예매내역보기 호출");
	System.out.println("u_id : "+u_id);
	TicketBean ticketbean =  ticketingService.getView(u_id) ;
	
	model.addAttribute("u_id", u_id ) ;
	model.addAttribute("ticketbean",ticketbean) ; 
	
	return "/login/ticketDetails";
}

}
