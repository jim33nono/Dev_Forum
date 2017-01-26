package com.yesee.dev.model;

import java.util.List;

import com.yesee.dev.model.bean.Article;


public class ArticleVO {
	
	private Integer index;
	private List<Article> articleList;
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
	
}
