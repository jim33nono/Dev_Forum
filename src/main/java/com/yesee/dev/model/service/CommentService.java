package com.yesee.dev.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yesee.dev.model.bean.Comment;
import com.yesee.dev.model.dao.CommentDao;

@Service
public class CommentService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommentService.class);

	@Autowired
	private CommentDao commentDao;
	
	public List<Comment> findAll(){
		return commentDao.findAll();
	}
	
	public List<Comment> findById(Integer id){
		return commentDao.findById(id);
	}
	
	public List<Comment> findByArticleId(Integer id){
		return commentDao.findByArticleId(id);
	}
	
	public void deleteComment(Integer id){
		commentDao.deleteComment(id);
	}
	
	public void addComment(Comment comment){
		commentDao.addComment(comment);
	}
	
	public void update(Comment comment){
		commentDao.updateComment(comment);
	}
	
}
