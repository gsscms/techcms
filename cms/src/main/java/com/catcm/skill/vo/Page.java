/**
 * Filename:    Page.java  
 * Description:   
 * Copyright:   Copyright (c)2008  
 * Company:     yourCompany  
 * @author:     zhouhongbing  
 * @version:    1.0  
 * Create at:   2011-2-28 下午05:45:38  
 *  
 * Modification History:  
 * Date         Author      Version     Description  
 * ------------------------------------------------------------------  
 * 2011-2-28   y.nie      1.0         1.0 Version  
*/

package com.catcm.skill.vo;

import java.io.Serializable;
import java.util.List;

/**
 * ClassName:Page
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   zhouhongbing
 * @version  
 * @since    Ver 1.1
 * @Date	 2011-2-28		下午05:45:38
 */
public class Page implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 4139821693517427335L;

    private static int DEFAULT_PAGE_SIZE = 14;

    private int pageSize = DEFAULT_PAGE_SIZE; // 每页的记录数

    private long start; // 当前页第一条数据在List中的位置,从0开始
    
    /**结果对象*/
    @SuppressWarnings("unchecked")
    private List result;

    @SuppressWarnings("unchecked")
    public void setResult(List result) {
        this.result = result;
    }

    public void setData(Object data) {
        this.data = data;
    }

    private Object data; // 当前页中存放的记录,类型一般为List

    private long totalCount; // 总记录数

    
    


    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * 构造方法，只构造空页.
     */
    public Page() {
        this(0, 0, DEFAULT_PAGE_SIZE, null);
    }

    /**
     * 默认构造方法.
     *
     * @param start  本页数据在数据库中的起始位置
     * @param totalSize 数据库中总记录条数

     * @param pageSize  本页容量
     * @param data    本页包含的数据

     */
    @SuppressWarnings("unchecked")
    public Page(long start, long totalSize, int pageSize, List result) {
        this.pageSize = pageSize;
        this.start = start;
        this.totalCount = totalSize;
        this.result = result;
        
    }

     /**
       * @return 结构集
       */
      @SuppressWarnings("unchecked")
    public List getResult() {

        return this.result;
      }
      
    /**
     * 取总记录数.
     */
    public long getTotalCount() {
        return this.totalCount;
    }

    /**
     * 取总页数.
     */
    public long getTotalPageCount() {
        if (totalCount % pageSize == 0)
            return totalCount / pageSize;
        else
            return totalCount / pageSize + 1;
    }

    /**
     * 取每页数据容量.
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 取当前页中的记录.
     */
    public Object getData() {
        return data;
    }

    /**
     * 取该页当前页码,页码从1开始.
     */
    public long getCurrentPageNo() {
        return start / pageSize + 1;
    }

    /**
     * 该页是否有下一页.
     */
    public boolean hasNextPage() {
        return this.getCurrentPageNo() < this.getTotalPageCount() - 1;
    }

    /**
     * 该页是否有上一页.
     */
    public boolean hasPreviousPage() {
        return this.getCurrentPageNo() > 1;
    }

    /**
     * 获取任一页第一条数据在数据集的位置，每页条数使用默认值.
     *
     * @see #getStartOfPage(int,int)
     */
    protected static int getStartOfPage(int pageNo) {
        return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
    }

    /**
     * 获取任一页第一条数据在数据集的位置.
     *
     * @param pageNo   从1开始的页号
     * @param pageSize 每页记录条数
     * @return 该页第一条数据

     */
    public static int getStartOfPage(int pageNo, int pageSize) {
        return (pageNo - 1) * pageSize;
    }
    

}