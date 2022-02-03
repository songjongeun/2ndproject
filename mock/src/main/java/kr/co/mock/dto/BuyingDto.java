package kr.co.mock.dto;

public class BuyingDto {
	private int b_id,n_buying,ask_spread;
	private String userid,code,b_day;
	private String name;
	private int total,avg,totalNum;
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getN_buying() {
		return n_buying;
	}
	public void setN_buying(int n_buying) {
		this.n_buying = n_buying;
	}
	public int getAsk_spread() {
		return ask_spread;
	}
	public void setAsk_spread(int ask_spread) {
		this.ask_spread = ask_spread;
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
	public String getB_day() {
		return b_day;
	}
	public void setB_day(String b_day) {
		this.b_day = b_day;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getAvg() {
		return avg;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	
}
