package com.movieingwalk.www.ticketing;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
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
	
 /*   // 예매확인 - 일부반환
    final String SELECT_TICKET= "select * from (select a.*, ceil(rownum/#{rowsPerPage}) as page from ("
    		+ "select t_idx, u_idx, m_idx, theater_idx, seat_idx, t_date order by id desc ) a ) b where b.page=#{page}" ;
    @Select(SELECT_TICKET)
    @Results(id = "queryResult", value={
			@Result(property = "t_idx",column = "t_idx") ,
			@Result(property = "u_id",column = "u_id") ,
			@Result(property = "m_idx",column = "m_idx") ,
			@Result(property = "theater_idx",column = "theater_idx") ,
			@Result(property = "seat_idx",column = "seat_idx") ,
			@Result(property = "t_date",column = "t_date") } )
    ArrayList<TicketBean> getList(@Param("page") int page, @Param("rowsPerPage") int rowsPerPage);
    
    // 글보기 // 예매확인용? 수정중
    final String SELECT_BY_ID = "select t_idx,seat_idx,t_date"
    		+ " from ticket where t_idx=#{t_idx}";
    
    @Select(SELECT_BY_ID)
    @ResultMap("queryResult")
    TicketBean getView(@Param("t_idx") String t_idx) ;
    */
}
