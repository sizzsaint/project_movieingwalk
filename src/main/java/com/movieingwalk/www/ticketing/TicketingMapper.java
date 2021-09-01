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
	
    
    // 영화검색
    final String SEARCH_BY_STR = " select b.* from ( select a.*, ceil(rownum/#{rowsPerPage}) as page from ("
    		+ " select id,subject,name,create_date,mail,memo,hits from spring_board "
    		+ " where subject like '%'||'${searchStr}'||'%' ) a ) b where b.page=#{page}" ;

    @Select(SEARCH_BY_STR)
    @ResultMap("queryResult")
    ArrayList<TicketBean> getSearchList(@Param("page") int page, 
    		@Param("rowsPerPage") int rowsPerPage, 
    		@Param("searchStr") String searchStr);
}
