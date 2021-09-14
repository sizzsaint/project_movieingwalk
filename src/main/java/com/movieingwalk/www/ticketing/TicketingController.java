package com.movieingwalk.www.ticketing;

import java.awt.List;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.ReviewBean;
import com.movieingwalk.www.bean.TicketBean;
import com.movieingwalk.www.mypage.MypageService;
import com.movieingwalk.www.review.Paging;

@Controller
public class TicketingController {
	
	@Autowired	
	TicketingService ticketingService ;
	@Autowired
	MypageService mypageService;

	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	// 메인
	@RequestMapping(value="/ticket", method = RequestMethod.GET)
	public String ticketing(TicketBean ticketBean) {
			logger.debug("ticketing called!!!");	
		return "ticketing/ticketingMain";
	}
	
	// 상영작
	@RequestMapping(value="/ticketScr", method = RequestMethod.GET)
	public String ticketScr(TicketBean ticketBean) {
			logger.debug("ticketingScreen called!!!");
		return "ticketing/ticketingScreen";
	
	}		
	// 개봉예정작
	@RequestMapping(value="/ticketSch", method = RequestMethod.GET)
	public String ticketSch(TicketBean ticketBean) {
			logger.debug("ticketingScheduled called!!!");
		return "ticketing/ticketingScheduled";
	}
	// 예매 폼
	@GetMapping(value = "/ticketings")
	public String ticketings(@RequestParam("m_idx")int m_idx, Model model, TicketBean ticketbean) {
			logger.debug("예매폼호출");	
			
			model.addAttribute("m_idx", m_idx);
			model.addAttribute("ticketbean", ticketbean) ; 			
		return "ticketing/ticketing";
	}

	// 예매처리
	@PostMapping(value = "/ticketings2")
	public String ticketingOK(TicketBean ticketbean, Model model, int m_idx){
		logger.debug("예매완료");
		int result=ticketingService.insertTicketing(ticketbean);
		
		//System.out.println("예매 결과  :" + result);
		if(result==1) {
			model.addAttribute("msg", "ok");
		}
		model.addAttribute("m_idx", m_idx);
		return "ticketing/ticketings2";
	}
		
	//예매 리스트
	@RequestMapping(value="/ticketing/ticketlist", method=RequestMethod.GET)
	public String reviewList(Model model, @RequestParam("u_id") String u_id,  @RequestParam(defaultValue="1") int curPage) {
		logger.debug("예매리스트");
		ArrayList<TicketBean> ticketBeanList = ticketingService.getticketList(u_id);
		
		model.addAttribute("u_id",u_id);
		model.addAttribute("ticketBeanList", ticketBeanList);
		
		int listCnt = ticketBeanList.size();
		Paging paging = new Paging(listCnt, curPage);
		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("paging", paging);
		return "ticketing/ticketlist";
	}
	
	//예매내역상세
	@RequestMapping(value="/ticketing/ticketDetails", method=RequestMethod.GET)
	public String ticketDetail(Model model, @RequestParam("t_idx") String t_idx) {
		logger.debug("예매내역상세");
		
		TicketBean ticketbean =  ticketingService.getView(t_idx) ;
		model.addAttribute("t_idx", t_idx ) ;
		model.addAttribute("ticketbean",ticketbean) ; 
	
		return "ticketing/ticketDetails";
	}

}
