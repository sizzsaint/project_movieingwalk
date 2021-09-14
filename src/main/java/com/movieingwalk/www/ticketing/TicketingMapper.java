package com.movieingwalk.www.ticketing;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.MemberBean;
import com.movieingwalk.www.bean.TicketBean;

@Mapper
public interface TicketingMapper {
/**
int t_idx, u_id, m_idx, theater_idx, seat_idx;
	String t_date, tt_date;
 */	
	// 예매하기
	final String INSERT_TICKET= " INSERT INTO TICKET(u_id, theater_idx, m_idx, seat_idx, t_date, tt_date)"
			+ " values( #{u_id}, #{theater_idx}, #{m_idx}, #{seat_idx}, #{t_date}, #{tt_date} ) ";
		@Insert(INSERT_TICKET)
	void insertTicketing(TicketBean ticketBean);
	
	final String selectSeatIDxCount = "select count(t_idx) from ticket where seat_idx=#{seat_idx}";
	@Select(selectSeatIDxCount)
	int selectSeatIDxCount(TicketBean ticketBean);	
		
	    // 예매리스트 
	    final String SELECT_LIST = "select t_idx, u_id, theater_idx, m_idx, seat_idx, t_date, tt_date from ticket where u_id=#{u_id}";
	    @Select(SELECT_LIST)
		@Results(id = "ticketResult", value = {
				@Result(property = "t_idx", column = "t_idx"),
				@Result(property = "u_id", column = "u_id"),
				@Result(property = "theater_idx", column = "theater_idx"),
				@Result(property = "m_idx", column = "m_idx"),
				@Result(property = "seat_idx", column = "seat_idx"),
				@Result(property = "t_date", column = "t_date"),
				@Result(property = "tt_date", column = "tt_date")})
		ArrayList<TicketBean> getticketList(@Param("u_id") String u_id);	
		
	    // 예매내역상세 
	    final String SELECT_TICKETDETAIL = "select u_id, theater_idx, m_idx, seat_idx, t_date, tt_date from ticket where t_idx=#{t_idx}";
	    @Select(SELECT_TICKETDETAIL)
		@ResultMap("ticketResult")
	    TicketBean getView(@Param("t_idx") String t_idx);
	    
	    
 // 저 입력할때 sql 오류가나서 그것도 함 봐주시겠어요?
		

}
