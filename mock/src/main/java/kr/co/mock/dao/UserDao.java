package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.SellingDto;
import kr.co.mock.dto.StockDto;
import kr.co.mock.dto.UserDto;

public interface UserDao {
	public Integer userid_check(String userid);
	public UserDto login_ok(UserDto udto);
	public void member_ok(UserDto udto);
	public UserDto ip_search_ok(UserDto udto);
	public ArrayList<UserDto> my_interests(String userid);
	public UserDto stk_rt(String code);
	public String stocks_names(String code);
	public StockDto my_mocks(String code);
	
	public UserDto mypage(String userid); 
	public UserDto mypage_update(String userid);
	public void mypage_delete(String userid);
	public void mypage_update_ok(UserDto udto); 
	
	public ArrayList<BuyingDto> his_b(String userid);
	public ArrayList<SellingDto> his_s(String userid);
	public ArrayList<BuyingDto> total(String userid);
	public ArrayList<BuyingDto> b_total(String userid);
	
	
	
}
