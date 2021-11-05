package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.StockDto;
import kr.co.mock.dto.UserDto;

public interface MockDao {
	public void in_regi_ok(MockDto mdto,String userid,int m_close,int mileage);
	public UserDto login_ok(UserDto udto);
	public MockDto get_enddate(String userid);
	
	//모의투자 리스트
	public ArrayList<StockDto> st_list();
	public StockDto st_content(int id);
	public int get_point(String userid);
	public int search_id(String userid);
	
	//매수매도
	public void buying_ok(String userid,String code,int n_buying,int ask_spread);
	public void selling_ok(String userid,String code,int n_selling,int bid_spread);

	public void mileage_update(String mileage,String userid);
}