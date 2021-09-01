package com.movieingwalk.www.admin;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface AdminMapper {
	@Select("select count(*) from member where u_admin='Y'and u_id=#{u_id}")
	public int checkAdId(MemberBean memberBean);
	
	@Select("select u_id,u_password from MEMBER where u_id=#{u_id}")
	public MemberBean showAdId(MemberBean memberBean);
}
