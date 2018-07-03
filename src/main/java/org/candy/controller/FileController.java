package org.candy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.candy.util.MediaUtils;
import org.candy.util.UploadFileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/ex/*")
@Log4j
public class FileController {

	private String uploadPath = "C:\\zzz\\upload";

	
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload Ajax get....");
	}

	@PostMapping(value = "/uploadAjax", produces = "text/plain;charset=UTF-8")
	public @ResponseBody ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		log.info("originalName:" + file.getOriginalFilename());
		log.info("size:" + file.getSize());
		log.info("contentType:" + file.getContentType());

		UploadFileUtils util = new UploadFileUtils();

		UUID uid = UUID.randomUUID();

		String oname = file.getOriginalFilename();
		String savedName = uid.toString() + "_" + oname;

		String savedPath = util.calcPath(uploadPath);


		FileOutputStream fos = new FileOutputStream(new File(uploadPath+ savedPath, savedName));

		FileCopyUtils.copy(file.getInputStream(), fos);

		
		String formatName = oname.substring(oname.lastIndexOf(".") + 1);
		
		String resultName = null;

		if (MediaUtils.getMediatype(formatName) != null) {

			FileOutputStream thfos = new FileOutputStream(new File(uploadPath + savedPath, "s_" + savedName));

			Thumbnailator.createThumbnail(file.getInputStream(), thfos, 150, 150);
			thfos.close();
			String thumbnailName = uploadPath + savedPath + File.separator + "s_" + savedName;
			resultName = thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');

		} else {
			String iconName = uploadPath + savedPath + File.separator + savedName;

			resultName = iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');

		}

		return new ResponseEntity<String>(resultName, HttpStatus.CREATED);

	}
	
	@RequestMapping("/displayFile")
	public @ResponseBody ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("fileName:.........."+fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediatype(formatName);
		
			HttpHeaders headers = new HttpHeaders();
		in = new FileInputStream(uploadPath+fileName);
		if(mType!=null) {
			headers.setContentType(mType);
		}else {
			fileName=fileName.substring(fileName.indexOf("_")+1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\""+
			new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
		}
		entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
	
	@PostMapping(value="/deleteFile" ,produces = "text/plain;charset=UTF-8")
	public @ResponseBody ResponseEntity<String> deleteFile(String fileName) throws Exception {

		log.info("fileName"+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediatype(formatName);
		
		if(mType!=null) {
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath +(front+end).replace('/', File.separatorChar)).delete();
			
		}
		new File(uploadPath +fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
		
	}
	
	@PostMapping(value="/deleteAllFiles" ,produces = "text/plain;charset=UTF-8")
	public @ResponseBody ResponseEntity<String> deleteFile(String[] files) throws Exception {
		log.info("fileName"+files);
		
		if(files == null||files.length ==0) {
			return  new ResponseEntity<String>("deleted",HttpStatus.OK);
		}
		
		for(String fileName :files) {
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediatype(formatName);
		
		if(mType!=null) {
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath +(front+end).replace('/', File.separatorChar)).delete();
		
		}new File(uploadPath +fileName.replace('/', File.separatorChar)).delete();
		}
	return  new ResponseEntity<String>("deleted",HttpStatus.OK);
		
	}
	}


