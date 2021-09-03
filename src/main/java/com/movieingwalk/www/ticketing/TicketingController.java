package com.movieingwalk.www.ticketing;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movieingwalk.www.bean.TicketBean;

@Controller
public class TicketingController {
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
	// 날짜와 시간 지역선택
	@RequestMapping(value="/ticketings", method = RequestMethod.GET)
	public String ticketings(TicketBean ticketBean) {
			logger.debug("ticketingScheduled called!!!");
		return "ticketing/ticketing";
	}
	
	// 좌석선택
	@RequestMapping(value="/ticketings2", method = RequestMethod.GET)
	public String ticketings2(TicketBean ticketBean) {
			logger.debug("ticketing2 called!!!");
		return "ticketing/ticketing2";
	}
	
	// 예매확인
	@RequestMapping(value="/ticketdetails", method = RequestMethod.GET)
	public String ticketdetails(TicketBean ticketBean) {
			logger.debug("ticketdetails called!!!");
		return "ticketing/ticketdetails";
	}
	
}
