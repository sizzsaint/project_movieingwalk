package com.movieingwalk.www.bean;

import org.springframework.stereotype.Repository;

@Repository
public class ReviewBean {
	int r_idx,  r_star, r_likes, r_hits;
	String r_comments, m_title, m_date, r_date, u_id;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public int getR_star() {
		return r_star;
	}
	public void setR_star(int r_star) {
		this.r_star = r_star;
	}
	public int getR_likes() {
		return r_likes;
	}
	public void setR_likes(int r_likes) {
		this.r_likes = r_likes;
	}
	public int getR_hits() {
		return r_hits;
	}
	public void setR_hits(int r_hits) {
		this.r_hits = r_hits;
	}
	public String getR_comments() {
		return r_comments;
	}
	public void setR_comments(String r_comments) {
		this.r_comments = r_comments;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
}
