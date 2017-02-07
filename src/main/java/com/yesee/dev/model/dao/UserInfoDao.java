package com.yesee.dev.model.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yesee.dev.model.bean.UserInfo;

@Repository
@Transactional(readOnly = true)
public class UserInfoDao {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserInfoDao.class);

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return this.sessionFactory;
	}

	public List<UserInfo> checkUser(String account) {
		Query query = getSessionFactory().getCurrentSession().createQuery("from UserInfo a where a.account = ?");
		query.setParameter(0, account);
		@SuppressWarnings("unchecked")
		List<UserInfo> result = query.list();
		
		return result;
	}
	
	public Integer getUserId (String account, String password){
		Query query = getSessionFactory().getCurrentSession().createQuery("from UserInfo a where a.account =? AND a.password =?");
		query.setParameter(0, account);
		query.setParameter(1, password);
		@SuppressWarnings("unchecked")
		List<UserInfo> result = query.list();
		return result.get(0).getId();
	}

	public List<UserInfo> findAll() {
		Query query = getSessionFactory().getCurrentSession().createQuery("from UserInfo");
		@SuppressWarnings("unchecked")
		List<UserInfo> result = query.list();
		return result;
	}

	public List<UserInfo> findById(Integer id) {
		Query query = getSessionFactory().getCurrentSession().createQuery("from UserInfo a where a.id = ?");
		query.setParameter(0, id);
		@SuppressWarnings("unchecked")
		List<UserInfo> result = query.list();
		LOGGER.info("546546546" + result.get(0).getAccount());
		return result;
	}

	@Transactional(readOnly = false)
	public void deleteUserInfo(Integer id) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("delete from UserInfo a where (a.id = ?)");
		query.setParameter(0, id);
		query.executeUpdate();
	}

	@Transactional(readOnly = false)
	public void addUserInfo(UserInfo userInfo) {
		Session session = getSessionFactory().getCurrentSession();
		session.saveOrUpdate(userInfo);
	}

	@Transactional(readOnly = false)
	public void updateUserInfo(UserInfo userInfo) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "update UserInfo a set a.username = ? , a.create_date = ? where a.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userInfo.getUsername());
		query.setParameter(1, userInfo.getCreateDate());
		query.setParameter(2, userInfo.getId());
		query.executeUpdate();
	}

	@Transactional(readOnly = false)
	public void updateAdmin(UserInfo userInfo) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "update UserInfo a set a.admin = ? where a.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userInfo.getAdmin());
		query.setParameter(1, userInfo.getId());
		query.executeUpdate();
	}

}
