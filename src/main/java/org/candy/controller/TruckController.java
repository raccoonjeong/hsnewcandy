package org.candy.controller;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.PageMaker;
import org.candy.domain.TruckVO;
import org.candy.service.TruckService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/truck/*")
@Log4j
public class TruckController {
	
	@Setter(onMethod_= {@Autowired})
	private TruckService service;
	
	@GetMapping("/list")
	public void getList(@ModelAttribute("cri")Criteria cri,Model model) throws Exception{

		//0719
		log.info("list...zzz");
		model.addAttribute("list",service.list(cri));
		
		int totalCount = service.getTotal(cri);
		
		PageMaker pm =
				new PageMaker(cri, totalCount);
		model.addAttribute("pm",pm);
		
		
		
	}
	
	@GetMapping("/register")
	public void registerGET(@ModelAttribute("cri")Criteria cri)throws Exception{
		log.info("register get.............");
		log.info(cri);
	
	}
	
	
	@PostMapping("/register")
	public String registerPOST(TruckVO vo, RedirectAttributes rttr)throws Exception{
		
		
		String title = vo.getTitle();
		String content = vo.getContent();
		
		log.info("vo:........."+vo);
		log.info("vo:Ű����~~~~~~~~~~~~~~~~"+vo.getKeyword());
		log.info("vo:files........."+vo.getFiles());
		log.info("vovovovovvo"+vo.getFullname());
		

		if (title != null && title.trim().length() != 0 && content != null && content.trim().length() != 0) {
			service.register(vo);
			rttr.addFlashAttribute("msg", "success");
			
		} else {
			rttr.addFlashAttribute("msg", "fail");
		}

		
		
		return "redirect:/truck/list";
			
	}

	@GetMapping("/read")
	public void read(@ModelAttribute("cri")Criteria cri, @ModelAttribute("fno") int fno,Model model) throws Exception{
		log.info("Read FNO......."+fno);
		log.info("Read VO......."+service.read(fno));
		model.addAttribute("vo", service.read(fno));
		log.info("read post?"+cri.getPage());

		
	}
	

	
	@PostMapping("/remove")
	public String removePOST(Criteria cri, @RequestParam("fno") int fno, String makeuri, RedirectAttributes rttr) {
		
		log.info("remove.....");
		
		try{
			service.remove(fno);
			rttr.addFlashAttribute("msg", "successRemove");
			
		}catch(Exception e){
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "failRemove");
			}
				
		return "redirect:/truck/list"+cri.makeSearch(cri.getPage());
	}

	@GetMapping("/modify")
	public void modify(@ModelAttribute("cri")Criteria cri, @RequestParam("fno") int fno,Model model)throws Exception{
		
		log.info("modify............CRI========================"+cri);
		
		model.addAttribute("vo",service.read(fno));

	}
	
	@PostMapping("/modify")
	public String modifyPOST(@ModelAttribute("cri")Criteria cri,TruckVO vo,RedirectAttributes rttr)throws Exception{

	
		String title = vo.getTitle();
		String content = vo.getContent();
		int fno = vo.getFno();
		
		if (title != null && title.trim().length() != 0 && content != null && content.trim().length() != 0) {
			service.modify(vo);
			rttr.addFlashAttribute("msg", "success");
			
		} else {
			rttr.addFlashAttribute("msg", "fail");
		}
		return "redirect:/truck/read" +cri.makeSearch(cri.getPage())+"&fno="+fno ;
	}
	
	@GetMapping("/getAttach/{fno}")
	public @ResponseBody List<String> getAttach(@PathVariable("fno")Integer fno) throws Exception{
		
		return service.getAttach(fno);
	}
	
	@PostMapping("/open")
	public String open(@ModelAttribute("cri")Criteria cri,@RequestParam("uid")String uid, Model model, RedirectAttributes rttr) throws Exception{
		service.openClose(uid, "t");
	
		rttr.addFlashAttribute("msg", "openSuccess");
		return "redirect:/truck/list";
	}
	
	@PostMapping("/close")
	public String close(@ModelAttribute("cri")Criteria cri,String uid, Model model, RedirectAttributes rttr) throws Exception{
		service.openClose(uid, "f");
		
		rttr.addFlashAttribute("msg", "closeSuccess");
		return "redirect:/truck/list";
	}
	
	@GetMapping("/keyword")
	public void getKeyword(@ModelAttribute("cri")Criteria cri,Model model) throws Exception{
		
	}
	
}
