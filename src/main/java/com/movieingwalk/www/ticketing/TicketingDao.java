package com.movieingwalk.www.ticketing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.TicketBean;

@Repository
public class TicketingDao {
	
	@Autowired
	TicketingMapper ticketingMapper;

	//예매
	public void insertTicketing(TicketBean ticketBean) {
		ticketingMapper.insertTicketing(ticketBean);
	}

	// 예매내역
	public TicketBean getView(String u_id) {
		// TODO Auto-generated method stub
		System.out.println("u_id:" + u_id);
		return ticketingMapper.getView(u_id);
	}
	
	
	

}
