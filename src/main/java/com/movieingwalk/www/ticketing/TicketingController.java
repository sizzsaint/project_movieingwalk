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
	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	@RequestMapping(value="/ticket", method = RequestMethod.GET)
	public String ticketing(TicketBean ticketBean) {
			logger.debug("ticketing called!!!");
		return "ticketing/ticketingMain";
	}
}
