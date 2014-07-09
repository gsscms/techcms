package com.catcm.skill.action;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;

import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;


import com.catcm.skill.pojo.UserInfo;
import com.catcm.skill.vo.PageInfo;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Action 椤剁骇绫�
 * 
 * @author liutong
 *
 */
public abstract class BaseAction extends ActionSupport {
	
	/**
	 * 鍒嗛〉瀵硅薄
	 */
	@Autowired
	private PageInfo pageInfo;
	
	/** 鏂囦欢涓婁紶璺姴 */
	public static final String UPLOAD_PATH = "upload/";
	
	/**
	 * 杩斿洖褰撳墠鐧诲綍鐢ㄦ埛
	 * 
	 * @return
	 */
	public UserInfo getCurrentUser() {
		UserInfo currentUser = null;
		return currentUser;
	}
	
	/**
	 * 杩斿洖搴旂敤璺熻矾寰勶細http://localhost:8080/bdm
	 * @return
	 */
	public String getBasePath() {
		return ServletActionContext.getRequest().getScheme() + "://" + ServletActionContext.getRequest().getServerName() + ":" + ServletActionContext.getRequest().getServerPort() + ServletActionContext.getRequest().getContextPath();
	}
	
	/**
	 * Json鏍煎紡鍖栧紓甯�
	 * @param object
	 * @return
	 */
	protected InputStream toJsonInputStream(Object object) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			// 涓嶈緭鍑虹┖鍊�
			mapper.setSerializationInclusion(JsonSerialize.Inclusion.NON_NULL);
	        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm"));
	        String json = mapper.writeValueAsString(object);
		
			return IOUtils.toInputStream(json, "UTF-8");
		} catch (IOException e) {
			logger.error("Json错误", e);
		}
		return null;
	}
	
	/**
	 * 娣诲姞Cookie
	 * @param name
	 * @param value
	 */
	protected void addCookie(String name, String value, Integer maxAge) {
		Cookie cookie = new Cookie(name, value);
		if (maxAge != null) {
			cookie.setMaxAge(maxAge);
		} else {
			cookie.setMaxAge(60 * 60 * 24 * 30);
		}
		ServletActionContext.getResponse().addCookie(cookie);
	}

	/**
	 * 鑾峰彇Cookie
	 * @param name
	 * @return
	 */
	protected String getCookie(String name) {
		HttpServletRequest request = ServletActionContext.getRequest();
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name)) {
				return cookie.getValue();
			}
		}
		return null;
	}
	
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	final Logger logger = LoggerFactory.getLogger(BaseAction.class);
	private static final long serialVersionUID = 2542776433723007314L;
}
