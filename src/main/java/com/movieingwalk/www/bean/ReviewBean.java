package com.movieingwalk.www.bean;

import org.springframework.stereotype.Repository;

@Repository
public class ReviewBean {
	int r_idx, m_idx, r_star, r_likes, r_hits, r_comments;
	String u_id, r_date, r_memo, r_spoiler;
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
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
	public int getR_comments() {
		return r_comments;
	}
	public void setR_comments(int r_comments) {
		this.r_comments = r_comments;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_memo() {
		return r_memo;
	}
	public void setR_memo(String r_memo) {
		this.r_memo = r_memo;
	}
	public String getR_spoiler() {
		return r_spoiler;
	}
	public void setR_spoiler(String r_spoiler) {
		this.r_spoiler = r_spoiler;
	}
	

}
