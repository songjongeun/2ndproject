package kr.co.user.dao;

import kr.co.user.dto.UserDto;

public interface UserDao {
	public Integer userid_check(String userid);
	public UserDto login_ok(UserDto udto);
	public void member_ok(UserDto udto);
	public UserDto search_ok(UserDto udto);
	
}
