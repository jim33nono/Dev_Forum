package com.yesee.dev.web.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yesee.dev.model.bean.UserInfo;
import com.yesee.dev.model.service.UserInfoService;

@Controller
public class LoginController {

	// public static Integer tempUserId;
	@Autowired
	private UserInfoService userInfoService;

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

//	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	 @RequestMapping("/login")
	public String login(UserInfo userInfo) {
		LOGGER.info("Connected Login Page Successfully");
		return "login";
//		return "entry";
	}

	@RequestMapping(value = "/tryLogin", method = RequestMethod.POST)
	public String login(@Validated UserInfo userInfo, BindingResult bindingResult, HttpSession session) {
		boolean loginOrNot = userInfoService.checkUser(userInfo.getAccount(), userInfo.getPassword());
		
		if (loginOrNot) {
			if (bindingResult.hasErrors()) {
				LOGGER.info(userInfo.getAccount() + "++" + userInfo.getPassword()
						+ " - Failed login because of validation limit!");
				return "login";
			}
			Integer tempUserId = userInfoService.getUserId(userInfo.getAccount(), userInfo.getPassword());
			session.setAttribute("validatedUserId", userInfoService.findById(tempUserId).get(0));
			LOGGER.info(userInfo.getAccount() + " - Login Successfully");
			return "redirect:/articleListController.do";
//			return "html/entry";
			

			// login success
		} else {
			LOGGER.info(userInfo.getAccount() + " - Failed login");
			// wrong password and account
			if (bindingResult.hasErrors()) {
				LOGGER.info(userInfo.getAccount() + " - Failed login because of validation limit!");
				return "login";
			}
			LOGGER.info(userInfo.getAccount() + " - Failed login because of wrong account or password!");
			return "login";
		}
	}
	
	

	

}
