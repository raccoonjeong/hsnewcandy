package org.candy.controller;

import org.candy.domain.Criteria;
import org.candy.domain.PageMaker;
import org.candy.service.FreeboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/freeboard/*")
@Log4j
public class FreeboardController {
	
	@Setter(onMethod_= {@Autowired})
	private FreeboardService service;
	
	@GetMapping("/list")
	public void getList(@ModelAttribute("cri")Criteria cri,Model model) throws Exception{
		
		log.info("list...zzz");
		model.addAttribute("list",service.list(cri));
		
		int totalCount = service.getTotal(cri);
		
		PageMaker pm =
				new PageMaker(cri, totalCount);
		model.addAttribute("pm",pm);		
		
	}

}
