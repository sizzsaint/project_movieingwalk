package com.movieingwalk.www.ticketing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.TicketBean;

@Repository
public class TicketingDao {
	
	// 매퍼클라이언트
	@Autowired// 자동으로 빈 주입
	private static TicketingMapper ticketingMapper;

	//예매
	public void insertTicketing(TicketBean ticketBean) {
		ticketingMapper.insertTicketing(ticketBean);
	}
	
	
	

}
