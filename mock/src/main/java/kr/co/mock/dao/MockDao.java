package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.UserDto;

public interface MockDao {
	public void in_regi_ok(MockDto mdto,String userid,int m_close,int mileage);
	public UserDto login_ok(UserDto udto);
	public ArrayList<MockDto> get_enddate(String userid);

}
