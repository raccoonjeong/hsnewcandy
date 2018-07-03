package org.candy.controller;



import org.candy.domain.Criteria;


import org.candy.domain.FreeboardVO;
import org.candy.domain.PageMaker;
import org.candy.service.FreeboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.bind.annotation.RequestMapping;



import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/freeboard/*")
@Log4j
public class FreeboardController {
	

	@Setter(onMethod_= {@Autowired})
	private FreeboardService service;
  
	@GetMapping("/read")
	public void read(@ModelAttribute("cri")Criteria cri, @ModelAttribute("bno") int bno,Model model) throws Exception{
		log.info("Read.....");
		model.addAttribute("vo", service.read(bno));
		log.info("Crireadread post"+cri.getPage());

		
	}	

	@GetMapping("/register")
	public void registerGET(@ModelAttribute("cri")Criteria cri)throws Exception{
		log.info("register get.............");
		log.info(cri);
	}
	
	@PostMapping("/register")
	public String registerPOST(FreeboardVO vo, RedirectAttributes rttr)throws Exception{
		
		String title = vo.getTitle();
		String content = vo.getContent();
		
		log.info("vo:........."+vo);
		/*log.info("vo:files........."+vo.getFiles());*/

		if (title != null && title.trim().length() != 0 && content != null && content.trim().length() != 0) {
			service.register(vo);
			rttr.addFlashAttribute("msg", "success");
		} else {
			rttr.addFlashAttribute("msg", "fail");
		}		
		
		return "redirect:/freeboard/list";
			
	}
	@GetMapping("/modify")
	public void modify(@ModelAttribute("cri")Criteria cri, @RequestParam("bno") int bno,Model model)throws Exception{
		
		log.info("modify............CRI========================"+cri);
		
		model.addAttribute("vo",service.read(bno));

	}
	
	@PostMapping("/modify")
	public String modifyPOST(@ModelAttribute("cri")Criteria cri,FreeboardVO vo,RedirectAttributes rttr)throws Exception{

	
		String title = vo.getTitle();
		String content = vo.getContent();
		int bno = vo.getBno();
		
		if (title != null && title.trim().length() != 0 && content != null && content.trim().length() != 0) {
			service.modify(vo);
			rttr.addFlashAttribute("msg", "success");
			
		} else {
			rttr.addFlashAttribute("msg", "fail");
		}
		return "redirect:/freeboard/read" +cri.makeSearch(cri.getPage())+"&bno="+bno ;
	}
	

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
