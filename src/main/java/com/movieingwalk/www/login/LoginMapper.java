package com.movieingwalk.www.login;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface LoginMapper {
/**
 * 	int u_idx, u_age, u_reviews, u_collections, u_liked_collections, u_tickets;
	String u_id, u_password, u_name, u_email, u_phone, u_date, u_sex, u_admin;
 * 
 */
		final String REGISTER = " INSERT INTO MEMBER(u_idx,,u_id,u_password,u_name,u_phone,u_sex,u_email,u_age)"
				+ " values(${u_idx},${u_id},${u_password},${u_name},${u_phone},${u_sex},${u_email},${u_age})";
	@Insert(REGISTER)
	void registerMember(MemberBean memberBean);

	
	
	
	
	
	
	
	
	
	
	}

