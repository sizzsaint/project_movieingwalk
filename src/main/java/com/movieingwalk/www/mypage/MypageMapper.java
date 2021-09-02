package com.movieingwalk.www.mypage;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.movieingwalk.www.bean.MemberBean;

@Mapper
public interface MypageMapper {
	
	final String MYPAGE_MAIN = " SELECT * from member where u_id=#{u_id}";
	@Select(MYPAGE_MAIN)
	@Results(id="allResult", value= {
			@Result(property = "u_id", column="u_id"),
			@Result(property = "u_name", column="u_name"),
			@Result(property = "u_password", column="u_password"),
			@Result(property = "u_email", column="u_email"),
			@Result(property = "u_phone", column="u_phone"),
			@Result(property = "u_age", column="u_age"),
			@Result(property = "u_sex", column="u_sex"),
			@Result(property = "u_reviews", column="u_reviews"),
			@Result(property = "u_collections", column="u_collections"),
			@Result(property = "u_liked_collections", column="u_liked_collections"),
			@Result(property = "u_tickects", column="u_tickects"),
			@Result(property = "u_admin", column="u_admin")
	})
	MemberBean mypageMain(@Param("u_id")String u_id);
	
	final String VIEW_MEMBER = " SELECT u_id, u_name, u_password, u_email, u_phone, u_age, u_sex"
			+ " FROM MEMBER WHERE u_id=#{u_id} ";	
	@Select(VIEW_MEMBER)
	@Results( id= "queryResult", value= {
			@Result(property = "u_id", column="u_id"),
			@Result(property = "u_name", column="u_name"),
			@Result(property = "u_password", column="u_password"),
			@Result(property = "u_email", column="u_email"),
			@Result(property = "u_phone", column="u_phone"),
			@Result(property = "u_age", column="u_age"),
			@Result(property = "u_sex", column="u_sex")
	})
	MemberBean modifyMemberView(@Param("u_id") String u_id );
	
	final String MODIFY_MEMBER = " UPDATE MEMBER set u_password = #{u_password}, u_name=#{u_name} ,"
			+ "u_phone=#{u_phone}, u_email=#{u_email} where u_id = #{u_id}";
	@Update(MODIFY_MEMBER)
	void modifyMember(MemberBean memberBean);

}



