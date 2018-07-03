package org.candy.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/*")
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping("/home")
	public void home(Locale locale, Model model) {
		log.info("Get home");
		
	}
	
	@GetMapping("/foodtruck")
	public void foodtruck(Locale locale, Model model) {
		log.info("Get foodtruck");
		
	}
	
	@GetMapping("/ranking")
	public void ranking(Locale locale, Model model) {
		log.info("Get ranking");
		
	}
	
	@GetMapping("/view")
	public void view(Locale locale, Model model) {
		log.info("Get view");
		
	}
	
	
}
