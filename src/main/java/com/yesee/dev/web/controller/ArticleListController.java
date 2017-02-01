package com.yesee.dev.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yesee.dev.model.ArticleVO;
import com.yesee.dev.model.bean.Article;
import com.yesee.dev.model.bean.UserInfo;
import com.yesee.dev.model.service.ArticleService;
import com.yesee.dev.model.service.CommentService;
import com.yesee.dev.model.service.UserInfoService;

@Controller
@RequestMapping("/")
public class ArticleListController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private CommentService commentService;

	private static final Logger LOGGER = LoggerFactory.getLogger(ArticleListController.class);

	@RequestMapping(value = { "/articleListController" })
	public String redirectArticleList() {
		LOGGER.info("Connected Article List Successfully");
		return "articleList";
	}

	@RequestMapping(value = "/showArticleList", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ArticleVO showArticleList() {
		ArticleVO articleVO = new ArticleVO();
		articleVO.setIndex(0);
		List<Article> tempArticleList = new ArrayList<Article>();
		tempArticleList.addAll(articleService.findAll());
		for (int i = 0; i < articleService.findAll().size(); i++) {
			String temp = articleService.findAll().get(i).getArticle();
			if (temp != null) {
				if (temp.length() > 51) {
					temp = temp.substring(0, 51);
					temp = temp + ".....more";
				}
			}
			tempArticleList.get(i).setArticle(temp);
		}
		articleVO.setArticleList(tempArticleList);
		// session.getAttribute("validatedUserId");

		return articleVO;
	}

	@RequestMapping(value = "/showSingleArticle", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ArticleVO showSingleArticle(Integer tempId) {
		ArticleVO articleVO = new ArticleVO();
		articleVO.setIndex(0);
		articleVO.setArticleList(articleService.findById(tempId));
		return articleVO;
	}

	@RequestMapping(value = "/createNewArticlePage", method = RequestMethod.GET)
	public String toNewArticlePage() {

		return "newArticle";
	}

	@RequestMapping(value = "/createNewArticle", method = RequestMethod.POST)
	@ResponseBody
	public String createNewArticle(Article newArticle, HttpSession session) {
		newArticle.setCreate_date(new Date());

		LOGGER.info(((UserInfo) session.getAttribute("validatedUserId")).getId() + "----------");
		Integer tempUserId = ((UserInfo) session.getAttribute("validatedUserId")).getId();

		if (tempUserId == null) { // 測試用
			tempUserId = 1;
		}
		UserInfo tempUserInfoList = userInfoService.findById(tempUserId).get(0);
		newArticle.setUser_id(tempUserInfoList.getId());
		newArticle.setUser_name(tempUserInfoList.getUsername());
		articleService.addArticle(newArticle);
		return "";
	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("name") String name, @RequestParam("file") MultipartFile file,
			HttpSession session) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// LOGGER.info(bytes.toString() + "++++++++++++");

				String filePathAndName = file.getOriginalFilename();

				// Creating the directory to store file
				String rootPath = "C:\\upload";
				File dir = new File(rootPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// MultipartFile transferTo用法
				String tempPath = dir.getAbsolutePath() + File.separator + filePathAndName;
				File serverFile = new File(tempPath);
				file.transferTo(serverFile);

				// // Create the file on server
				// File serverFile = new File(dir.getAbsolutePath() +
				// File.separator + filePathAndName);
				// BufferedOutputStream stream = new BufferedOutputStream(new
				// FileOutputStream(serverFile));
				// stream.write(bytes);
				// stream.close();
				Article article = new Article();
				article.setUploadData(tempPath);
				articleService.uploadFile(article);
				LOGGER.info("Server File Location= " + tempPath);

				// return "You successfully uploaded file=" + name;

				return "articleList";
			} catch (Exception e) {
				LOGGER.error("err: {}", e);
				// return "You failed to upload " + name + " => " +
				// e.getMessage();
				return "articleList";
			}
		} else {
			// return "You failed to upload " + name
			// + " because the file was empty.";
			return "articleList";
		}

	}

	@RequestMapping(value = "/deleteSingleArticle", method = RequestMethod.POST)
	@ResponseBody
	public Boolean deleteSingleArticle(Integer deleteArticleId, Integer userId, HttpSession session) {

		Integer tempUserId = ((UserInfo) session.getAttribute("validatedUserId")).getId();
		LOGGER.info("tempUserId:" + tempUserId + " userId:" + userId);
		if (tempUserId == userId) {
			try {
				articleService.deleteArticle(deleteArticleId);
				commentService.deleteCommentsByArticleId(deleteArticleId);
				return true;
			} catch (Exception e) {
				return false;
			}
		} else {
			return false;
		}
	}

}
