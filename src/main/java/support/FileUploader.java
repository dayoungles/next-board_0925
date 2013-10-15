package support;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	private static final String ROOT_DIR = "/Users/dayoungle/git/next-board_0925/webapp/images";
	
	public static String upload(MultipartFile file){
		if (file.isEmpty()){
			return null;
		}
		
		String fileName = file.getOriginalFilename();
		String path = ROOT_DIR + File.separator + fileName;
		
		File emptyFile = new File(path);
		try {
			file.transferTo(emptyFile);
		} catch (Exception ex) {
			throw new IllegalArgumentException(emptyFile + "옮길 수 없음 ");
			
		} 
		
		return fileName;
	}

}
