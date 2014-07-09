package com.catcm.skill.dao.impl;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.catcm.skill.dao.IHibernateDao;



/**
 * 
 * @author lipd 2010-8-26
 */
public class HibernateDao extends HibernateDaoSupport
        implements IHibernateDao {
    /**
     * 根据id从数据库中查找一个记录
     */
    @SuppressWarnings("unchecked")
    public Object get(Class cls, Serializable id) {
        return getHibernateTemplate().get(cls, id);
    }

    /**
     * 返回表中全部记录集
     */
    @SuppressWarnings("unchecked")
    public List select(Class cls) {
        return getHibernateTemplate().find(" from " + cls.getName() + " ");
    }

    /**
     * 根据查询语句查询
     * <p>
     * <b>注意：此处的查询语句要求是HQL而不是SQL</b>
     * </p>
     */
    @SuppressWarnings("unchecked")
    public List select(String query) {
        return getHibernateTemplate().find(query);
    }

    /**
     * 删除指定记录
     */
    public void delete(Object o) {
        getHibernateTemplate().delete(o);
    }

    /**
     * 删除记录
     * 
     * @param hql
     * @param params
     */
    public void delete(final String hql, final Object[] params) {
        getHibernateTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session s) throws HibernateException,
                    SQLException {
                Query query = s.createQuery(hql);
                if (params != null && params.length > 0) {
                    for (int i = 0; i < params.length; i++)
                        query.setParameter(i, params[i]);
                }
                query.executeUpdate();
                return null;
            }
        });
    }

    /**
     * 根据HQL获取相应的数据列表
     * 
     * @param hql
     * @param params
     */
    @SuppressWarnings("unchecked")
    public List select(final String hql, final Object[] params){
    	return select(hql,params,0,0);
    }
    
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
            final int firstResult, final int maxResults) {
        return getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session s) throws HibernateException,
                    SQLException {
                Query query = s.createQuery(hql);
                if (params != null && params.length > 0) {
                    for (int i = 0; i < params.length; i++)
                        query.setParameter(i, params[i]);
                }

                if (firstResult > 0)
                    query.setFirstResult(firstResult);
                if (maxResults > 0)
                    query.setMaxResults(maxResults);
                List list = query.list();
                return list;
            }
        });
    }

    /**
     * 得到表中记录总数
     * 
     * @param hql
     * @param params
     * @return
     */
    @SuppressWarnings("unchecked")
    public int getCount(final String hql, final Object[] params) {
        int ret = 0;
        List lst = getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session s) throws HibernateException,
                    SQLException {
                Query query = s.createQuery(hql);
                if (params != null && params.length > 0) {
                    for (int i = 0; i < params.length; i++)
                        query.setParameter(i, params[i]);
                }
                List list = query.list();
                return list;
            }
        });

        if (lst.isEmpty()) {
            return 0;
        }
        else {
            ret = ((Number) lst.get(0)).intValue();
        }
        return ret;
    }

    /**
     * 将对象插入到数据库中
     */
    public void insert(Object o) {
        getHibernateTemplate().save(o);
    }

    /**
     * 更新记录
     */
    public void update(Object o) {
        getHibernateTemplate().update(o);
    }

    public void saveOrUpdate(Object o) {
        getHibernateTemplate().saveOrUpdate(o);
    }

    /**
     * 返回HibernateSession
     */
    public Session getHibernateSession() {
        return getSession();
    }

    public void jdbcExecute(final String sql) {
        getHibernateTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                session.createSQLQuery(sql).executeUpdate();
                return null;
            }

        });
    }
    

    
//    @SuppressWarnings("unchecked")
//    public List jdbcQuery(final String sql) {
//       return (List)getHibernateTemplate().execute(new HibernateCallback() {
//            public Object doInHibernate(Session s) throws HibernateException,
//                    SQLException {
//                Query query = s.createSQLQuery(sql);
//                return query.list();
//                
//            }
//        });
//    }

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
    public void batchSaveOrUpdate(final List lst) {
        this.getHibernateTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                for (int i = 0; i < lst.size(); i++) {
                    session.saveOrUpdate(lst.get(i));
                    if ((i == lst.size()-1) || (i % 50 == 0)) {
                        session.flush();
                        session.clear();
                   
                    }
                }
                return null;
            }
        });
    }
    
    /**
     * 得到表单数据总数
     */
    public int getTotalCount(String hql) throws Exception {
        List<?> lst = select(hql);
        if (lst.isEmpty()) {
            return 0;
        }
        else {
            return ((Number) lst.get(0)).intValue();
        }
    }

}
