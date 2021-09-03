package com.movieingwalk.www.bean;

import org.springframework.stereotype.Repository;

@Repository
public class MemberBean {
	int  u_age, u_reviews, u_collections, u_liked_collections, u_tickets;
	String u_id, u_password, u_name, u_email, u_phone, u_date, u_sex, u_admin;


	public int getU_age() {
		return u_age;
	}
	public void setU_age(int u_age) {
		this.u_age = u_age;
	}
	public int getU_reviews() {
		return u_reviews;
	}
	public void setU_reviews(int u_reviews) {
		this.u_reviews = u_reviews;
	}
	public int getU_collections() {
		return u_collections;
	}
	public void setU_collections(int u_collections) {
		this.u_collections = u_collections;
	}
	public int getU_liked_collections() {
		return u_liked_collections;
	}
	public void setU_liked_collections(int u_liked_collections) {
		this.u_liked_collections = u_liked_collections;
	}
	public int getU_tickets() {
		return u_tickets;
	}
	public void setU_tickets(int u_tickets) {
		this.u_tickets = u_tickets;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_admin() {
		return u_admin;
	}
	public void setU_admin(String u_admin) {
		this.u_admin = u_admin;
	}

}
