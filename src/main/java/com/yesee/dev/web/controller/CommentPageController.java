package com.yesee.dev.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yesee.dev.model.CommentVO;
import com.yesee.dev.model.bean.Comment;
import com.yesee.dev.model.service.CommentService;

@Controller
@RequestMapping("/")
public class CommentPageController {

	// @Autowired
	// private ArticleService articleService;
	@Autowired
	private CommentService commentService;

	private static final Logger LOGGER = LoggerFactory.getLogger(CommentPageController.class);

	@RequestMapping(value = "/commentPageController", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public CommentVO redirectCommentPage(Integer tempArticleId) {
		CommentVO commentVO = new CommentVO();
		commentVO.setIndex(0);
		List<Comment> tempCommentList = commentService.findByArticleId(tempArticleId);
		if (tempCommentList != null) {
			// LOGGER.info(commentService.findByArticleId(tempArticleId).get(0).getComment()+"44444444444");
			commentVO.setCommentList(commentService.findByArticleId(tempArticleId));
		}
		// LOGGER.info("Connected comment list successfully " +
		// commentVO.getCommentList().get(0).getComment());
		return commentVO;
	}

	@RequestMapping(value = "/commentDialog", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public CommentVO redirectCommentPage(Comment comment) {
		CommentVO commentVO = new CommentVO();
		commentVO.setIndex(0);
		// commentVO.setCommentList(commentService.findByArticleId(tempArticleId));
		return null;
	}
}
