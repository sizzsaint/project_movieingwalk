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

	//아이디 존재 여부 확인
	@Select("SELECT count(*) from MEMBER where u_id=#{u_id}")
	public int checkId(MemberBean memberBean);
	
	//로그인
	@Select("SELECT u_id,u_password from MEMBER where u_id=#{u_id}")
	public MemberBean loginMember(MemberBean memberBean);
	
	//아이디 찾기-해당 입력 정보와 일치하는 아이디가 존재하는지
	@Select("SELECT count(*) from MEMBER where u_name=#{u_name} and u_email=#{u_email} and u_phone=#{u_phone}")
	public int searchId(MemberBean memberBean);
	
	//아이디 보여주기
	@Select("SELECT u_id from MEMBER where u_name=#{u_name} and u_email=#{u_email} and u_phone=#{u_phone}")
	public MemberBean showId(MemberBean memberBean);
}




