package com.yesee.dev.model;

import java.util.List;

import com.yesee.dev.model.bean.Comment;


public class CommentVO {
	
	private Integer index;
	private List<Comment> commentList;
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
}
