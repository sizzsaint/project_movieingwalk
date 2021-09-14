package com.movieingwalk.www.ticketing;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieingwalk.www.bean.TicketBean;

@Repository
public class TicketingDao {
	
	@Autowired
	TicketingMapper ticketingMapper;

	//예매
	public int insertTicketing(TicketBean ticketBean) {
		
		//where not exists (select seat_idx from ticket where seat_idx=#{seat_idx})
		int result=ticketingMapper.selectSeatIDxCount(ticketBean);
		if(result==0) {
			System.out.println( "등록 데이터 :"+ ticketBean.toString());
			ticketingMapper.insertTicketing(ticketBean);	
		}
		return result;
	}
	//예매리스트
		public ArrayList<TicketBean> getticketList(String u_id) {
			// TODO Auto-generated method stub
			return ticketingMapper.getticketList(u_id);
		}
	// 예매내역
	public TicketBean getView(String t_idx) {
		// TODO Auto-generated method stub
		return ticketingMapper.getView(t_idx);
	}
	

	
	
	

}
