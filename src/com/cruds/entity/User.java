package com.cruds.entity;

public class User 
{
	private int userid;
	private String username;
	private String email;
	private String password;
	
	public User()
	{
		super();	
	}

	
	public User(String username, String email, String password)
	{
		super();
		this.username = username;
		this.email = email;
		this.password = password;
	}
	
    public User(String email, String password)
	{
	    this.email = email;
	    this.password = password;
    }
	
	 
	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", email=" + email + ", password=" + password
				+ "]";
	}
}
