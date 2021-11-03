package kr.co.mock.dao;

import java.util.ArrayList;

import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.Stock1Dto;
import kr.co.mock.dto.UserDto;

public interface MockDao {
	public void in_regi_ok(MockDto mdto,String userid,int m_close,int mileage);
	public UserDto login_ok(UserDto udto);
	public ArrayList<MockDto> get_enddate(String userid);
	
	public ArrayList<Stock1Dto> st_list();
	public ArrayList<Stock1Dto> st_content(int id);
	public int get_point(String userid);
	public int search_id(String userid);
}