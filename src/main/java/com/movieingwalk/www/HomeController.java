package com.movieingwalk.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
<<<<<<< HEAD
	public String index() {
		return "main/index";
=======
	public String index(Model model) {

		model.addAttribute("message", "좋은 아침");
		model.addAttribute("now", new Date());
		return "main/index";



>>>>>>> e497a175a08e71f6ecabff71622225c5135e2a52
	}
}
