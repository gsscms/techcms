package com.catcm.skill.dao;




public interface UserInfoDao  extends IHibernateDao {
	/**
	 * 获得身份证为cardId的注册人数
	 * @param cardId
	 * @return
	 */
	public int getNumByCardId(String cardId);
	
	/**
	 * 获得电话为phone的注册人数
	 * @param phone
	 * @return
	 */
	public int getNumByPhone(String phone);
	/**
	 * 获得账户为account的注册人数
	 * @param account
	 * @return
	 */
	public int getNumByAccount(String account);
}
