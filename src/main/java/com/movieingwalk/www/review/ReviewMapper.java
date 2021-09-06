package com.movieingwalk.www.review;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.movieingwalk.www.bean.ReviewBean;

/*int r_idx, m_idx, r_star, r_likes, r_hits, r_comments;
String u_id, r_date, r_memo, r_spoiler;*/

@Mapper
public interface ReviewMapper {
	
	
	final String WRITEREVIEW  ="INSERT INTO REVIEW ( m_idx, r_star, u_id, r_date, r_memo, r_spoiler)"
			+ "values ( #{m_idx}, #{r_star}, #{u_id}, now(), #{r_memo}, #{r_spoiler})";
	@Insert(WRITEREVIEW)
	void writeReview(ReviewBean bean);

}
