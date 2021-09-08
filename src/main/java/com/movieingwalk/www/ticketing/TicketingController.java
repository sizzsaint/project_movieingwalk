package com.movieingwalk.www.ticketing;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	// 예매 - 날짜와 시간 지역선택
	@RequestMapping(value="/ticketings", method = RequestMethod.GET)
	public String ticketings(Model model,TicketBean ticketBean, HttpServletRequest httpServletRequest) {
			logger.debug("ticketingScheduled called!!!");
			model.addAttribute("ticketBean", ticketBean) ; 
		return "ticketing/ticketing";
	}
	//예매처리 - 날짜와 시간
	@RequestMapping(value = "/ticketdateok", method = RequestMethod.POST )
	public String ticketingDateok(Model model, TicketBean ticketBean) {
		logger.debug("ticketDateok called!!!");
		ticketingService.insertTicket(ticketBean);
		model.addAttribute("result", 1) ; // 뷰 폼값 자동 매핑 		
		return "ticketing/ticketDateok";
	}
	
	// 예매 - 좌석선택 
	@RequestMapping(value="/ticketings2", method = RequestMethod.GET)
	public String ticketings2(TicketBean ticketBean, HttpServletRequest httpServletRequest,
			Model model) {
			logger.debug("ticketing2 called!!!");
			model.addAttribute("ticketBean", ticketBean) ; // 뷰 폼값 자동 매핑
		return "ticketing/ticketing2";
	}

	//예매처리 - 좌석
	@RequestMapping(value = "/ticketDetails", method = RequestMethod.POST )
	public String writeBoardOk(Model model, TicketBean ticketBean) {
		logger.debug("ticketdetails called!!!");
		ticketingService.insertTicket(ticketBean);
		model.addAttribute("result", 1) ; // 뷰 폼값 자동 매핑 
		
		return "ticketing/ticketDetails";
	}
	
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
