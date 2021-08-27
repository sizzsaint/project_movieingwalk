package com.movieingwalk.www;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String index(Model model) {
<<<<<<< HEAD
		model.addAttribute("message", "좋은 아침");
		model.addAttribute("now", new Date());
		return "main/index";
=======


		return "main/index";



>>>>>>> 9b4de4f47d48f7fcaec887cb1183d660801b9378
	}
}
