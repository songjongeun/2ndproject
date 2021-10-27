package kr.co.mock.dao;

import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.UserDto;

public interface MockDao {
	public void in_regi_ok(MockDto mdto,String userid,int end,int mileage);
	public UserDto login_ok(UserDto udto);

}
