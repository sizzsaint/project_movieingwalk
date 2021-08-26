package com.movieingwalk.www.bean;

import org.springframework.stereotype.Repository;

@Repository
public class SeatBean {
	int seat_idx, t_idx, theater_idx;

	public int getSeat_idx() {
		return seat_idx;
	}

	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
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

}
