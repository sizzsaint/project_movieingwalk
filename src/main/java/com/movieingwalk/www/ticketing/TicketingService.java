package com.movieingwalk.www.ticketing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.TicketBean;

@Service
public class TicketingService {
	
	@Autowired
	TicketingDao ticketingDao;

	// 예매
	public void insertTicketing(TicketBean ticketBean) {
		ticketingDao.insertTicketing(ticketBean);		
	}

	// 예매내역
	public TicketBean getView(String u_id) {
		// TODO Auto-generated method stub
		return ticketingDao.getView(u_id);
	}

}
