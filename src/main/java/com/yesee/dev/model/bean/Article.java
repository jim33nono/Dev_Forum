package com.yesee.dev.model.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Table(name = "ARTICLE")
@Entity
public class Article implements Serializable {

	public Article() {
	};
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "USER_NAME")
	private String user_name;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "ARTICLE")
	private String article;
	
	@Column(name = "CREATE_DATE")
	private Date create_date;
	
	@Column(name = "USER_ID")
	private Integer user_id;
	
	@Column(name = "UPLOAD_DATA")
	private String uploadData;

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	public String getUploadData() {
		return uploadData;
	}

	public void setUploadData(String uploadData) {
		this.uploadData = uploadData;
	}


	@Override
	public String toString() {
		return "Article [id=" + id + ", user_name=" + user_name + ", title=" + title + ", article=" + article
				+ ", create_date=" + create_date + ", user_id=" + user_id + ", uploadData=" + uploadData + "]";
	}
	
}
