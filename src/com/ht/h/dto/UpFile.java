package com.ht.h.dto;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UpFile {
	public static String UpLoanFile(HttpServletRequest request,String fname) throws IOException{
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) request;
		//文件名
		MultipartFile file = mult.getFile(fname);
		String fileName = file.getOriginalFilename();
		if(fileName != null && !"".equals(fileName)){	
			System.out.println("fileName:"+fileName);
			String uploadname=uuid+fileName.substring(fileName.lastIndexOf("."));
			File path=new File(request.getSession().getServletContext().getRealPath("/")+"portrait");
			if(!path.exists()){
				path.mkdirs();
			}
			
			System.out.println("不存路径："+path);
			FileOutputStream fos=new FileOutputStream(path+"/"+uploadname);
			
			fos.write(file.getBytes());
			fos.flush();
			fos.close();
			return uploadname;
		}
		return null;
	}
}
