package kr.co.mock.dto;

public class UserDto {
//  사용자 user
	private String userid,pwd,username,email;
// 관심종목interests  관심id 종목코드                userid로 찾기
	private String i_id,code;
// 종목 stocks_a     종목명       code로 찾기
	private String name;
// 실시간종목 realtime  시간id 현재가         대비     총 거래량                 code로 찾기
	private int    r_id,cprice,diff,vol;

	private int err;

	// 사용자
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
		
	// 관심종목

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDiff() {
		return diff;
	}

	public void setDiff(int diff) {
		this.diff = diff;
	}

	public int getVol() {
		return vol;
	}

	public void setVol(int vol) {
		this.vol = vol;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
		
	
	public int getErr() {
		return err;
	}

	public void setErr(int err) {
		this.err = err;
	}
	
}
