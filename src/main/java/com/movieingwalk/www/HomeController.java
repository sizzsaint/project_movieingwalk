package com.movieingwalk.www;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	@RequestMapping("/com")
	public String index(Model model) {

		return "movieinfo/TempFile";
	}
}
