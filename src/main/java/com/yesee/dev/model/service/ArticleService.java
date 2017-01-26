package com.yesee.dev.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yesee.dev.model.bean.Article;
import com.yesee.dev.model.dao.ArticleDao;

@Service
public class ArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	public List<Article> findAll(){
		return articleDao.findAll();
	}
	
	public List<Article> findById(Integer id){
		return articleDao.findById(id);
	}
	
	public void deleteArticle(Integer id){
		articleDao.deleteArticle(id);
	}
	
	public void addArticle(Article article){
		articleDao.addArticle(article);
	}
	
	public void updateArticle(Article article){
		articleDao.updateArticle(article);
	}
	
	public void uploadFile(Article article){
		articleDao.uploadFile(article);
	}
	
}
