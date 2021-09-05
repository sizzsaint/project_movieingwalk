package com.movieingwalk.www.bean;

import org.springframework.stereotype.Repository;

@Repository
public class TheaterBean {
	int theater_idx, theater_seats;
	String theater_location;

	public int getTheater_idx() {
		return theater_idx;
	}

	public void setTheater_idx(int theater_idx) {
		this.theater_idx = theater_idx;
	}

	public int getTheater_seats() {
		return theater_seats;
	}

	public void setTheater_seats(int theater_seats) {
		this.theater_seats = theater_seats;
	}

	public String getTheater_location() {
		return theater_location;
	}

	public void setTheater_location(String theater_location) {
		this.theater_location = theater_location;
	}

}
