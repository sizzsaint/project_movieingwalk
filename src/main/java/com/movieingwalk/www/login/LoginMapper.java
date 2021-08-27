package com.movieingwalk.www.login;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface LoginMapper {
/**
 * 	int u_idx, u_age, u_reviews, u_collections, u_liked_collections, u_tickets;
	String u_id, u_password, u_name, u_email, u_phone, u_date, u_sex, u_admin;
 * 
 */
		final String REGISTER = " INSERT INTO MEMBER(u_id,u_password,u_name,u_phone,u_sex,u_email,u_age )"
				+ " values( #{u_id}, #{u_password}, #{u_name}, #{u_phone}, #{u_sex}, #{u_email}, #{u_age} )";
	@Insert(REGISTER)
	void registerMember(MemberBean memberBean);
	
	//아이디+비번 일치하면 로그인
	final String LOGIN = " select count(*) from MEMBER where u_id=#{u_id} and u_password=#{u_password} ";

	@Select(LOGIN)
	void loginMember(MemberBean memberBean);
	
	
	// u_id받아서 u_name얻는다.
	final String GETNAME = " select u_name from MEMBER where u_id=#{u_id}";
	
	@Select(GETNAME)
	void getName(MemberBean memberBean);

	
}

