package com.movieingwalk.www.ticketing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.TicketBean;

@Service
public class TicketingService {
	
	@Autowired
	public TicketingDao ticketingDao;

	// 예매
	public void insertTicketing(TicketBean ticketBean) {
		ticketingDao.insertTicketing(ticketBean);		
	}

}
