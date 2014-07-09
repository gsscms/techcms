package com.catcm.skill.dao;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

/**
 * 
 * @author lipd
 * 2010-8-27
 */
public interface IHibernateDao {
    /**
     * 根据id从数据库中查找一个记录
     * 
     * @param cls
     *            类
     * @param id
     *            主键
     * @return 对象
     */
    @SuppressWarnings("unchecked")
    public Object get(Class cls, Serializable id);

    /**
     * 返回表中全部记录集
     * 
     * @param cls
     *            类
     * @return 对象集合
     */
    @SuppressWarnings("unchecked")
    public List select(Class cls);

    /**
     * 根据查询语句查询
     * <p>
     * <b>注意：此处的查询语句要求是HQL而不是SQL</b>
     * </p>
     * 
     * @param query
     *            查询语句HQL
     * @return 对象集合
     */
    @SuppressWarnings("unchecked")
    public List select(String query);

    /**
     * 删除指定记录
     * 
     * @param o
     *            被删除的对象
     */
    public void delete(Object o);

    /**
     * 将对象插入到数据库中
     * 
     * @param o
     *            被插入的对象
     */
    public void insert(Object o);

    /**
     * 更新记录
     * 
     * @param o
     *            被更新的记录
     */
    public void update(Object o);

    /**
     * 保存或者更新对象
     * 
     * @param o
     */
    public void saveOrUpdate(Object o);

    /**
     * 返回HibernateSession
     * 
     * @return Hibernate Session
     */
    public Session getHibernateSession();
    
    /**
     * 根据HQL获取相应的数据列表
     * 
     * @param hql
     * @param params
     */
    @SuppressWarnings("unchecked")
    public List select(final String hql, final Object[] params);

    /**
     * 根据HQL获取相应的数据列表
     * 
     * @param firstResult
     *            起始记录数
     * @param maxResults
     *            共查询多少条记录
     * @return
     */
    @SuppressWarnings("unchecked")
    public List select(final String hql, final Object[] params,
            final int firstResult, final int maxResults);

    /**
     * 得到表中记录总数
     * @param hql
     * @param params
     * @return
     */
    public int getCount(String hql, Object[] params);
    /**
     * sql执行更新
     * @param sql sql语句
     */
    void jdbcExecute(final String sql);
    
    /**
     * 
     * 方法描述:批量更新
     *
     * @param  lst  list列表
     * @return void   
     * @throws 
     * @since  
     */
    @SuppressWarnings("unchecked")
    public void batchSaveOrUpdate(final List lst) ;
    
    /**
     * 得到表单数据总数
     */
    public int getTotalCount(String hql) throws Exception;
}
