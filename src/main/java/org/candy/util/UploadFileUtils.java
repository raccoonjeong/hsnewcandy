package org.candy.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import lombok.extern.log4j.Log4j;
@Log4j
public class UploadFileUtils {
	
/*	public static String uploadFile(String uploadPath, String originalName, byte[] fileData)throws Exception{
		
		UUID uid= UUID.randomUUID();
		
		String savedName = uid.toString()+"_"+originalName;
		

		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath +savedPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadFileName = null;
		if(MediaUtils.getMediatype(formatName)!=null) {
			uploadFileName = makeThumnail(uploadPath,savedpath,svaedName);
		}*/
		
	
	public static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath+File.separator+ new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath+File.separator+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath,monthPath,datePath);
		
		log.info(datePath);
		
		return datePath;
		
	}
	
	public static void makeDir(String uploadPath,String...paths) {
		
		if(new File(uploadPath+paths[paths.length -1]).exists()) 
			return ;
	
	for(String path:paths) {
		File dirPath = new File(uploadPath +path);
		if(!dirPath.exists()) {
			dirPath.mkdir();
		}
	}
	}
	
	/*private static String makeThumbnail(MultipartFile[] file, String uploadPath,String path,String fileName)throws Exception {
		
		for (MultipartFile upfile : file) {
		
		FileOutputStream thfos = 
				new FileOutputStream(
				 new File(uploadPath+ path,"s_" + fileName));
			
			Thumbnailator.createThumbnail(upfile.getInputStream(), 
					thfos, 150,150);
			thfos.close();
			}
			
		String thumbnailName = uploadPath+ path+ File.separator+"s_"+fileName;
		String files =thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
			
		return 
	}*/
	

	}
