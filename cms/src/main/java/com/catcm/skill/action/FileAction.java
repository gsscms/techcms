package com.catcm.skill.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.catcm.skill.dao.DictDao;
import com.catcm.skill.util.ApplicationConstants;
import com.opensymphony.xwork2.ActionSupport;
public class FileAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private DictDao dictDao;

	//扫描件
	private File file;
	
	private String fileContentType;
	
	private String path;
	
	private String fileFileName;
	
	private String dictId;
	
	public String uploadSkillTypeImage(){
		String root = ServletActionContext.getRequest().getRealPath(ApplicationConstants.UPLOAD_ROOT);
		System.out.println();
		if (ifScanContentType()) {

	
		ApplicationConstants.PLATFORM_IMG_SUFFIX=getSuffix(fileFileName);
		fileFileName =dictId+ApplicationConstants.PLATFORM_IMG_SUFFIX;
        this.setFileFileName(fileFileName);
		upLoad(root,file,this.getFileFileName());
		}
		dictDao.setPathById(dictId, ApplicationConstants.UPLOAD_ROOT+"/"+fileFileName);
		return "uploadSkillTypeImage";
	}
	
	private void upLoad(String root,File uploadFile,String filePath){
	      try{
	            InputStream is = new FileInputStream(uploadFile);
	            fileFileName =dictId+ApplicationConstants.PLATFORM_IMG_SUFFIX;
	            this.setFileFileName(fileFileName);
	            //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
	            File destFile = new File(root,filePath);
	            
	            //把图片写入到上面设置的路径里
	            OutputStream os = new FileOutputStream(destFile);
	            byte[] buffer = new byte[400];
	            int length  = 0 ;
	            while((length = is.read(buffer))>0){
	                os.write(buffer, 0, length);
	        	}
	                is.close();
	                os.close();
	            
	           }
	      catch(IOException e)
	      {
          	this.addActionError("文件上传有误，请重试!");
          }   
	    
	}
	
	public String uploadImage(){
		if (ifScanContentType()) {
			//得到工程保存图片的路径
	        String root = ServletActionContext.getRequest().getRealPath(ApplicationConstants.UPLOAD_ROOT);
	        System.out.println(root);
	       // ApplicationConstants.PLATFORM_IMG_SUFFIX=getSuffix(fileFileName);
	          //循环上传的文件
	        	
	        try{
	            InputStream is = new FileInputStream(file);
	            fileFileName =ApplicationConstants.PLATFORM_IMG+ApplicationConstants.PLATFORM_IMG_SUFFIX;
	            this.setFileFileName(fileFileName);
	            //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
	            File destFile = new File(root,this.getFileFileName());
	            
	            //把图片写入到上面设置的路径里
	            OutputStream os = new FileOutputStream(destFile);
	            byte[] buffer = new byte[400];
	            int length  = 0 ;
	            while((length = is.read(buffer))>0){
	                os.write(buffer, 0, length);
	        	}
	                is.close();
	                os.close();
	            
	           }catch(IOException e){
            	this.addActionError("文件上传有误，请重试！");
            }
	            
			}
		return "uploadImage";
	}
	/**
	 * 判断上传文件的类型
	 * @return
	 */
	private boolean ifScanContentType() {
		if(file == null){
			addActionMessage("请选择图片");
			return false;
		}
		if ("image/png".equals(fileContentType)
				|| "image/gif".equals(fileContentType)
				|| "image/jpg".equals(fileContentType)
				|| "image/jpeg".equals(fileContentType)
				|| "image/bmp".equals(fileContentType)) {
				return true;
		}
		addActionMessage("请不要上传非图片文件");
		return false;
	}
	
	public String getSuffix(String fileName){
		String suffix = fileName.substring(fileName.lastIndexOf("."),fileName.length());
		return suffix;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getDictId() {
		return dictId;
	}

	public void setDictId(String dictId) {
		this.dictId = dictId;
	}

	public DictDao getDictDao() {
		return dictDao;
	}

	public void setDictDao(DictDao dictDao) {
		this.dictDao = dictDao;
	}
	
	
}
