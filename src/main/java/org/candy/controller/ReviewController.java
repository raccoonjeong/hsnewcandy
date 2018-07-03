package org.candy.controller;

import org.candy.domain.Criteria;
import org.candy.domain.ReviewDTO;
import org.candy.domain.ReviewVO;
import org.candy.service.ReviewService;
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

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@CrossOrigin
@RestController
@RequestMapping("/reviews/*")
@Log4j
public class ReviewController {
	
	@Setter(onMethod_= {@Autowired})
	private ReviewService service;
	

	@PostMapping("/new")
	public ResponseEntity<String> register(@RequestBody ReviewVO vo){
		
		if(vo.getOrd()==1) {
			service.rereview(vo);
		}
		else {
			service.create(vo);
		};
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
		
	}
	
	@GetMapping("/{rno}")
	public ResponseEntity<ReviewVO> read(@PathVariable("rno")Integer rno){
		
		
		return new ResponseEntity<ReviewVO>(service.read(rno), HttpStatus.OK);
		
		
	}
	
	@DeleteMapping("/{rno}/{ord}")
	public ResponseEntity<String> remove(
			@PathVariable("rno")Integer rno, @PathVariable("ord")Integer ord){
		
		
		String msg = "fail";
		log.info(ord);
		log.info(service.haveChild(rno)>0);
		if (ord == 0 && service.haveChild(rno)>0) {		
			log.info("have child");
			msg =  service.deleteParentReview(rno) == 1?"success":"fail";
		}
		else {
			log.info("not have child");
			msg =  service.delete(rno) == 1?"success":"fail";
		}
		
		
		return new ResponseEntity<String>(msg, HttpStatus.OK);
		
		
	}
	
	
	@PutMapping("/{rno}")
	public ResponseEntity<String> update(
			@PathVariable("rno")Integer rno, @RequestBody ReviewVO vo){
		
		vo.setRno(rno);
		
		String msg =  service.update(vo) == 1?"success":"fail";
		//�޼ҵ忡 @RequestBody�� ����� ���, ���� ��ü�� JSON�̳� XML�� ���� �˸��� ��������  ��ȯ
		return new ResponseEntity<String>(msg, HttpStatus.OK);
		
		
	}
	
	
	@GetMapping("/list/{bno}/{page}")
	public ResponseEntity<ReviewDTO> list(@PathVariable("page")Integer page,
			@PathVariable("bno")Integer bno){
		
		
		Criteria cri = new Criteria(page);
		
			
		return new ResponseEntity<ReviewDTO>(service.list(cri, bno), HttpStatus.OK);
	
	}
	
}
