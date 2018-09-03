package org.candy.controller;

import org.candy.domain.UserVO;
import org.candy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.java.Log;


@Controller
@Log
public class LoginController {
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	@PostMapping("/myLogin")
	public void loginInput(String error, Model model ) {
		
		log.info("error......"+ error);
		
		
		if(error != null) {
			model.addAttribute("error", error);
		}		
		
	}
	@GetMapping("/myLogin")
	public void getLogin() {
		
	}
/*	
	@GetMapping("/accessDenied")
	public void accessDenied() {
		
		
	}*/	
	@GetMapping("/join")
	public void getJoin() {
		
	}
	
	@PostMapping("/join")
	public String postJoin(UserVO vo, RedirectAttributes rttr) {
		log.info("vo,,,"+vo);		

		String uid = vo.getUid();
		String upw = vo.getUpw();
		String uname = vo.getUname();
		String email = vo.getEmail();
		String phone = vo.getPhone_number();
				
		if (uid != "anonymousUser" && uid != null && uid.trim().length() != 0 && upw != null && upw.trim().length() != 0 &&
				uname != null && uname.trim().length() != 0 && email != null && email.trim().length() != 0
				&& phone != null && phone.trim().length() != 0) {
			service.create(vo);
			rttr.addFlashAttribute("msg", "join");
			
		} else {
			rttr.addFlashAttribute("msg", "joinFail");
			return "redirect:/join";
		}
		return "redirect:/myLogin";
	}	
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<String> checkId(@RequestBody String mid) {
		log.info("idCheck progress.... : " + mid);
		int result = service.idcheck(mid);
		log.info("result : " + result);
		
		ResponseEntity<String> entity = null;
		
		entity = new ResponseEntity<String>(Integer.toString(service.idcheck(mid)), HttpStatus.OK);
		log.info("idcheck..................");
		log.info("CHECK ID : " + Integer.toString(service.idcheck(mid)));
		
		return entity;
	}
	
	

}
