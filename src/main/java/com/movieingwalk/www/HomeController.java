package com.movieingwalk.www;

import java.util.Date;

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

		return "movieinfo/TempFile";
>>>>>>> ec744c8b577b757db46803909ace357f5750656d
	}
}
