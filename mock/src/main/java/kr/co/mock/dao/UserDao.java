package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.UserDto;

public interface UserDao {
	public Integer userid_check(String userid);
	public UserDto login_ok(UserDto udto);
	public void member_ok(UserDto udto);
	public UserDto ip_search_ok(UserDto udto);
	public ArrayList<UserDto> my_interests(String userid);
	public UserDto stk_rt(String code);
	public UserDto stocks_names(String code);
	
	public UserDto mypage(String userid); 
	public UserDto mypage_update(String userid);
	public void mypage_delete(String userid);
	public void mypage_update_ok(UserDto udto); 
}
