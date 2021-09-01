package com.movieingwalk.www.collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieingwalk.www.bean.CollectionBean;
import com.movieingwalk.www.login.LoginController;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	CollectionService colService;

	//콜렉션상세보기
	@RequestMapping("/collectiondetail")
	public String col_detail(Model model, CollectionBean colBean, @RequestParam("col_idx")String col_idx) {
		logger.debug("콜렉션상세보기페이지");
		model.addAttribute("colBean",colBean);
		return ("/collection/collection_detail");
	}
}
