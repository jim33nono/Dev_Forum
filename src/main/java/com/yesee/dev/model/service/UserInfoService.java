package com.yesee.dev.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yesee.dev.model.bean.UserInfo;
import com.yesee.dev.model.dao.UserInfoDao;
import com.yesee.dev.web.controller.LoginController;

@Service
public class UserInfoService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserInfoService.class);

	@Autowired
	private UserInfoDao userInfoDao;

	public boolean checkUser(String account, String password) {
		try {
			LOGGER.info(userInfoDao.checkUser(account).get(0).getPassword());
			return userInfoDao.checkUser(account).get(0).getPassword().equals(password);
		}

		catch (Exception e) {
			return false;
		}
	}
	
	public Integer getUserId(String account, String password){
		return userInfoDao.getUserId(account, password);
	}

	public List<UserInfo> findAll() {
		return userInfoDao.findAll();
	}

	public List<UserInfo> findById(Integer id) {
		return userInfoDao.findById(id);
	}

	public void deleteUserInfo(Integer id) {
		userInfoDao.deleteUserInfo(id);
	}

	public void addUserInfo(UserInfo userInfo) {
		userInfoDao.addUserInfo(userInfo);
	}

	public void updateUserInfo(UserInfo userInfo) {
		userInfoDao.updateUserInfo(userInfo);
	}
	
	public void updateAdmin(UserInfo userInfo){
		userInfoDao.updateAdmin(userInfo);
	}

}
