package com.movieingwalk.www.ticketing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.TicketBean;

@Service
public class TicketingService {
	
	@Autowired
	public TicketingDao ticketingDao;

	public static TicketBean getView(String memo_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertTicket(TicketBean ticketBean) {
		TicketingDao.insertTicket(ticketBean);		
	}

}
