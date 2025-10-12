package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	/*
	 * @RequestMapping(value = "/403", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String error403() { return "403"; }
	 */
}