package com.movieingwalk.www.bean;

import org.springframework.stereotype.Repository;

@Repository
public class TicketBean {
	
	int t_idx, m_idx, theater_idx, seat_idx;
	String t_date, u_id;

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getT_idx() {
		return t_idx;
	}

	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}


	public int getTheater_idx() {
		return theater_idx;
	}

	public void setTheater_idx(int theater_idx) {
		this.theater_idx = theater_idx;
	}

	public int getSeat_idx() {
		return seat_idx;
	}

	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

}
