package com.movieingwalk.www.collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/collection")
public class CollectionController {
	
	@Autowired
	CollectionServiceImpl collectionService;
	
	private static final Logger logger = LoggerFactory.getLogger(CollectionController.class);
	
	//@RequestMapping(value="/CollectionWrite", method = RequestMethod.GET)
	//public String 
}
