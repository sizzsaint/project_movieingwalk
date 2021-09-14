package com.movieingwalk.www.ticketing;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieingwalk.www.bean.TicketBean;

@Service
public class TicketingService {
	
	@Autowired
	TicketingDao ticketingDao;

	// 예매
	public int insertTicketing(TicketBean ticketBean) {
		return ticketingDao.insertTicketing(ticketBean);		
	}

	// 예매목록
		public ArrayList<TicketBean> getticketList(String u_id) {
			// TODO Auto-generated method stub
			return ticketingDao.getticketList(u_id);
		}
	
	// 예매내역
	public TicketBean getView(String t_idx) {
		return ticketingDao.getView(t_idx);
	}

	

}
