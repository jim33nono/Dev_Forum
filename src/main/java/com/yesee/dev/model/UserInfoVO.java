package com.yesee.dev.model;

import java.util.List;

import com.yesee.dev.model.bean.UserInfo;


public class UserInfoVO {
	
	private Integer index;
	private List<UserInfo> userInfoList;
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public List<UserInfo> getUserInfoList() {
		return userInfoList;
	}
	public void setUserInfoList(List<UserInfo> userInfoList) {
		this.userInfoList = userInfoList;
	}
	
	
}
