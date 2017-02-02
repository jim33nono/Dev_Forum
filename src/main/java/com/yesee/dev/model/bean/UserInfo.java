package com.yesee.dev.model.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;

@Table(name = "USERINFO")
@Entity
public class UserInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5081949460077158610L;

	public UserInfo() {
	}

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank(message = "Password blank")
	@Column(name = "ACCOUNT")
	private String account;

	
	@Size(min = 5, message = "Min size 5")
	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "USER_NAME")
	private String username;
	
	@Column(name = "EMAIL")
	private String email;

	@Column(name = "CREATE_DATE")
	private Date create_date;

	@Column(name = "ADMIN")
	private String admin;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getCreateDate() {
		return create_date;
	}

	public void setCreateDate(Date create_date) {
		this.create_date = create_date;
	}
	
	public String getAdmin() {
		return admin;
	}
	
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", account=" + account + ", password=" + password + ", username=" + username
				+ ", create_date=" + create_date + ", admin=" + admin + "]";
	}

}
