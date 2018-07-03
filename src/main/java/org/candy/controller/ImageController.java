package org.candy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.candy.domain.Criteria;
import org.candy.domain.AttachDTO;
import org.candy.domain.AttachVO;
import org.candy.service.UploadService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/up/*")
@Log4j
public class ImageController {
	
	@Setter(onMethod_= {@Autowired})
	private UploadService service;
	
	@GetMapping(value="/download" , produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	   @ResponseBody
	   public ResponseEntity<Resource> downloadFile(String fileName){
	       
	        log.info("fileName.." + fileName);
	       Resource resource  = new FileSystemResource("c:\\zzz\\upload\\" + fileName);
	       
	       if(resource.exists() == false) {
	           return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	       }
	       
	       String resourceName = resource.getFilename();
	       
	       //remove UUID
	       String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
	               
	       HttpHeaders headers = new HttpHeaders();
	       try {
	           
	           String downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");    
	           
	           headers.add("Content-Disposition", "attachment; filename="+downloadName);
	           
	       } catch (UnsupportedEncodingException e) {
	           e.printStackTrace();
	       }
	       
	       return new ResponseEntity<Resource>(resource, headers,HttpStatus.OK);
	   }

	
	@PostMapping(value="/ajax", produces="application/json")
	public @ResponseBody ResponseEntity<List<String>> uploadAjaxFiles(MultipartFile[] file ) throws Exception{
		
		log.info(Arrays.toString(file));
		
		List<String> uploadNames = new ArrayList<String>();
		
		for (MultipartFile upfile : file) {
		
			log.info(upfile.getOriginalFilename());
			log.info("----------------------------");
			
			UUID uid= UUID.randomUUID();
			
			String fullFileName = uid.toString()+"_"+upfile.getOriginalFilename();
			
			String originalFileName = upfile.getOriginalFilename();
			
			AttachVO vo = new AttachVO();
			vo.setUuid(uid.toString());
			vo.setFullname(originalFileName);
			
			service.insert(vo);
			
			FileOutputStream fos = 
					new FileOutputStream( new File("C:\\zzz\\upload",
						fullFileName	) );
		
			FileCopyUtils.copy(upfile.getInputStream(), fos);
			fos.close();
	
			//make thumbnail
			
			FileOutputStream thfos = 
				new FileOutputStream(
				 new File("C:\\zzz\\upload", 
						 "s_" + fullFileName)
				);
			
			Thumbnailator.createThumbnail(
					upfile.getInputStream(), 
					thfos, 150,150);
			thfos.close();
			
			uploadNames.add(originalFileName);		
		}
		
		return new ResponseEntity<List<String>>(uploadNames, HttpStatus.OK);
		
	}
	
	@GetMapping("/ajax")
	public void uploadAjax() {
	
		log.info("upload Ajax get");
		
	}

	@GetMapping("/listdata/{page}")
	public ResponseEntity <AttachDTO> listdata(@PathVariable("page")Integer page) {
	
		log.info("upload Ajax get");
		
		Criteria cri = new Criteria(page);
		
		return new ResponseEntity<AttachDTO>(service.pageList(cri),HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(@RequestBody String fullName){
		log.info("deleteFile...........");
		log.info("fullname:...."+fullName);
		
		//������
		service.delete(fullName); 
		
		//��������
		new File("C:\\zzz\\upload\\"+fullName).delete();
		new File("C:\\zzz\\upload\\"+"s_"+fullName).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
