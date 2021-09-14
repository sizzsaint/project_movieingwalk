package com.movieingwalk.www.ticketing;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.TicketBean;

@Mapper
public interface TicketingMapper {
/**
int t_idx, u_id, m_idx, theater_idx, seat_idx;
	String t_date;
 */	
	// 입력처리?
	final String INSERT_TICKET= " INSERT INTO TICKET(u_id, theater_idx, m_idx, seat_idx, t_date)"
			+ " values( #{u_id}, #{theater_idx}, #{m_idx}, #{seat_idx}, #{t_date} )";
		@Insert(INSERT_TICKET)
	void insertTicketing(TicketBean ticketBean);
		
	    // 예매내역확인 
	    final String SELECT_BY_ID = "select u_id, theater_idx, m_idx, seat_idx, t_date)"
	    		+ " from ticket where u_id=#{u_id}";
	    
	    @Select(SELECT_BY_ID)
	    TicketBean getView(@Param("u_id") String u_id) ;
	
}
