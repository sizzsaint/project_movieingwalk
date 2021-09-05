package com.movieingwalk.www.ticketing;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.TicketBean;

@Mapper
public interface TicketingMapper {
/**
int t_idx, u_idx, m_idx, theater_idx, seat_idx;
	String t_date;
 */	
	final String REGISTERT = " INSERT INTO ticket(t_idx, u_idx, m_idx, theater_idx, seat_idx,t_date)"
			+ " values( #{t_idx}, #{u_idx}, #{m_idx}, #{theater_idx}, #{seat_idx}, #{t_date})";
	
	@Insert(REGISTERT)
	void registerTicketing(TicketBean ticketBean);
	
	// 예매하기
}
