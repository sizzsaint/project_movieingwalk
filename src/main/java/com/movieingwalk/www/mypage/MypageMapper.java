package com.movieingwalk.www.mypage;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface MypageMapper {

	final String MODIFY = " UPDATE MEMBER set u_password = #{u_password}, u_name=#{u_name} ,"
			+ "u_phone=#{u_phone}, u_email=#{u_email}";

@Update(MODIFY)
void modifyMember(MemberBean memberBean);

}



