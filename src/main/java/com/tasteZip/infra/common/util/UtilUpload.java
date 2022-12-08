package com.tasteZip.infra.common.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.tasteZip.infra.common.constants.Constants;
import com.tasteZip.infra.modules.store.Store;

public class UtilUpload {

	public static String uploadProduct (MultipartFile multipartFile, String className, Store dto) throws Exception {
        String fileName = multipartFile.getOriginalFilename();
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        String uuid = UUID.randomUUID().toString();
        String uuidFileName = uuid + "." + ext;
        String pathModule = className;
        String nowString = UtilDateTime.nowString();
        String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
        //String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
        //String path = Constants.UPLOAD_PATH_PREFIX_LINUX + "/" + pathModule + "/" + pathDate + "/";
        //String path = Constants.UPLOAD_PATH_PREFIX_MAC + "/" + pathModule + "/" + pathDate + "/";
        String path = Constants.UPLOAD_PATH_PREFIX_SERVER + "/" + pathModule + "/" + pathDate + "/";

        String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
		
		createPath(path); //위에서 정의한 경로를 생성해주는 메소드
		
		multipartFile.transferTo(new File(path + uuidFileName)); //실제로 이미지 물리파일이 저장되는 코드(메소드)
		
		dto.setPath(pathForView);  
		dto.setOriginalName(fileName); 
		dto.setUuidName(uuidFileName);
		dto.setExt(ext);
		dto.setSize(multipartFile.getSize());
		
		return path+uuidFileName;
	}
	
	public static void createPath (String path) {
		File uploadPath = new File(path);
		if (!uploadPath.exists()) {
			uploadPath.mkdir();
		} else {
			// by pass
		}
	}
}
