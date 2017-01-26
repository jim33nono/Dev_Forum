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
import com.yesee.dev.model.bean.Comment;

@Repository
@Transactional(readOnly = true)
public class CommentDao {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommentDao.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory(){
		return this.sessionFactory;
	}
	
	public List<Comment> findAll(){
		Query query = getSessionFactory().getCurrentSession().createQuery("from Comment");	
		@SuppressWarnings("unchecked")
		List<Comment> result = query.list();
		return result;
	}
	
	public List<Comment> findById(Integer id){
		Query query = getSessionFactory().getCurrentSession().createQuery("from Comment a where a.id = ?");
		query.setParameter(0, id);
		@SuppressWarnings("unchecked")
		List<Comment> result = query.list();
		return result;
	}
	
	public List<Comment> findByArticleId(Integer id){
		Query query = getSessionFactory().getCurrentSession().createQuery("from Comment a where a.article_id = ?");
		query.setParameter(0, id);
		@SuppressWarnings("unchecked")
		List<Comment> result = query.list();
		return result;
	}
	
	@Transactional(readOnly = false)
	public void deleteComment(Integer id){
		Query query = getSessionFactory().getCurrentSession().createQuery("delete from Comment a where a.id = ?");
		query.setParameter(0, id);
		query.executeUpdate();
	}

	@Transactional(readOnly = false)
	public void addComment(Comment comment){
		Session session = getSessionFactory().getCurrentSession();
		session.saveOrUpdate(comment);
	}
	
	@Transactional(readOnly = false)
	public void updateComment(Comment comment){
		Query query = getSessionFactory().getCurrentSession().createQuery("update Comment a set a.comment where a.id = ?");
		query.setParameter(0, comment.getComment());
		query.setParameter(1, comment.getId());
		query.executeUpdate();
	}

	
}
