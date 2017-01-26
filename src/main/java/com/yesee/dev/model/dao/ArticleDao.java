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

import com.yesee.dev.model.bean.Article;

@Repository
@Transactional(readOnly = true)
public class ArticleDao {

	private static final Logger LOGGER = LoggerFactory.getLogger(ArticleDao.class);

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return this.sessionFactory;
	}

	public List<Article> findAll() {
		Query query = getSessionFactory().getCurrentSession().createQuery("from Article");
		@SuppressWarnings("unchecked")
		List<Article> result = query.list();
		return result;
	}

	public List<Article> findById(Integer id) {
		Query query = getSessionFactory().getCurrentSession().createQuery("from Article a where a.id = ?");
		query.setParameter(0, id);
		@SuppressWarnings("unchecked")
		List<Article> result = query.list();
		return result;
	}

	@Transactional(readOnly = false)
	public void deleteArticle(Integer id) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("delete from Article a where (a.id = ?)");
		query.setParameter(0, id);
		query.executeUpdate();
	}

	@Transactional(readOnly = false)
	public void addArticle(Article article) {
		Session session = getSessionFactory().getCurrentSession();
		session.saveOrUpdate(article);
	}

	@Transactional(readOnly = false)
	public void updateArticle(Article article) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "update Article a set a.article = ? , a.dateTime = ? where a.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, article.getArticle());
		query.setParameter(1, article.getCreate_date());
		query.setParameter(2, article.getId());
		query.executeUpdate();
	}
	
	@Transactional(readOnly = false)
	public void uploadFile(Article article){
		Session session = getSessionFactory().getCurrentSession();
		session.saveOrUpdate(article);
	}

}
