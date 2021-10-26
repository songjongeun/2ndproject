package kr.co.user.dto;

public class UserDto {
	private String userid,pwd,username,email,m_apply;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	
	public String getM_apply() {
		return m_apply;
	}

	public void setM_apply(String m_apply){
		this.m_apply= m_apply;
	}
	
}
