package kr.co.mock.dto;

public class SellingDto {
	private int s_id,n_selling,bid_spread;
	private String userid,code,s_day;
	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getN_selling() {
		return n_selling;
	}
	public void setN_selling(int n_selling) {
		this.n_selling = n_selling;
	}
	public int getBid_spread() {
		return bid_spread;
	}
	public void setBid_spread(int bid_spread) {
		this.bid_spread = bid_spread;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getS_day() {
		return s_day;
	}
	public void setS_day(String s_day) {
		this.s_day = s_day;
	}

}
