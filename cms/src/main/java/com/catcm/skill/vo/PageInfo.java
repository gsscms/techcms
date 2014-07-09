package com.catcm.skill.vo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.catcm.skill.util.ApplicationConstants;

@Component
@Scope("prototype")
public class PageInfo {
    // 默认当前页为第一页  
    private Integer pageNo = 1;
    // 总记录大小
    private Integer count = 0;
    // 分页大小
    private Integer pageSize;
    
    /**
     * 总共xx页
     * 
     * @return
     */
	public Integer getTotal() {
		int totalPage = count / getPageSize();
        return count % getPageSize() == 0 ? totalPage : totalPage + 1;
	}
	
	/**
	 * 数据库从xx条开始查询
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public int getOffset() {
		return (pageNo - 1) * getPageSize();
	}
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
		if (pageNo > getTotal())
			pageNo = getTotal();
	}
	public Integer getPageSize() {
		if (pageSize != null && pageSize >= 0)
			return pageSize;
		else
			return ApplicationConstants.pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
}