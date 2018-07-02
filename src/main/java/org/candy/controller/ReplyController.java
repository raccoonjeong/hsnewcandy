package org.candy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.candy.domain.Criteria;
import org.candy.domain.ReplyDTO;
import org.candy.domain.ReplyVO;
import org.candy.mapper.ReplyMapper;
import org.candy.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@CrossOrigin
@RestController
@RequestMapping("/replies/*")
@Log4j
public class ReplyController {
	
	@Setter(onMethod_= {@Autowired})
	private ReplyService service;
	

	

	@PostMapping("/new")
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		
		if(vo.getOrd()==1) {
			service.rereply(vo);
		}
		else {
			service.create(vo);
		};
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
		
	}
	
	@GetMapping("/{rno}")
	public ResponseEntity<ReplyVO> read(@PathVariable("rno")Integer rno){
		
		
		return new ResponseEntity<ReplyVO>(service.read(rno), HttpStatus.OK);
		
		
	}
	
	@DeleteMapping("/{rno}/{ord}")
	public ResponseEntity<String> remove(
			@PathVariable("rno")Integer rno, @PathVariable("ord")Integer ord){
		
		
		String msg = "fail";
		log.info(ord);
		log.info(service.haveChild(rno)>0);
		if (ord == 0 && service.haveChild(rno)>0) {		
			log.info("have child");
			msg =  service.deleteParentReply(rno) == 1?"success":"fail";
		}
		else {
			log.info("not have child");
			msg =  service.delete(rno) == 1?"success":"fail";
		}
		
		
		return new ResponseEntity<String>(msg, HttpStatus.OK);
		
		
	}
	
	
	@PutMapping("/{rno}")
	public ResponseEntity<String> update(
			@PathVariable("rno")Integer rno, @RequestBody ReplyVO vo){
		
		vo.setRno(rno);
		
		String msg =  service.update(vo) == 1?"success":"fail";
		//메소드에 @RequestBody가 적용된 경우, 리턴 객체를 JSON이나 XML과 같은 알맞은 응답으로  변환
		return new ResponseEntity<String>(msg, HttpStatus.OK);
		
		
	}
	
	
	@GetMapping("/list/{bno}/{page}")
	public ResponseEntity<ReplyDTO> list(@PathVariable("page")Integer page,
			@PathVariable("bno")Integer bno){
		
		
		Criteria cri = new Criteria(page);
		
			
		return new ResponseEntity<ReplyDTO>(service.list(cri, bno), HttpStatus.OK);
	
	}
	
}
