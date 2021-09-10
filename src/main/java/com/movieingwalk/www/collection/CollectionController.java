package com.movieingwalk.www.collection;

import java.util.ArrayList;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.login.LoginController;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	CollectionServiceImpl collectionService;
	
	//컬렉션 만들기
	@RequestMapping(value="/CollectionWrite", method = RequestMethod.GET)
	public String writeCollection(Model model, CollectionBean collectionBean) {
		logger.debug("컬렉션만들기 페이지 호출");
		model.addAttribute(collectionBean);
		return "/collection/CollectionWrite";
	}
	
	//컬렉션 영화 추가
	@RequestMapping(value="/CollectionWrite_SelectMovie", method=RequestMethod.GET)
	public String collectionWrite_selectMovie() {
		logger.debug("컬렉션 영화 선택페이지 호츨");
		
		return "/collection/CollectionWrite_SelectMovie";
	}
	
	//컬렉션 입력처리
	@RequestMapping(value="/CollectionWriteOk", method = RequestMethod.POST)
	public String CollectionWriteOk(Model model, CollectionBean collectionBean) {
		logger.debug("컬렉션만들기 처리 페이지 호출");
		
		collectionService.insertCollection(collectionBean);
		return "/collection/CollectionWriteOk";
	}
	
	//콜렉션상세보기
	@RequestMapping(value="/collectiondetail", method = RequestMethod.GET)
	public String col_detail(Model model, CollectionBean collectionBean, @RequestParam("col_idx")int col_idx, @RequestParam("u_id") String u_id) {
		logger.debug("콜렉션상세보기페이지");
		
		collectionBean = collectionService.col_datail(col_idx);
		model.addAttribute("collectionBean",collectionBean);
		model.addAttribute("col_idx",col_idx);
		model.addAttribute("u_id",u_id);
		
		int checkLikes = collectionService.checkLike(col_idx, u_id);
		
		System.out.println(checkLikes);
		model.addAttribute("checkLikes", checkLikes);
		
		return "/collection/collection_detail";
	}
	
	//컬렉션 리스트
	@RequestMapping(value="/collectionList", method=RequestMethod.GET)
	public String collectionList(Model model,  @RequestParam("m_idx") int m_idx) {
		
		logger.debug("컬렉션 리스트");
		ArrayList<CollectionBean> collectionBeanList = collectionService.getCollectionList(m_idx);
	
		model.addAttribute("collectionBeanList", collectionBeanList);
		model.addAttribute("m_idx", m_idx);
		return "/collection/collectionList";
	}
	
	@RequestMapping(value="")
	public String collectionMain(Model model) {
		logger.debug("컬렉션메인");
		ArrayList<CollectionBean> collectionBeanList = collectionService.getMainCollection();
		model.addAttribute("collectionBeanList", collectionBeanList);

		return "/collection/collectionMain";
	}
	
	//좋아요 처리
	@RequestMapping(value="/collikeUpdate", method=RequestMethod.GET)
	public String collikeUpdate(Model model, @RequestParam("col_idx") int col_idx, @RequestParam("u_id") String u_id) {
		logger.debug("콜렉션 좋아요 처리페이지 호출");
		
		model.addAttribute("col_idx", col_idx);
		model.addAttribute("u_id", u_id);
		
		int likes = collectionService.likeUpdate(col_idx);
		
		collectionService.likeInsert(col_idx,u_id);
		
		model.addAttribute(likes);
		
		return "/collection/collikeUpdate";
	}
}
